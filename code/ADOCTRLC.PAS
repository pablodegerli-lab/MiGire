unit AdoCtrlC;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ADODB, ExtCtrls, stdctrls, Variants;

type
  TInstanciaDestino = (idoDefault, idoBacko, idoGalileo, idoOnline);

  TAdoCtrlPClaves = class(TComponent)
  private
    { Private declarations }
    QryADOSelect: TADOQuery;
    QryADOSelec1: TADOQuery;
    QryADOInsert: TADOQuery;
    QryADOUpdate: TADOQuery;
    QryADODelete: TADOQuery;
    ADOEstados: TADOCommand;
    FMuestroMensaje: Boolean;
    FEmpresa: integer;
    FMensaje_Error: string;
    FConexion: TADOConnection;
    FCodProc_Salida: integer;
    FCodProc_Entrada: integer;
    FEsEntrada: Boolean;
    FClave: string;
    FNoEs999: boolean;
    FFecha_Proceso: TDate;
    FListaEmpresas: TStringList;
    FListaClaves: TStringList;
    FInstanciaDestino: TInstanciaDestino;

    procedure SetClave(const Value: string);
    procedure SetConexion(const Value: TADOConnection);

    procedure Control_Estados(var Resultado: Boolean; var Msg_Err: string);
    procedure CtrlParams(var Resultado: Boolean; var Msg_Err: string; Tipo: string; OList: boolean = False);

    function AgregoEmpresa: string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Autorizado(Cancelados: boolean = False): Boolean;
    function AutorizadoPorClave(cClave: string): Boolean;
    function Finalizado(ConError: boolean = False): Boolean;
    function VueltaAtras: Boolean;

    procedure ObtenerListaClaves;
    procedure ObtenerListaEmpresas(DesdeCia: integer = 999);

    property Fecha_Proceso: TDate read FFecha_Proceso;
    property ListaEmpresas: TStringList read FListaEmpresas;
    property ListaClaves: TStringList read FListaClaves;
  published
    { Published declarations }
    property Clave: string read FClave write SetClave;
    property CodProc_Entrada: integer read FCodProc_Entrada write FCodProc_Entrada default 0;
    property CodProc_Salida: integer read FCodProc_Salida write FCodProc_Salida default 0;
    property Conexion: TADOConnection read FConexion write SetConexion;
    property Empresa: integer read FEmpresa write FEmpresa default 0;
    property EsEntrada: Boolean read FEsEntrada write FEsEntrada default True;
    property Mensaje_Error: string read FMensaje_Error;
    property MuestroMensaje: Boolean read FMuestroMensaje write FMuestroMensaje default False;
    property InstanciaDestino: TInstanciaDestino read FInstanciaDestino write FInstanciaDestino default idoDefault;
  end;

const
  NombreLink: array[0..3] of string = ('', '@COMPONENTE_BK', '@COMPONENTE_GL', '@COMPONENTE_OL');

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire Controles', [TAdoCtrlPClaves]);
end;

{ TAdoCtrlPClaves }

constructor TAdoCtrlPClaves.Create(AOwner: TComponent);
var
  i: Integer;
begin
  for i := 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[I] is TAdoCtrlPClaves then
      raise Exception.Create('No se admite mas de un componente de la clase '
        + '"TAdoCtrlPClaves" por formulario.');
  end;
  inherited Create(AOwner);
  FCodProC_Entrada := 0;
  FCodProc_Salida := 0;
  FEmpresa := 0;
  FEsEntrada := True;
  FMuestroMensaje := False;
  QryADOSelect := TADOQuery.Create(Self);
  QryADOSelec1 := TADOQuery.Create(Self);
  QryADOInsert := TADOQuery.Create(Self);
  QryADOUpdate := TADOQuery.Create(Self);
  QryADODelete := TADOQuery.Create(Self);
  ADOEstados := TADOCommand.Create(Self);
  FListaEmpresas := TStringList.Create;
  FListaEmpresas.Sorted := True;
  FListaClaves := TStringList.Create;
  FListaClaves.Sorted := True;
  FInstanciaDestino := idoDefault;
end;

destructor TAdoCtrlPClaves.Destroy;
begin
  FListaClaves.Free;
  FListaEmpresas.Free;
  QryADOSelect.Free;
  QryADOSelec1.Free;
  QryADOInsert.Free;
  QryADOUpdate.Free;
  QryADODelete.Free;
  ADOEstados.Free;
  QryADOSelect := nil;
  QryADOSelec1 := nil;
  QryADOInsert := nil;
  QryADOUpdate := nil;
  QryADODelete := nil;
  ADOEstados := nil;
  inherited Destroy;
end;

function TAdoCtrlPClaves.Autorizado(Cancelados: boolean): Boolean;
var
  cLinea: string;
  lEncontro: Boolean;
begin
  Result := True;
  cLinea := '';
  lEncontro := False;

  CtrlParams(Result, cLinea, 'A');
  Control_Estados(Result, cLinea);
  if Result then
  begin
    FConexion.BeginTrans;
    try
      if FEsEntrada then
      begin
        QryADOSelect.Close;
        QryADOSelect.SQL.Clear;
        QryADOSelect.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
        QryADOSelect.SQL.Add(' where ' + AgregoEmpresa);
        QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :UNO and ');
        QryADOSelect.SQL.Add('Upper(CLAVE) = :DOS');

        if FNoEs999 then
          QryADOSelect.Parameters.Items[0].Value := FEmpresa;

        QryADOSelect.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Salida;
        QryADOSelect.Parameters.Items[integer(FNoEs999) + 1].Value := UpperCase(FClave);

        QryADOSelect.Open;

        QryADOSelect.First;
        if QryADOSelect.Eof then
        begin
          QryADOInsert.SQL.Clear;
          QryADOInsert.SQL.Add('INSERT INTO ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
          QryADOInsert.SQL.Add(' (COD_CIA, FH_PROCESO, ESTADO_ENTRADA, COD_PROCESO, COD_PROCESO_SALIDA, CLAVE, ESTADO_SALIDA) Values(');
          QryADOInsert.SQL.Add(IntToStr(FEmpresa) + ', Trunc(SYSDATE), 0, ' + IntToStr(CodProc_Entrada) + ', ');
          QryADOInsert.SQL.Add(IntToStr(FCodProc_Salida) + ', ' + '''' + UpperCase(Trim(FClave)) + '''' + ' ,0)');
          QryADOInsert.ExecSQL;
        end
        else
        begin
          Result := False;
          cLinea := 'Ya se encontro otro registro para la empresa ' + IntToStr(FEmpresa)
            + ' con el Codigo Salida ' + IntToStr(FCodProc_Salida) + ' y la Clave ' + FClave + #13#10;
        end;
      end
      else
      begin
        try
          //Bloquear CodProc_Entrada
          QryADOSelect.Close;
          QryADOSelect.SQL.Clear;
          QryADOSelect.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
          QryADOSelect.SQL.Add(' where ' + AgregoEmpresa);
          QryADOSelect.SQL.Add('COD_PROCESO <> :UNO and ');
          QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :DOS and ');

          if Cancelados then
            QryADOSelect.SQL.Add('ESTADO_ENTRADA = 2 and ESTADO_SALIDA = 0')
          else
            QryADOSelect.SQL.Add('ESTADO_ENTRADA = 1 and ESTADO_SALIDA = 0');

          if FNoEs999 then
            QryADOSelect.Parameters.Items[0].Value := FEmpresa;

          QryADOSelect.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Salida;
          QryADOSelect.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;

          QryADOSelect.Open;

          QryADOSelect.First;
          while not QryADOSelect.Eof and not lEncontro do
          begin
            if not lEncontro then
            begin
              QryADOSelec1.Close;
              QryADOSelec1.SQL.Clear;
              QryADOSelec1.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
              QryADOSelec1.SQL.Add(' where COD_CIA = :CERO and ');
              QryADOSelec1.SQL.Add('COD_PROCESO_SALIDA = :UNO and ');
              QryADOSelec1.SQL.Add('COD_PROCESO = COD_PROCESO_SALIDA and ');
              QryADOSelec1.SQL.Add('Upper(CLAVE) = :DOS');

              QryADOSelec1.Parameters.Items[0].Value := QryADOSelect.FieldByName('COD_CIA').AsInteger;
              QryADOSelec1.Parameters.Items[1].Value := QryADOSelect.FieldByName('COD_PROCESO_SALIDA').AsInteger;
              QryADOSelec1.Parameters.Items[2].Value := UpperCase(QryADOSelect.FieldValues['CLAVE']);

              QryADOSelec1.Open;

              if QryADOSelec1.Eof then
              begin
                lEncontro := True;
                FEmpresa := QryADOSelect.FieldValues['COD_CIA'];
                FClave := QryADOSelect.FieldValues['CLAVE'];
                FCodProc_Entrada := QryADOSelect.FieldValues['COD_PROCESO'];
                FFecha_Proceso := QryADOSelect.FieldValues['FH_PROCESO'];
                QryADOInsert.SQL.Clear;
                QryADOInsert.SQL.Add('INSERT INTO ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
                QryADOInsert.SQL.Add(' (COD_CIA, FH_PROCESO, ESTADO_ENTRADA, COD_PROCESO, COD_PROCESO_SALIDA, CLAVE, ESTADO_SALIDA) Values(');
                QryADOInsert.SQL.Add(IntToStr(FEmpresa) + ', Trunc(SYSDATE), 0, ' + IntToStr(CodProc_Salida) + ', ');
                QryADOInsert.SQL.Add(IntToStr(FCodProc_Salida) + ', ' + '''' + UpperCase(FClave) + '''' + ' ,0)');
                QryADOInsert.ExecSQL;
              end
            end;
            QryADOSelect.Next;
          end;

          if not lEncontro then
          begin
            Result := False;
            cLinea := 'No se encontro archivo para procesar para codigo de proceso ' + IntToStr(FCodProc_Salida);
          end;
        finally
          QryADOSelect.Close;
          QryADOSelec1.Close;
        end;
      end;
    except
      on e: Exception do
      begin
        Result := False;
        cLinea := 'Se produjo el siguiente error ' + e.Message + ' al autorizar el proceso ' + IntToStr(FCodProc_Entrada) +
          ', no se grabó en tabla GIRE.ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)];
      end;
    end;
    FConexion.CommitTrans;
  end;

  FMensaje_Error := cLinea;

  if (not Result) and FMuestroMensaje then
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos por Claves'), 16)

end;

function TAdoCtrlPClaves.Finalizado(ConError: boolean): Boolean;
var
  cLinea: string;
begin
  Result := True;
  cLinea := '';

  CtrlParams(Result, cLinea, 'F');
  Control_Estados(Result, cLinea);
  if Result then
  begin
    FConexion.BeginTrans;
    try
      if EsEntrada then
      begin
        QryADOSelect.Close;
        QryADOSelect.SQL.Clear;
        QryADOSelect.SQL.Add('SELECT * FROM ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
        QryADOSelect.SQL.Add(' WHERE ' + AgregoEmpresa);
        QryADOSelect.SQL.Add('COD_PROCESO = :UNO AND ');
        QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :DOS AND Upper(CLAVE) = :TRES AND ');
        QryADOSelect.SQL.Add('ESTADO_ENTRADA = 0');

        if FNoEs999 then
          QryADOSelect.Parameters.Items[0].Value := FEmpresa;

        QryADOSelect.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Entrada;
        QryADOSelect.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
        QryADOSelect.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

        QryADOSelect.Open;

        if QryADOSelect.RecordCount > 0 then
        begin
          QryADOUpdate.SQL.Clear;
          if ConError then
            QryADOUpdate.SQL.Add('UPDATE ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + ' SET ESTADO_ENTRADA = 2 ')
          else
            QryADOUpdate.SQL.Add('UPDATE ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + ' SET ESTADO_ENTRADA = 1 ');

          QryADOUpdate.SQL.Add('WHERE ' + AgregoEmpresa);
          QryADOUpdate.SQL.Add('COD_PROCESO = :UNO AND ');
          QryADOUpdate.SQL.Add('COD_PROCESO_SALIDA = :DOS AND ');
          QryADOUpdate.SQL.Add('Upper(CLAVE) = :TRES');

          if FNoEs999 then
            QryADOUpdate.Parameters.Items[0].Value := FEmpresa;

          QryADOUpdate.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Entrada;
          QryADOUpdate.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
          QryADOUpdate.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

          QryADOUpdate.ExecSQL;
        end
        else
        begin
          Result := False;
          cLinea := 'No se encuentra el registro para finalizar';
        end;
        QryADOSelect.Close;
      end
      else
      begin
        QryADOSelect.Close;
        QryADOSelect.SQL.Clear;
        QryADOSelect.SQL.Add('SELECT * FROM ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
        QryADOSelect.SQL.Add(' WHERE ' + AgregoEmpresa);
        QryADOSelect.SQL.Add('COD_PROCESO = :UNO AND ');
        QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :DOS AND Upper(CLAVE) = :TRES AND ');
        QryADOSelect.SQL.Add('ESTADO_SALIDA = 0');

        if FNoEs999 then
          QryADOSelect.Parameters.Items[0].Value := FEmpresa;

        QryADOSelect.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Salida;
        QryADOSelect.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
        QryADOSelect.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

        QryADOSelect.Open;

        if QryADOSelect.RecordCount > 0 then
        begin
          QryADOUpdate.SQL.Clear;
          if ConError then ///Modificado 18/05/2004
          begin
            QryADOUpdate.SQL.Add('UPDATE ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + ' SET ESTADO_ENTRADA = 2, ');
            QryADOUpdate.SQL.Add('ESTADO_SALIDA = 0 ');
          end
          else
          begin
            QryADOUpdate.SQL.Add('UPDATE ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + ' SET ESTADO_ENTRADA = 1, ');
            QryADOUpdate.SQL.Add('ESTADO_SALIDA = 1 ');
          end;

          QryADOUpdate.SQL.Add('WHERE ' + AgregoEmpresa);
          QryADOUpdate.SQL.Add('COD_PROCESO = :UNO AND ');
          QryADOUpdate.SQL.Add('COD_PROCESO_SALIDA = :DOS AND ');
          QryADOUpdate.SQL.Add('Upper(CLAVE) = :TRES');

          if FNoEs999 then
            QryADOUpdate.Parameters.Items[0].Value := FEmpresa;

          QryADOUpdate.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Salida;
          QryADOUpdate.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
          QryADOUpdate.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

          QryADOUpdate.ExecSQL;

          if not ConError then
          begin
            QryADOUpdate.SQL.Clear;
            QryADOUpdate.SQL.Add('UPDATE ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + ' SET ESTADO_SALIDA = 1 ');
            QryADOUpdate.SQL.Add('WHERE ' + AgregoEmpresa);
            QryADOUpdate.SQL.Add('COD_PROCESO = :UNO AND ');
            QryADOUpdate.SQL.Add('COD_PROCESO_SALIDA = :DOS AND ');
            QryADOUpdate.SQL.Add('Upper(CLAVE) = :TRES');

            if FNoEs999 then
              QryADOUpdate.Parameters.Items[0].Value := FEmpresa;

            QryADOUpdate.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Entrada;
            QryADOUpdate.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
            QryADOUpdate.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

            QryADOUpdate.ExecSQL;
          end;
        end
        else
        begin
          Result := False;
          cLinea := 'No se encuentra el registro para finalizar';
        end;
        QryADOSelect.Close;
      end;
      FConexion.CommitTrans;
    except
      on e: Exception do
      begin
        Result := False;
        cLinea := 'Se produjo el siguiente error ' + e.Message + ' al finalizar el proceso ' + IntToStr(FCodProc_Entrada) +
          ', no se grabó en tabla GIRE.ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)];
      end;
    end;
  end;
  FMensaje_Error := cLinea;

  if (not Result) and FMuestroMensaje then
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos por Claves'), 16)

end;

function TAdoCtrlPClaves.VueltaAtras: Boolean;
var
  cLinea: string;
  Codigo_Proc: Integer;
begin
  Result := True;
  cLinea := '';

  if EsEntrada then
    Codigo_Proc := FCodProc_Entrada
  else
    Codigo_Proc := FCodProc_Salida;

  CtrlParams(Result, cLinea, 'V');
  Control_Estados(Result, cLinea);
  if Result then
  begin
    QryADOSelect.Close;
    QryADOSelect.SQL.Clear;
    QryADOSelect.SQL.Add('SELECT * FROM ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
    QryADOSelect.SQL.Add(' WHERE ' + AgregoEmpresa);
    QryADOSelect.SQL.Add('COD_PROCESO = :UNO AND ');
    QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :DOS AND Upper(CLAVE) = :TRES');

    if FNoEs999 then
      QryADOSelect.Parameters.Items[0].Value := FEmpresa;

    QryADOSelect.Parameters.Items[integer(FNoEs999)].Value := Codigo_Proc;
    QryADOSelect.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
    QryADOSelect.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

    QryADOSelect.Open;

    if QryADOSelect.RecordCount > 0 then
    begin
      FConexion.BeginTrans;
      try
        if EsEntrada and (QryADOSelect.FieldValues['ESTADO_ENTRADA'] = 1) and
          (QryADOSelect.FieldValues['ESTADO_SALIDA'] = 0) then
        begin
          Result := False;
          cLinea := 'Este registro ya esta finalizado, no se puede volver atras '
        end;

        if EsEntrada and (QryADOSelect.FieldValues['ESTADO_ENTRADA'] = 0) and
          (QryADOSelect.FieldValues['ESTADO_SALIDA'] = 0) then
        begin
          QryADODelete.SQL.Clear;
          QryADODelete.SQL.Add('DELETE FROM ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
          QryADODelete.SQL.Add(' WHERE ' + AgregoEmpresa);
          QryADODelete.SQL.Add('COD_PROCESO = :UNO AND ');
          QryADODelete.SQL.Add('COD_PROCESO_SALIDA = :DOS AND ');
          QryADODelete.SQL.Add('Upper(CLAVE) = :TRES');

          if FNoEs999 then
            QryADODelete.Parameters.Items[0].Value := FEmpresa;

          QryADODelete.Parameters.Items[integer(FNoEs999)].Value := Codigo_Proc;
          QryADODelete.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
          QryADODelete.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

          QryADODelete.ExecSQL;
        end;

        if not EsEntrada then
        begin
          if (QryADOSelect.FieldValues['ESTADO_ENTRADA'] = 0) and
            (QryADOSelect.FieldValues['ESTADO_SALIDA'] = 0) then
          begin
            QryADODelete.SQL.Clear;
            QryADODelete.SQL.Add('DELETE FROM ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
            QryADODelete.SQL.Add(' WHERE ' + AgregoEmpresa);
            QryADODelete.SQL.Add('COD_PROCESO = :UNO AND ');
            QryADODelete.SQL.Add('COD_PROCESO_SALIDA = :DOS AND ');
            QryADODelete.SQL.Add('Upper(CLAVE) = :TRES');

            if FNoEs999 then
              QryADODelete.Parameters.Items[0].Value := FEmpresa;

            QryADODelete.Parameters.Items[integer(FNoEs999)].Value := Codigo_Proc;
            QryADODelete.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
            QryADODelete.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

            QryADODelete.ExecSQL;

            QryADOUpdate.SQL.Clear;
            QryADOUpdate.SQL.Add('UPDATE ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + ' SET ESTADO_SALIDA = 0 ');
            QryADOUpdate.SQL.Add('WHERE ' + AgregoEmpresa);
            QryADOUpdate.SQL.Add('COD_PROCESO = :UNO AND ');
            QryADOUpdate.SQL.Add('COD_PROCESO_SALIDA = :DOS AND ');
            QryADOUpdate.SQL.Add('Upper(CLAVE) = :TRES');

            if FNoEs999 then
              QryADOUpdate.Parameters.Items[0].Value := FEmpresa;

            QryADOUpdate.Parameters.Items[integer(FNoEs999)].Value := FCodProc_Entrada;
            QryADOUpdate.Parameters.Items[integer(FNoEs999) + 1].Value := FCodProc_Salida;
            QryADOUpdate.Parameters.Items[integer(FNoEs999) + 2].Value := UpperCase(FClave);

            QryADOUpdate.ExecSQL;
          end
          else
          begin
            Result := False;
            cLinea := 'Este registro ya esta finalizado, no se puede volver atras '
          end;
        end;
        FConexion.CommitTrans;
      except
        on e: Exception do
        begin
          Result := False;
          cLinea := 'Se produjo el siguiente Error ' + e.Message + ' al dar vuelta atrás el proceso ' + IntToStr(FCodProc_Entrada) +
            ' para la tabla GIRE.ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)];
        end;
      end;
    end
    else
    begin
      Result := False;
      cLinea := 'No se encuentra el registro para borrar';
    end;
  end;
  FMensaje_Error := cLinea;

  if (not Result) and FMuestroMensaje then
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos por Claves'), 16)

end;

procedure TAdoCtrlPClaves.CtrlParams(var Resultado: Boolean; var Msg_Err: string; Tipo: string; OList: boolean);
begin
  if Resultado then
  begin
    if (FConexion = nil) then
    begin
      Msg_Err := Msg_Err + 'No se ha ingresado la conexion.' + #13#10;
      Resultado := False;
    end;

    if (FCodProc_Salida = 0) then
    begin
      Msg_Err := Msg_Err + 'No se ha ingresado el codigo de proceso de Salida.' + #13#10;
      Resultado := False;
    end;

    if (FCodProc_Entrada = 0) and FEsEntrada then
    begin
      Msg_Err := Msg_Err + 'No se ha ingresado el codigo de proceso de Entrada.' + #13#10;
      Resultado := False;
    end;

    if (Trim(FClave) = '') and FEsEntrada then
    begin
      Msg_Err := Msg_Err + 'No se ha ingresado la clave.' + #13#10;
      Resultado := False;
    end;

    if (Trim(FClave) = '') and not (FEsEntrada) and
      ((UpperCase(Trim(Tipo)) = 'F') or (UpperCase(Trim(Tipo)) = 'V')) then
    begin
      Msg_Err := Msg_Err + 'No se ha ingresado la clave.' + #13#10;
      Resultado := False;
    end;

    if (FCodProc_Entrada = 0) and not (FEsEntrada) and (UpperCase(Trim(Tipo)) = 'V') then
    begin
      Msg_Err := Msg_Err + 'No se ha ingresado el codigo de proceso de Entrada.' + #13#10;
      Resultado := False;
    end;

    if ((FEmpresa = NULL) or (FEmpresa = 0)) and (not OList) then
    begin
      Msg_Err := Msg_Err + 'No se ha ingresado el codigo de Empresa.' + #13#10;
      Resultado := False;
    end;

    if (FEmpresa = 999) and ((UpperCase(Trim(Tipo)) = 'F') or (UpperCase(Trim(Tipo)) = 'V') or (FEsEntrada)) then
    begin
      Msg_Err := Msg_Err + 'Se debe especificar el codigo de Empresa.' + #13#10;
      Resultado := False;
    end;
  end;
end;

procedure TAdoCtrlPClaves.Control_Estados(var Resultado: Boolean; var Msg_Err: string);
var
  lControl: Boolean;
  Contador: integer;
  FormInfo: TForm;
  TextoInfo: TPanel;
  TextoTime: TPanel;
  PanelFondo: TPanel;
begin
  FormInfo := nil;
  TextoTime := nil;

  if Resultado then
  begin
    ADOEstados.CommandType := cmdText;
    ADOEstados.CommandText := 'Lock Table ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + ' in Exclusive Mode NoWait';
    lControl := True;
    contador := 0;
    while lControl do
    begin
      try
        ADOEstados.Execute;
        lControl := False;
      except
        if Contador = 0 then
        begin
          FormInfo := TForm.Create(Application);
          FormInfo.Width := 300;
          FormInfo.Height := 100;
          FormInfo.FormStyle := fsStayOnTop;
          FormInfo.Position := poScreenCenter;
          FormInfo.BorderStyle := bsNone;
          PanelFondo := TPanel.Create(FormInfo);
          PanelFondo.Parent := FormInfo;
          PanelFondo.BorderStyle := bsSingle;
          PanelFondo.Align := alClient;
          PanelFondo.BorderWidth := 4;
          PanelFondo.Color := clRed;
          TextoInfo := TPanel.Create(PanelFondo);
          TextoInfo.Parent := PanelFondo;
          TextoInfo.Height := 50;
          TextoInfo.Font.Size := 10;
          TextoInfo.Font.Style := [fsBold];
          TextoInfo.BevelInner := bvLowered;
          TextoInfo.Caption := 'Intentando bloquear la base ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)];
          TextoInfo.Align := alTop;
          TextoInfo.Color := clAqua;
          TextoTime := TPanel.Create(PanelFondo);
          TextoTime.Parent := PanelFondo;
          TextoTime.Height := 50;
          TextoTime.Font.Size := 10;
          TextoTime.Font.Style := [fsBold];
          TextoTime.BevelInner := bvLowered;
          TextoTime.Align := alBottom;
          TextoTime.Color := clAqua;
          FormInfo.Show;
        end;
        TextoTime.Caption := 'Tiempo transcurrido : ' +
          IntToStr(Contador) + ' segundos.';
        FormInfo.Refresh;
        sleep(1000);
        Inc(Contador);
        if contador > 15 then
        begin
          lControl := False;
          Resultado := False;
          Msg_Err := Msg_Err + 'No se pudo abrir GIRE.ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)] + '.' + #13#10;
        end;
      end;
    end;
  end;

  if FormInfo <> nil then
  begin
    FormInfo.Close;
    FormInfo.Free;
  end;
end;

function TAdoCtrlPClaves.AgregoEmpresa: string;
begin
  FNoEs999 := True;
  if FEmpresa = 999 then
  begin
    FNoEs999 := False;
    Result := '';
  end
  else
    Result := ' COD_CIA = :CERO AND ';
end;

procedure TAdoCtrlPClaves.SetConexion(const Value: TADOConnection);
begin
  FConexion := Value;
  QryADOSelect.Connection := FConexion;
  QryADOSelec1.Connection := FConexion;
  QryADOInsert.Connection := FConexion;
  QryADOUpdate.Connection := FConexion;
  QryADODelete.Connection := FConexion;
  ADOEstados.Connection := FConexion;
end;

procedure TAdoCtrlPClaves.SetClave(const Value: string);
begin
  FClave := UpperCase(Value);
end;

procedure TAdoCtrlPClaves.ObtenerListaEmpresas(DesdeCia: integer);
var
  cLinea: string;
  Seguir: boolean;
  ParaAdd: string;
begin

  if DesdeCia = 999 then
    DesdeCia := 0;
  FListaEmpresas.Clear;

  Seguir := True;
  cLinea := '';

  CtrlParams(Seguir, cLinea, 'A', True);
  Control_Estados(Seguir, cLinea);
  if Seguir then
  begin
    FConexion.BeginTrans;
    try
      try
        QryADOSelect.Close;
        QryADOSelect.SQL.Clear;
        QryADOSelect.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
        QryADOSelect.SQL.Add(' where COD_CIA > :CERO and ');
        QryADOSelect.SQL.Add('COD_PROCESO <> :UNO and ');
        QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :DOS and ');
        QryADOSelect.SQL.Add('ESTADO_ENTRADA = 1 and ESTADO_SALIDA = 0');

        QryADOSelect.Parameters.Items[0].Value := DesdeCia;
        QryADOSelect.Parameters.Items[1].Value := FCodProc_Salida;
        QryADOSelect.Parameters.Items[2].Value := FCodProc_Salida;

        QryADOSelect.Open;

        QryADOSelect.First;
        while not QryADOSelect.Eof do
        begin
          QryADOSelec1.Close;
          QryADOSelec1.SQL.Clear;
          QryADOSelec1.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
          QryADOSelec1.SQL.Add(' where COD_CIA = :CERO and ');
          QryADOSelec1.SQL.Add('COD_PROCESO_SALIDA = :UNO and ');
          QryADOSelec1.SQL.Add('COD_PROCESO = COD_PROCESO_SALIDA and ');
          QryADOSelec1.SQL.Add('Upper(CLAVE) = :DOS');

          QryADOSelec1.Parameters.Items[0].Value := QryADOSelect.FieldByName('COD_CIA').AsInteger;
          QryADOSelec1.Parameters.Items[1].Value := QryADOSelect.FieldByName('COD_PROCESO_SALIDA').AsInteger;
          QryADOSelec1.Parameters.Items[2].Value := UpperCase(QryADOSelect.FieldValues['CLAVE']);

          QryADOSelec1.Open;

          if QryADOSelec1.Eof then
          begin
            ParaAdd := IntToStr(QryADOSelect.FieldValues['COD_CIA']);
            if FListaEmpresas.IndexOf(ParaAdd) = -1 then
              FListaEmpresas.Add(ParaAdd);
          end;

          QryADOSelect.Next;
        end;

      finally
        QryADOSelect.Close;
        QryADOSelec1.Close;
      end;

    except
      on e: Exception do
      begin
        cLinea := 'Al intentar obtener el listado de empresas, se produjo el siguiente error:'
          + #13#10 + e.Message;
      end;
    end;

    FConexion.CommitTrans;
  end;

  FMensaje_Error := cLinea;

  if (not Seguir) and FMuestroMensaje then
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos por Claves'), 16)

end;

procedure TAdoCtrlPClaves.ObtenerListaClaves;
var
  cLinea: string;
  Seguir: boolean;
begin

  FListaClaves.Clear;
  Seguir := True;
  cLinea := '';
  CtrlParams(Seguir, cLinea, 'A', False);
  Control_Estados(Seguir, cLinea);
  if Seguir then
  begin
    FConexion.BeginTrans;
    try
      try
        QryADOSelect.Close;
        QryADOSelect.SQL.Clear;
        QryADOSelect.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
        QryADOSelect.SQL.Add(' where COD_CIA = :CERO and ');
        QryADOSelect.SQL.Add('COD_PROCESO <> :UNO and ');
        QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :DOS and ');
        QryADOSelect.SQL.Add('ESTADO_ENTRADA = 1 and ESTADO_SALIDA = 0');

        QryADOSelect.Parameters.Items[0].Value := FEmpresa;
        QryADOSelect.Parameters.Items[1].Value := FCodProc_Salida;
        QryADOSelect.Parameters.Items[2].Value := FCodProc_Salida;

        QryADOSelect.Open;

        QryADOSelect.First;
        while not QryADOSelect.Eof do
        begin
          QryADOSelec1.Close;
          QryADOSelec1.SQL.Clear;
          QryADOSelec1.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
          QryADOSelec1.SQL.Add(' where COD_CIA = :CERO and ');
          QryADOSelec1.SQL.Add('COD_PROCESO_SALIDA = :UNO and ');
          QryADOSelec1.SQL.Add('COD_PROCESO = COD_PROCESO_SALIDA and ');
          QryADOSelec1.SQL.Add('Upper(CLAVE) = :DOS');

          QryADOSelec1.Parameters.Items[0].Value := QryADOSelect.FieldByName('COD_CIA').AsInteger;
          QryADOSelec1.Parameters.Items[1].Value := QryADOSelect.FieldByName('COD_PROCESO_SALIDA').AsInteger;
          QryADOSelec1.Parameters.Items[2].Value := UpperCase(QryADOSelect.FieldValues['CLAVE']);

          QryADOSelec1.Open;

          if QryADOSelec1.Eof then
            FListaClaves.Add(UpperCase(QryADOSelect.FieldValues['CLAVE']));

          QryADOSelect.Next;
        end;

      finally
        QryADOSelect.Close;
        QryADOSelec1.Close;
      end;

    except
      on e: Exception do
      begin
        cLinea := 'Al intentar obtener el listado de claves, se produjo el siguiente error:'
          + #13#10 + e.Message;
      end;
    end;

    FConexion.CommitTrans;
  end;

  FMensaje_Error := cLinea;

  if (not Seguir) and FMuestroMensaje then
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos por Claves'), 16)

end;

function TAdoCtrlPClaves.AutorizadoPorClave(cClave: string): Boolean;
var
  cLinea: string;
  lEncontro: Boolean;
begin
  Result := True;
  cLinea := '';
  lEncontro := False;

  CtrlParams(Result, cLinea, 'A');
  Control_Estados(Result, cLinea);
  if Result then
  begin
    FConexion.BeginTrans;
    try
      if FEsEntrada then
      begin
        Result := False;
        cLinea := 'La autorizacion por clave, no es aplicable a procesos de entrada.';
      end
      else
      begin
        try
          QryADOSelect.Close;
          QryADOSelect.SQL.Clear;
          QryADOSelect.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
          QryADOSelect.SQL.Add(' where COD_CIA = :CERO and ');
          QryADOSelect.SQL.Add('COD_PROCESO <> :UNO and ');
          QryADOSelect.SQL.Add('COD_PROCESO_SALIDA = :DOS and ');
          QryADOSelect.SQL.Add('ESTADO_ENTRADA = 1 and ESTADO_SALIDA = 0 and ');
          QryADOSelect.SQL.Add('Upper(CLAVE) = :TRES');

          QryADOSelect.Parameters.Items[0].Value := FEmpresa;
          QryADOSelect.Parameters.Items[1].Value := FCodProc_Salida;
          QryADOSelect.Parameters.Items[2].Value := FCodProc_Salida;
          QryADOSelect.Parameters.Items[3].Value := cClave;

          QryADOSelect.Open;
          if not QryADOSelect.Eof then
          begin
            QryADOSelec1.Close;
            QryADOSelec1.SQL.Clear;
            QryADOSelec1.SQL.Add('Select * from ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
            QryADOSelec1.SQL.Add(' where COD_CIA = :CERO and ');
            QryADOSelec1.SQL.Add('COD_PROCESO_SALIDA = :UNO and ');
            QryADOSelec1.SQL.Add('COD_PROCESO = COD_PROCESO_SALIDA and ');
            QryADOSelec1.SQL.Add('Upper(CLAVE) = :DOS');

            QryADOSelec1.Parameters.Items[0].Value := QryADOSelect.FieldByName('COD_CIA').AsInteger;
            QryADOSelec1.Parameters.Items[1].Value := QryADOSelect.FieldByName('COD_PROCESO_SALIDA').AsInteger;
            QryADOSelec1.Parameters.Items[2].Value := UpperCase(QryADOSelect.FieldValues['CLAVE']);

            QryADOSelec1.Open;
            if QryADOSelec1.Eof then
            begin
              lEncontro := True;
              FEmpresa := QryADOSelect.FieldValues['COD_CIA'];
              FClave := QryADOSelect.FieldValues['CLAVE'];
              FCodProc_Entrada := QryADOSelect.FieldValues['COD_PROCESO'];
              FFecha_Proceso := QryADOSelect.FieldValues['FH_PROCESO'];
              QryADOInsert.SQL.Clear;
              QryADOInsert.SQL.Add('INSERT INTO ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)]);
              QryADOInsert.SQL.Add(' (COD_CIA, FH_PROCESO, ESTADO_ENTRADA, COD_PROCESO, COD_PROCESO_SALIDA, CLAVE, ESTADO_SALIDA) Values(');
              QryADOInsert.SQL.Add(IntToStr(FEmpresa) + ', Trunc(SYSDATE), 0, ' + IntToStr(CodProc_Salida) + ', ');
              QryADOInsert.SQL.Add(IntToStr(FCodProc_Salida) + ', ' + '''' + UpperCase(FClave) + '''' + ' ,0)');
              QryADOInsert.ExecSQL;
            end
          end;

          if not lEncontro then
          begin
            Result := False;
            cLinea := 'No se encontro proceso para autorizar con la clave ' + cClave;
          end;
        finally
          QryADOSelect.Close;
          QryADOSelec1.Close;
        end;
      end;
    except
      on e: Exception do
      begin
        Result := False;
        cLinea := 'Se produjo el siguiente error ' + e.Message + ' al autorizar la clave ' + cClave +
          ', no se grabó en tabla GIRE.ORDEN_PROCESOS_CLAVE' + NombreLink[Ord(FInstanciaDestino)];
      end;
    end;
    FConexion.CommitTrans;
  end;

  FMensaje_Error := cLinea;

  if (not Result) and FMuestroMensaje then
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos por Claves'), 16)

end;

end.

