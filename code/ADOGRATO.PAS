unit ADOGraTo;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ADODB, Dialogs;

type
  TInstanciaDestino = (idoDefault, idoBacko, idoGalileo, idoOnline);

  TADOGrabaTotales = class(TComponent)
  private
    MiQueryADO: TADOQuery;
    FConexion: TADOConnection;
    FImporte: Currency;
    FImporteRechazado: Currency;
    FEmpresa: integer;
    FCantidadRechazada: integer;
    FCantidad: integer;
    FFH_Proceso: TDate;
    FCodProcesoSalida: integer;
    FNroProceso: Int64;
    FCodProceso: integer;
    FNroProcesoSalida: Int64;
    FNombreDelProceso: string;
    FShowErrorMsg: Boolean;
    FReiniciaTotales: Boolean;
    FTextoError: string;
    FInstanciaDestino: TInstanciaDestino;
    procedure SetConexion(const Value: TADOConnection);
    procedure SetNombreDelProceso(const Value: string);
    { Private declarations }
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Empresa: integer read FEmpresa write FEmpresa;
    property FH_Proceso: TDate read FFH_Proceso write FFH_Proceso;
    property Cantidad: integer read FCantidad write FCantidad;
    property Importe: Currency read FImporte write FImporte;
    property CantidadRechazada: integer read FCantidadRechazada write FCantidadRechazada;
    property ImporteRechazado: Currency read FImporteRechazado write FImporteRechazado;
    property TextoError: string read FTextoError;
    function Execute: Boolean;
  published
    { Published declarations }
    property Conexion: TADOConnection read FConexion write SetConexion;
    property CodProceso: integer read FCodProceso write FCodProceso default 0;
    property NroProceso: Int64 read FNroProceso write FNroProceso default 1;
    property CodProcesoSalida: integer read FCodProcesoSalida write FCodProcesoSalida default 0;
    property NroProcesoSalida: Int64 read FNroProcesoSalida write FNroProcesoSalida default 1;
    property NombreDelProceso: string read FNombreDelProceso write SetNombreDelProceso;
    property ShowErrorMsg: Boolean read FShowErrorMsg write FShowErrorMsg default True;
    property ReiniciaTotales: Boolean read FReiniciaTotales write FReiniciaTotales;
    property InstanciaDestino: TInstanciaDestino read FInstanciaDestino write FInstanciaDestino default idoDefault;
  end;

const
  NombreLink: array[0..3] of string = ('', '@COMPONENTE_BK', '@COMPONENTE_GL', '@COMPONENTE_OL');

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire Controles', [TADOGrabaTotales]);
end;

{ TADOGrabaTotales }

constructor TADOGrabaTotales.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MiQueryADO := TADOQuery.Create(Self);
  FCantidad := 0;
  FImporte := 0;
  FCantidadRechazada := 0;
  FImporteRechazado := 0;
  FCodProceso := 0;
  FNroProceso := 1;
  FCodProcesoSalida := 0;
  FNroProcesoSalida := 1;
  FNombreDelProceso := '';
  FShowErrorMsg := True;
  FReiniciaTotales := False;
  FInstanciaDestino := idoDefault;
end;

destructor TADOGrabaTotales.Destroy;
begin
  MiQueryADO.Free;
  MiQueryADO := nil;
  inherited Destroy;
end;

function TADOGrabaTotales.Execute: Boolean;
var
  lResultado: Boolean;
  cImporte, cImpRech: string;
  NpOS: integer;
begin
  FTextoError := '';
  lResultado := True;
  MiQueryADO.Close;
  MiQueryADO.SQL.Clear;
  MiQueryADO.SQL.Text := 'Select * From CIAS' + NombreLink[Ord(FInstanciaDestino)] + ' WHERE Cod_cia = :CERO';

  MiQueryADO.Parameters.Items[0].Value := FEmpresa;

  try
    MiQueryADO.Open;
    if MiQueryADO.RecordCount = 0 then
    begin
      FTextoError := FTextoError + ('Empresa "' + IntToStr(FEmpresa) + '" no definida en tablas.') + #13#10;
      lResultado := False;
    end;
    MiQueryADO.Close;
  except
    FTextoError := FTextoError + ('Error al intentar consultar GIRE.CIAS' + NombreLink[Ord(FInstanciaDestino)]) + #13#10;
    lResultado := False;
  end;
  MiQueryADO.SQL.Clear;
  MiQueryADO.SQL.Text := 'Select * From PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' WHERE Cod_Proceso = :CERO';

  MiQueryADO.Parameters.Items[0].Value := FCodProceso;

  try
    MiQueryADO.Open;
    if MiQueryADO.RecordCount = 0 then
    begin
      FTextoError := FTextoError + ('El código de proceso "' + IntToStr(FCodProceso) + '" no está definido.') + #13#10;
      lResultado := False;
    end;
    FNombreDelProceso := MiQueryADO.FieldByName('DESCRIPCION').Value;
    MiQueryADO.Close;
    MiQueryADO.SQL.Clear;
    MiQueryADO.SQL.Text := 'Select * From PROCESOS' + NombreLink[Ord(FInstanciaDestino)] + ' WHERE Cod_Proceso = :CERO';

    MiQueryADO.Parameters.Items[0].Value := FCodProcesoSalida;

    MiQueryADO.Open;
    if MiQueryADO.RecordCount = 0 then
    begin
      FTextoError := FTextoError + ('El código de proceso de salida "' + IntToStr(FCodProcesoSalida) + '" no está definido.') + #13#10;
      lResultado := False;
    end;
  except
    FTextoError := FTextoError + ('No se pudo consultar GIRE.PROCESOS' + NombreLink[Ord(FInstanciaDestino)]) + #13#10;
    lResultado := False;
  end;
  if FFH_Proceso = 0 then
  begin
    FTextoError := FTextoError + 'No se ha ingresado la fecha del proceso.' + #13#10;
    lResultado := False;
  end;
  if lResultado then
  begin
    cImporte := FloatToStr(FImporte);
    nPos := Pos(',', cImporte);
    if nPos > 0 then
      cImporte[nPos] := '.';
    cImpRech := FloatToStr(FImporteRechazado);
    nPos := Pos(',', cImpRech);
    if nPos > 0 then
      cImpRech[nPos] := '.';
      {
      if Length( Trim( FNombreDelProceso ) ) = 0 then
         FNombreDelProceso := Copy( Application.Title, 1, 20 );
      }
    if FReiniciaTotales then
    begin
      MiQueryADO.Close;
      MiQueryADO.SQL.Clear;
      MiQueryADO.SQL.Text := 'DELETE FROM TOTALES_CONTROL' + NombreLink[Ord(FInstanciaDestino)]
        + ' WHERE Cod_cia = :CERO'
        + ' and Cod_Proceso = :UNO'
        + ' and Nro_Proceso = :DOS'
        + ' and Cod_Proceso_Salida = :TRES'
        + ' and Nro_Proceso_salida = :CUATRO'
        + ' and FH_Proceso_Salida = :CINCO';

      MiQueryADO.Parameters.Items[0].Value := FEmpresa;
      MiQueryADO.Parameters.Items[1].Value := FCodProceso;
      MiQueryADO.Parameters.Items[2].Value := IntToStr(FNroProceso);
      MiQueryADO.Parameters.Items[3].Value := FCodProcesoSalida;
      MiQueryADO.Parameters.Items[4].Value := IntToStr(FNroProcesoSalida);
      MiQueryADO.Parameters.Items[5].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);

      MiQueryADO.ExecSQL;
    end;
    MiQueryADO.Close;
    MiQueryADO.SQL.Clear;
    MiQueryADO.SQL.Add('INSERT INTO TOTALES_CONTROL' + NombreLink[Ord(FInstanciaDestino)]);
    MiQueryADO.SQL.Add(' (Cod_cia, Cod_Proceso, Nro_Proceso, Descripcion, '
      + 'Cod_Proceso_Salida, Nro_Proceso_salida, FH_Proceso_Salida, '
      + 'Cantidad_Total, Importe_Total, Cantidad_Eliminados, '
      + 'Importe_Eliminados ) Values ');
    MiQueryADO.SQL.Add('( ' + IntToStr(FEmpresa) + ', ' + IntToStr(FCodProceso) + ', '
      + IntToStr(FNroProceso) + ', ' + '''' + FNombreDelProceso + '''' + ', '
      + IntToStr(FCodProcesoSalida) + ', ' + IntToStr(FNroProcesoSalida) + ', '
      + 'TO_DATE(' + '''' + DateToStr(FFH_Proceso) + '''' + ', ' + '''' + 'dd/mm/yyyy' + '''' + '), '
      + IntToStr(FCantidad) + ', ' + cImporte + ', '
      + IntToStr(FCantidadRechazada) + ', ' + cImpRech + ')');
    try
      MiQueryADO.ExecSQL;
    except
      FTextoError := FTextoError + 'No se pudo actualizar la tabla de controles.' + #13#10;
      lResultado := False;
    end;
  end;
  if (not lResultado) and FShowErrorMsg then
    MessageBox(Application.Handle, PChar(FTextoError), PChar('Error al intentar grabar el Control de Totales'), 16);
  Result := lResultado;
end;

procedure TADOGrabaTotales.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FConexion <> nil) and (AComponent = FConexion) then
    Conexion := nil;
end;

procedure TADOGrabaTotales.SetConexion(const Value: TADOConnection);
begin
  FConexion := Value;
  MiQueryADO.Connection := FConexion;
end;

procedure TADOGrabaTotales.SetNombreDelProceso(const Value: string);
begin
  if Value <> '' then
    MessageBox(Application.Handle, PChar('Esta propiedad es obsoleta y no será grabada en la tabla de totales.'),
      PChar('Error'), 16);
  {
  if Length(Value) > 20 then
     MessageBox(Application.Handle, PChar('El nombre del proceso no debe superar los 20 caracteres.'),
                        PChar('Error'), 16 )
  else
     FNombreDelProceso := Value;
  }
end;

end.

