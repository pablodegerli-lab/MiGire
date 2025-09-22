unit ADOCtrlP;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ADODB, ExtCtrls, stdctrls;

type
  TInstanciaDestino = (idoDefault, idoBacko, idoGalileo, idoOnline);

  TADOCtrlProcesos = class(TComponent)
  private
    { Private declarations }
    QueryADOCtrl: TADOQuery;
    QryADOEstado: TADOQuery;
    QryADOProcesos: TADOQuery;
    ADOEstados: TADOCommand;
    ParaVueltaAtras: Char;
    FConexion: TADOConnection;
    FEmpresa: integer;
    FShowErrorMsg: Boolean;
    FProcesosRelacionados: Integer;
    FNroProceso: integer;
    FCodProceso: integer;
    FFH_Proceso: TDate;
    FStringError: string;
    FFH_Proceso_Anterior: TDate;
    FInstanciaDestino: TInstanciaDestino;
    procedure SetConexion(const Value: TADOConnection);
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Empresa: integer read FEmpresa write FEmpresa default 0;
    property FH_Proceso: TDate read FFH_Proceso write FFH_Proceso;
    property FH_Proceso_Anterior: TDate read FFH_Proceso_Anterior write FFH_Proceso_Anterior;
    property StringError: string read FStringError;
    function Autorizado: Boolean;
    function BorrarEstados(EmpresaDel, CodProcesoDel, NroProcesoDel: integer; FH_ProcesoDel: TDate): Boolean;
    function Finalizado: Boolean;
    function Testeo: Boolean;
    function VueltaAtras: Boolean;
  published
    { Published declarations }
    property Conexion: TADOConnection read FConexion write SetConexion;
    property NroProceso: integer read FNroProceso write FNroProceso default 1;
    property CodProceso: integer read FCodProceso write FCodProceso default 0;
    property ShowErrorMsg: Boolean read FShowErrorMsg write FShowErrorMsg default True;
    property ProcesosRelacionados: Integer read FProcesosRelacionados write FProcesosRelacionados default 1;
    property InstanciaDestino: TInstanciaDestino read FInstanciaDestino write FInstanciaDestino default idoDefault;
  end;

const
  NombreLink: array[0..3] of string = ('', '@COMPONENTE_BK', '@COMPONENTE_GL', '@COMPONENTE_OL');

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire Controles', [TADOCtrlProcesos]);
end;

{ TADOCtrlProcesos }

function TADOCtrlProcesos.Autorizado: Boolean;
var
  cLinea: string;
  lControl: Boolean;
  Contador: integer;
  FormInfo: TForm;
  TextoInfo: TPanel;
  TextoTime: TPanel;
  PanelFondo: TPanel;
begin
  FormInfo := nil;
  TextoTime := nil;
  Result := True;
  cLinea := '';

  Conexion.BeginTrans;
  if FFH_Proceso = 0 then
  begin
    cLinea := cLinea + 'No se ha ingresado la fecha del proceso.' + #13#10;
    Result := False;
  end;

  if FProcesosRelacionados < FNroProceso then
  begin
    cLinea := cLinea + 'La cantidad de procesos relacionados no pueden ser menor al nro de proceso.' + #13#10;
    Result := False;
  end;

  if Result then
  begin
    ADOEstados.CommandType := cmdText;
    ADOEstados.CommandText := 'Lock Table ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + ' in Exclusive Mode NoWait';
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
          TextoInfo.Caption := 'Intentando bloquear la base ESTADOS' + NombreLink[Ord(FInstanciaDestino)];
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
        TextoTime.Caption := 'Tiempo transcurrido : '
          + IntToStr(Contador) + ' segundos.';
        FormInfo.Refresh;
        sleep(1000);
        Inc(Contador);
        if contador > 15 then
        begin
          lControl := False;
          Result := False;
          cLinea := cLinea + 'No se pudo abrir GIRE.ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + '.' + #13#10;
        end;

      end;
    end;
  end;

  if FormInfo <> nil then
  begin
    FormInfo.Close;
    FormInfo.Free;
    // Debería asignar nil a FormInfo.
  end;

  if Result then
  begin
    QueryADOCtrl.Close;
    QueryADOCtrl.SQL.Clear;
    QueryADOCtrl.SQL.Text := 'Select * From ORDEN_PROCESOS' + NombreLink[Ord(FInstanciaDestino)]
      + ' Where Cod_Proceso = :CERO and Nro_Proceso = :UNO and Nro_proceso_relacionado <= :TRES';
    QueryADOCtrl.Parameters.Items[0].Value := FCodProceso;
    QueryADOCtrl.Parameters.Items[1].Value := FNroProceso;
    QueryADOCtrl.Parameters.Items[2].Value := FProcesosRelacionados;
    try
      QueryADOCtrl.Open;
      if QueryADOCtrl.RecordCount = 0 then
      begin
        Result := False;
        cLinea := cLinea + 'GIRE.ORDEN_PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + #13#10#13#10;
        cLinea := cLinea + 'No se localizaron registros que cumplan la condición :' + #13#10;
        cLinea := cLinea + 'Código de proceso = ' + IntToStr(FCodProceso) + ' y ';
        cLinea := cLinea + 'Número de proceso = ' + IntToStr(FNroProceso) + #13#10;
        cLinea := cLinea + 'Número de proceso relacionado = ' + IntToStr(FProcesosRelacionados) + #13#10;
      end;
    except
      Result := False;
      cLinea := cLinea + 'No se pudo operar con la base GIRE.ORDEN_PROCESOS' + NombreLink[Ord(FInstanciaDestino)];
    end;
  end;

  if Result then
  begin
    QueryADOCtrl.First;

    while not QueryADOCtrl.Eof do
    begin

      if QueryADOCtrl.FieldByName('PROHIBIDO').Value <> 0 then
      begin
        QryADOEstado.Close;
        QryADOEstado.SQL.Clear;
        QryADOEstado.SQL.Text := 'Select * From ESTADOS' + NombreLink[Ord(FInstanciaDestino)]
          + ' Where Empresa = :CERO'
          + ' and NRO_Proceso = :UNO'
          + ' and Cod_Proceso = :DOS'
          + ' and ESTADO = 0';

        QryADOEstado.Parameters.Items[0].Value := FEmpresa;
        QryADOEstado.Parameters.Items[1].Value := FNroProceso;
        if FProcesosRelacionados > 1 then
            QryADOEstado.Parameters.Items[1].Value := QueryADOCtrl.FieldByName('Nro_Proceso_Relacionado').AsInteger;
        QryADOEstado.Parameters.Items[2].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

        QryADOEstado.Open;

        if QryADOEstado.RecordCount > 0 then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)]
            + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Inhabilitado por estar realizándose el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      QryADOEstado.Close;
      QryADOEstado.SQL.Clear;
      QryADOEstado.SQL.Text := 'Select * From ESTADOS' + NombreLink[Ord(FInstanciaDestino)]
        + ' Where Empresa = :CERO'
        + ' and FH_Proceso = :UNO'
        + ' and NRO_Proceso = :DOS'
        + ' and Cod_Proceso = :TRES';

      QryADOEstado.Parameters.Items[0].Value := FEmpresa;

      if QueryADOCtrl.FieldByName('CONTROL_FECHA').Value <> 0 then
        QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso_Anterior)
      else
        QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);

      QryADOEstado.Parameters.Items[2].Value := FNroProceso;
      if FProcesosRelacionados > 1 then
         QryADOEstado.Parameters.Items[2].Value := QueryADOCtrl.FieldByName('Nro_Proceso_Relacionado').AsInteger;
      QryADOEstado.Parameters.Items[3].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

      QryADOEstado.Open;

      if QueryADOCtrl.FieldByName('FINALIZADO').Value <> 0 then
      begin
        if (QryADOEstado.RecordCount > 0) and
          (QryADOEstado.FieldByName('ESTADO').Value = 0) then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;

          cLinea := cLinea + 'Falta realizar el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('SIMULTANEO').Value <> 0 then
      begin
        if (QryADOEstado.RecordCount > 0) and
          (QryADOEstado.FieldByName('ESTADO').Value = 0) then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Ya se está realizando el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('CUMPLE').Value <> 0 then
      begin
        if QryADOEstado.RecordCount = 0 then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'No se cumple el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('REPROCESO').Value <> 0 then
      begin
        if QryADOEstado.RecordCount <> 0 then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Reproceso inhabilitado por el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('OBLIGATORIO').Value <> 0 then
      begin
        if (QryADOEstado.RecordCount = 0) or ((QryADOEstado.RecordCount > 0) and
          (QryADOEstado.FieldByName('ESTADO').Value = 0)) then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Para este proceso es obligatorio el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      QueryADOCtrl.Next;
    end;
  end;

  if Result then
  begin
    QryADOEstado.Close;
    QryADOEstado.SQL.Clear;
    QryADOEstado.SQL.Text := 'Select * From ESTADOS' + NombreLink[Ord(FInstanciaDestino)]
      + ' Where Empresa = :CERO'
      + ' and FH_Proceso = :UNO'
      + ' and NRO_Proceso = :DOS'
      + ' and Cod_Proceso = :TRES';

    QryADOEstado.Parameters.Items[0].Value := FEmpresa;
    QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);
    QryADOEstado.Parameters.Items[2].Value := FNroProceso;
    QryADOEstado.Parameters.Items[3].Value := FCodProceso;

    QryADOEstado.Open;
    if QryADOEstado.RecordCount = 0 then
    begin
      ParaVueltaAtras := 'N';
      QryADOEstado.Close;
      QryADOEstado.SQL.Clear;
      QryADOEstado.SQL.Add('INSERT INTO ESTADOS' + NombreLink[Ord(FInstanciaDestino)]);
      QryADOEstado.SQL.Add(' ( Empresa, FH_Proceso, Estado, Cod_Proceso, Nro_Proceso) Values ');
      QryADOEstado.SQL.Add('( ' + IntToStr(FEmpresa) + ','
        + ' TO_DATE(''' + DateToStr(FFH_Proceso)
        + ''',''dd/mm/yyyy''), 0, ' + IntToStr(FCodProceso)
        + ',' + IntToStr(FNroProceso) + ')');
      QryADOEstado.ExecSQL;
    end
    else
    begin
      if QryADOEstado.FieldByName('ESTADO').Value = 0 then
        ParaVueltaAtras := 'F'
      else
        ParaVueltaAtras := 'T';
      QryADOEstado.Close;
      QryADOEstado.SQL.Clear;
      QryADOEstado.SQL.Text := 'UPDATE ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + ' Set Estado = 0'
        + ' Where Empresa = :CERO'
        + ' and FH_Proceso = :UNO'
        + ' and NRO_Proceso = :DOS'
        + ' and Cod_Proceso = :TRES';

      QryADOEstado.Parameters.Items[0].Value := FEmpresa;
      QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);
      QryADOEstado.Parameters.Items[2].Value := FNroProceso;
      QryADOEstado.Parameters.Items[3].Value := FCodProceso;

      QryADOEstado.ExecSQL;
    end;
  end;

  Conexion.CommitTrans;

  FStringError := cLinea;

  if (not Result) and FShowErrorMsg then
  begin
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos'), 16)
  end;
end;


function TADOCtrlProcesos.BorrarEstados(EmpresaDel, CodProcesoDel, NroProcesoDel: integer; FH_ProcesoDel: TDate): Boolean;
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
  Conexion.BeginTrans;
  try
    ADOEstados.CommandType := cmdText;
    ADOEstados.CommandText := 'Lock Table ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + ' in Exclusive Mode NoWait';
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
          TextoInfo.Caption := 'Intentando bloquear la base ESTADOS' + NombreLink[Ord(FInstanciaDestino)];
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
        TextoTime.Caption := 'Tiempo transcurrido : '
          + IntToStr(Contador) + ' segundos.';
        FormInfo.Refresh;
        sleep(1000);
        Inc(Contador);
      end;
    end;

    if FormInfo <> nil then
    begin
      FormInfo.Close;
      FormInfo.Free;
        // Debería asignar nil a FormInfo.
    end;

    QryADOEstado.Close;
    QryADOEstado.SQL.Clear;
    QryADOEstado.SQL.Text := 'DELETE FROM ESTADOS' + NombreLink[Ord(FInstanciaDestino)]
      + ' Where Empresa = :CERO'
      + ' and FH_Proceso = :UNO'
      + ' and NRO_Proceso = :DOS'
      + ' and Cod_Proceso = :TRES';

    QryADOEstado.Parameters.Items[0].Value := EmpresaDel;
    QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FH_ProcesoDel);
    QryADOEstado.Parameters.Items[2].Value := NroProcesoDel;
    QryADOEstado.Parameters.Items[3].Value := CodProcesoDel;

    QryADOEstado.ExecSQL;

    Result := True;

  except
    Result := False;
    FStringError := 'Error indefinido al borrar registro del proceso ' + IntToStr(CodProcesoDel)
      + ' para la tabla GIRE.ESTADOS' + NombreLink[Ord(FInstanciaDestino)];
  end;

  Conexion.CommitTrans;

end;

constructor TADOCtrlProcesos.Create(AOwner: TComponent);
var
  I: Integer;
  Total: Integer;
begin
  inherited Create(AOwner);
  Total := 0;
  for I := 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[I] is TADOCtrlProcesos then
      inc(Total);
    if Total > 1 then
      raise Exception.Create('No se admite mas de un componente de la clase '
        + '"TADOCtrlProcesos" por formulario.')
  end;
  QueryADOCtrl := TADOQuery.Create(Self);
  QryADOEstado := TADOQuery.Create(Self);
  QryADOProcesos := TADOQuery.Create(Self);
  ADOEstados := TADOCommand.Create(Self);
  FEmpresa := 0;
  FNroProceso := 1;
  FProcesosRelacionados := 1;
  FCodProceso := 0;
  FFH_Proceso := 0;
  FFH_Proceso_Anterior := 0;
  FShowErrorMsg := True;
  ParaVueltaAtras := 'N';
  FInstanciaDestino := idoDefault;
end;

destructor TADOCtrlProcesos.Destroy;
begin
  QueryADOCtrl.Free;
  QryADOEstado.Free;
  QryADOProcesos.Free;
  ADOEstados.Free;
  QueryADOCtrl := nil;
  QryADOEstado := nil;
  QryADOProcesos := nil;
  ADOEstados := nil;
  inherited Destroy;
end;

function TADOCtrlProcesos.Finalizado: Boolean;
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

  Conexion.BeginTrans;
  try
    ADOEstados.CommandType := cmdText;
    ADOEstados.CommandText := 'Lock Table ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + ' in Exclusive Mode NoWait';
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
          TextoInfo.Caption := 'Intentando bloquear la base ESTADOS' + NombreLink[Ord(FInstanciaDestino)];
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
        TextoTime.Caption := 'Tiempo transcurrido : '
          + IntToStr(Contador) + ' segundos.';
        FormInfo.Refresh;
        sleep(1000);
        Inc(Contador);
      end;
    end;

    if FormInfo <> nil then
    begin
      FormInfo.Close;
      FormInfo.Free;
      // Debería asignar nil a FormInfo.
    end;

    QryADOEstado.Close;
    QryADOEstado.SQL.Clear;
    QryADOEstado.SQL.Text := 'UPDATE ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + ' Set Estado = 1'
      + ' Where Empresa = :CERO'
      + ' and FH_Proceso = :UNO'
      + ' and NRO_Proceso = :DOS'
      + ' and Cod_Proceso = :TRES';

    QryADOEstado.Parameters.Items[0].Value := FEmpresa;
    QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);
    QryADOEstado.Parameters.Items[2].Value := FNroProceso;
    QryADOEstado.Parameters.Items[3].Value := FCodProceso;

    QryADOEstado.ExecSQL;
    Result := True;
  except
    Result := False;
    FStringError := 'Error indefinido al finalizar el proceso ' + IntToStr(FCodProceso)
      + ', no se grabó en tabla GIRE.ESTADOS' + NombreLink[Ord(FInstanciaDestino)];
  end;

  Conexion.CommitTrans;

end;

procedure TADOCtrlProcesos.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FConexion <> nil) and (AComponent = FConexion) then
    Conexion := nil;
end;

procedure TADOCtrlProcesos.SetConexion(const Value: TADOConnection);
begin
  FConexion := Value;
  QueryADOCtrl.Connection := FConexion;
  ADOEstados.Connection := FConexion;
  QryADOEstado.Connection := FConexion;
  QryADOProcesos.Connection := FConexion;
end;

function TADOCtrlProcesos.Testeo: Boolean;
var
  cLinea: string;
begin
  Result := True;
  cLinea := '';

  if FFH_Proceso = 0 then
  begin
    cLinea := cLinea + 'No se ha ingresado la fecha del proceso.' + #13#10;
    Result := False;
  end;

  if FProcesosRelacionados < FNroProceso then
  begin
    cLinea := cLinea + 'La cantidad de procesos relacionados no pueden ser menor al nro de proceso.' + #13#10;
    Result := False;
  end;

  if Result then
  begin
    QueryADOCtrl.Close;
    QueryADOCtrl.SQL.Clear;
    QueryADOCtrl.SQL.Text := 'Select * From ORDEN_PROCESOS' + NombreLink[Ord(FInstanciaDestino)]
      + ' Where Cod_Proceso = :CERO and Nro_Proceso = :UNO and Nro_proceso_relacionado <= :TRES';
    QueryADOCtrl.Parameters.Items[0].Value := FCodProceso;
    QueryADOCtrl.Parameters.Items[1].Value := FNroProceso;
    QueryADOCtrl.Parameters.Items[2].Value := FProcesosRelacionados;
    try
      QueryADOCtrl.Open;
      if QueryADOCtrl.RecordCount = 0 then
      begin
        Result := False;
        cLinea := cLinea + 'GIRE.ORDEN_PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + #13#10#13#10;
        cLinea := cLinea + 'No se localizaron registros que cumplan la condición :' + #13#10;
        cLinea := cLinea + 'Código de proceso = ' + IntToStr(FCodProceso) + ' y ';
        cLinea := cLinea + 'Número de proceso = ' + IntToStr(FNroProceso) + #13#10;
        cLinea := cLinea + 'Número de proceso relacionado = ' + IntToStr(FProcesosRelacionados) + #13#10;
      end;
    except
      Result := False;
      cLinea := cLinea + 'No se pudo operar con la base GIRE.ORDEN_PROCESOS' + NombreLink[Ord(FInstanciaDestino)];
    end;
  end;

  if Result then
  begin
    QueryADOCtrl.First;

    while not QueryADOCtrl.Eof do
    begin

      if QueryADOCtrl.FieldByName('PROHIBIDO').Value <> 0 then
      begin
        QryADOEstado.Close;
        QryADOEstado.SQL.Clear;
        QryADOEstado.SQL.Text := 'Select * From ESTADOS' + NombreLink[Ord(FInstanciaDestino)]
          + ' Where Empresa = :CERO'
          + ' and NRO_Proceso = :UNO'
          + ' and Cod_Proceso = :DOS'
          + ' and ESTADO = 0';

        QryADOEstado.Parameters.Items[0].Value := FEmpresa;
        QryADOEstado.Parameters.Items[1].Value := FNroProceso;
        if FProcesosRelacionados > 1 then
            QryADOEstado.Parameters.Items[1].Value := QueryADOCtrl.FieldByName('Nro_Proceso_Relacionado').AsInteger;
        QryADOEstado.Parameters.Items[2].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

        QryADOEstado.Open;

        if QryADOEstado.RecordCount > 0 then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)]
            + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Inhabilitado por estar realizándose el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      QryADOEstado.Close;
      QryADOEstado.SQL.Clear;
      QryADOEstado.SQL.Text := 'Select * From ESTADOS' + NombreLink[Ord(FInstanciaDestino)]
        + ' Where Empresa = :CERO'
        + ' and FH_Proceso = :UNO'
        + ' and NRO_Proceso = :DOS'
        + ' and Cod_Proceso = :TRES';

      QryADOEstado.Parameters.Items[0].Value := FEmpresa;

      if QueryADOCtrl.FieldByName('CONTROL_FECHA').Value <> 0 then
        QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso_Anterior)
      else
        QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);

      QryADOEstado.Parameters.Items[2].Value := FNroProceso;
      if FProcesosRelacionados > 1 then
        QryADOEstado.Parameters.Items[2].Value := QueryADOCtrl.FieldByName('Nro_Proceso_Relacionado').AsInteger;
      QryADOEstado.Parameters.Items[3].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

      QryADOEstado.Open;

      if QueryADOCtrl.FieldByName('FINALIZADO').Value <> 0 then
      begin
        if (QryADOEstado.RecordCount > 0) and
          (QryADOEstado.FieldByName('ESTADO').Value = 0) then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;

          cLinea := cLinea + 'Falta realizar el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('SIMULTANEO').Value <> 0 then
      begin
        if (QryADOEstado.RecordCount > 0) and
          (QryADOEstado.FieldByName('ESTADO').Value = 0) then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Ya se está realizando el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('CUMPLE').Value <> 0 then
      begin
        if QryADOEstado.RecordCount = 0 then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'No se cumple el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('REPROCESO').Value <> 0 then
      begin
        if QryADOEstado.RecordCount <> 0 then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Reproceso inhabilitado por el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      if QueryADOCtrl.FieldByName('OBLIGATORIO').Value <> 0 then
      begin
        if (QryADOEstado.RecordCount = 0) or ((QryADOEstado.RecordCount > 0) and
          (QryADOEstado.FieldByName('ESTADO').Value = 0)) then
        begin
          Result := False;
          QryADOProcesos.Close;
          QryADOProcesos.SQL.Clear;
          QryADOProcesos.SQL.Text := 'Select * from PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' Where Cod_Proceso = :CERO';

          QryADOProcesos.Parameters.Items[0].Value := QueryADOCtrl.FieldByName('Cod_Proceso_Relacionado').AsInteger;

          QryADOProcesos.Open;
          cLinea := cLinea + 'Para este proceso es obligatorio el proceso "'
            + QryADOProcesos.FieldByName('Descripcion').Value + '"' + #13#10;
        end;
      end;

      QueryADOCtrl.Next;
    end;
  end;

  FStringError := cLinea;

  if (not Result) and FShowErrorMsg then
  begin
    MessageBox(Application.Handle, PChar(cLinea), PChar('Control de Procesos'), 16)
  end;

end;

function TADOCtrlProcesos.VueltaAtras: Boolean;
var
  lControl: Boolean;
  Contador: integer;
  FormInfo: TForm;
  TextoInfo: TPanel;
  TextoTime: TPanel;
  PanelFondo: TPanel;
begin
  if ParaVueltaAtras in ['T', 'N'] then
  begin
    FormInfo := nil;
    TextoTime := nil;
    Conexion.BeginTrans;
    try
      ADOEstados.CommandType := cmdText;
      ADOEstados.CommandText := 'Lock Table ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + ' in Exclusive Mode NoWait';
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
            TextoInfo.Caption := 'Intentando bloquear la base ESTADOS' + NombreLink[Ord(FInstanciaDestino)];
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
          TextoTime.Caption := 'Tiempo transcurrido : '
            + IntToStr(Contador) + ' segundos.';
          FormInfo.Refresh;
          sleep(1000);
          Inc(Contador);
        end;
      end;

      if FormInfo <> nil then
      begin
        FormInfo.Close;
        FormInfo.Free;
        // Debería asignar nil a FormInfo.
      end;

      case ParaVueltaAtras of
        'T':
          begin
            QryADOEstado.Close;
            QryADOEstado.SQL.Clear;
            QryADOEstado.SQL.Text := 'UPDATE ESTADOS' + NombreLink[Ord(FInstanciaDestino)] + ' Set Estado = 1'
              + ' Where Empresa = :CERO'
              + ' and FH_Proceso = :UNO'
              + ' and NRO_Proceso = :DOS'
              + ' and Cod_Proceso = :TRES';

            QryADOEstado.Parameters.Items[0].Value := FEmpresa;
            QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);
            QryADOEstado.Parameters.Items[2].Value := FNroProceso;
            QryADOEstado.Parameters.Items[3].Value := FCodProceso;

            QryADOEstado.ExecSQL;
          end;
        'N':
          begin
            QryADOEstado.Close;
            QryADOEstado.SQL.Clear;
            QryADOEstado.SQL.Text := 'DELETE FROM ESTADOS' + NombreLink[Ord(FInstanciaDestino)]
              + ' Where Empresa = :CERO'
              + ' and FH_Proceso = :UNO'
              + ' and NRO_Proceso = :DOS'
              + ' and Cod_Proceso = :TRES';

            QryADOEstado.Parameters.Items[0].Value := FEmpresa;
            QryADOEstado.Parameters.Items[1].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);
            QryADOEstado.Parameters.Items[2].Value := FNroProceso;
            QryADOEstado.Parameters.Items[3].Value := FCodProceso;

            QryADOEstado.ExecSQL;
          end;
      end;

      Result := True;

    except
      Result := False;
      FStringError := 'Error indefinido al dar vuelta atrás el proceso ' + IntToStr(FCodProceso)
        + ' para la tabla GIRE.ESTADOS' + NombreLink[Ord(FInstanciaDestino)];
    end;

    Conexion.CommitTrans;

  end
  else
    Result := True;
end;

end.

