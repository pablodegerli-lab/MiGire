unit ADOCtrlT;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB;

type

  TInstanciaOrigen = (iooDefault, iooBacko, iooGalileo, iooOnline);

  TInformaError = procedure(CodEmpresa: integer; CodProceso: integer;
    NroProceso: Int64; CantDeclarada: integer;
    CantEncontrada: integer; ImpDeclarado: Currency;
    ImpEncontrado: Currency; FechaProceso: TDateTime;
    DescProceso: string) of object;

  TADOCtrlTotales = class(TComponent)
  private
    { Private declarations }
    MiQueryADO: TADOQuery;
    FConexion: TADOConnection;
    FCtrlCantidad: Boolean;
    FCtrlImporte: Boolean;
    FImporteTotal: Currency;
    FCantidadRegistros: integer;
    FNroProceso: Int64;
    FFH_Proceso: TDate;
    FCodProceso: integer;
    FShowErrorMsg: Boolean;
    FEmpresa: integer;
    FOnInformaError: TInformaError;
    FTextoError: string;
    FUsaFechaProceso: Boolean;
    FInstanciaOrigen: TInstanciaOrigen;
    procedure SetConexion(const Value: TADOConnection);
    procedure SetCtrlCantidad(const Value: Boolean);
    procedure SetCtrlImporte(const Value: Boolean);
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Empresa: integer read FEmpresa write FEmpresa default 0;
    property CantidadRegistros: integer read FCantidadRegistros write FCantidadRegistros default -1;
    property ImporteTotal: Currency read FImporteTotal write FImporteTotal;
    property FH_Proceso: TDate read FFH_Proceso write FFH_Proceso;
    property TextoError: string read FTextoError;
    function Execute: Boolean;
  published
    { Published declarations }
    property Conexion: TADOConnection read FConexion write SetConexion;
    property CtrlCantidad: Boolean read FCtrlCantidad write SetCtrlCantidad default True;
    property CtrlImporte: Boolean read FCtrlImporte write SetCtrlImporte default True;
    property NroProceso: Int64 read FNroProceso write FNroProceso default 1;
    property CodProceso: integer read FCodProceso write FCodProceso default 0;
    property ShowErrorMsg: Boolean read FShowErrorMsg write FShowErrorMsg default True;
    property OnInformaError: TInformaError read FOnInformaError write FOnInformaError;
    property UsaFechaProceso: Boolean read FUsaFechaProceso write FUsaFechaProceso default True;
    property InstanciaOrigen: TInstanciaOrigen read FInstanciaOrigen write FInstanciaOrigen default iooDefault;
  end;

const
  NombreLink: array[0..3] of string = ('', '@COMPONENTE_BK', '@COMPONENTE_GL', '@COMPONENTE_OL');

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire Controles', [TADOCtrlTotales]);
end;

{ TADOCtrlTotales }

constructor TADOCtrlTotales.Create(AOwner: TComponent);
var
  I: Integer;
  Total: Integer;
begin
  inherited Create(AOwner);
  Total := 0;
  for I := 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[I] is TADOCtrlTotales then
      inc(Total);
    if Total > 1 then
      raise Exception.Create('No se admite mas de un componente de la clase '
        + '"TADOCtrlTotales" por formulario.')
  end;
  MiQueryADO := TADOQuery.Create(Self);
  FCtrlCantidad := True;
  FCtrlImporte := True;
  FEmpresa := 0;
  FCantidadRegistros := -1;
  FImporteTotal := -1;
  FNroProceso := 1;
  FCodProceso := 0;
  FFH_Proceso := 0;
  FShowErrorMsg := True;
  FUsaFechaProceso := True;
  FInstanciaOrigen := iooDefault;
end;

destructor TADOCtrlTotales.Destroy;
begin
  MiQueryADO.Free;
  MiQueryADO := nil;
  inherited Destroy;
end;

function TADOCtrlTotales.Execute: Boolean;
var
  lResultado: Boolean;
  CantidadEncontrada: integer;
  ImporteEncontrado: Currency;
  DescripcionProc: string;
begin
  FTextoError := '';
  lResultado := True;
  MiQueryADO.Close;
  MiQueryADO.SQL.Clear;
  MiQueryADO.SQL.Text := 'Select Sum(IMPORTE_TOTAL) as IMPORTE,'
    + ' Sum(CANTIDAD_TOTAL) as CANTIDAD From TOTALES_CONTROL' + NombreLink[Ord(FInstanciaOrigen)]
    + ' WHERE Cod_cia = :CERO'
    + ' and Cod_Proceso_salida = :UNO'
    + ' and Nro_Proceso_salida = :DOS';
  if FUsaFechaProceso then
    MiQueryADO.SQL.Text := MiQueryADO.SQL.Text + ' and FH_Proceso_salida = :TRES';

  MiQueryADO.Parameters.Items[0].Value := FEmpresa;
  MiQueryADO.Parameters.Items[1].Value := FCodProceso;
  MiQueryADO.Parameters.Items[2].Value := IntToStr(FNroProceso);
  if FUsaFechaProceso then
    MiQueryADO.Parameters.Items[3].Value := FormatDateTime('yyyy/mm/dd', FFH_Proceso);

  MiQueryADO.Open;
  CantidadEncontrada := MiQueryADO.FieldByName('CANTIDAD').asinteger;
  ImporteEncontrado := MiQueryADO.FieldByName('IMPORTE').asCurrency;
  if (FCantidadRegistros <> CantidadEncontrada) and FCtrlCantidad then
    lResultado := False;
  if (FImporteTotal <> ImporteEncontrado) and FCtrlImporte then
    lResultado := False;
  if (not lResultado) and ShowErrorMsg then
  begin
    MiQueryADO.Close;
    MiQueryADO.SQL.Clear;
    MiQueryADO.SQL.Text := 'Select * From PROCESOS WHERE Cod_Proceso = :CERO';

    MiQueryADO.Parameters.Items[0].Value := FCodProceso;

    MiQueryADO.Open;
    FTextoError := 'PARAMETROS DE ENTRADA' + #13#10#13#10;
    FTextoError := FTextoError + #9 + 'Empresa definida' + #9 + '= ' + IntToStr(FEmpresa) + #13#10;
    FTextoError := FTextoError + #9 + 'Código del proceso' + #9 + '= ' + IntToStr(FCodProceso) + #13#10;
    FTextoError := FTextoError + #9 + 'Descr. del proceso' + #9 + '= ';
    if MiQueryADO.RecordCount = 0 then
    begin
      FTextoError := FTextoError + 'No definido en tablas' + #13#10;
      DescripcionProc := 'No definido en tablas';
    end
    else
    begin
      DescripcionProc := MiQueryADO.FieldByName('Descripcion').Value;
      FTextoError := FTextoError + DescripcionProc + #13#10;
    end;
    FTextoError := FTextoError + #9 + 'Número de proceso' + #9 + '= ' + IntToStr(FNroProceso) + #13#10;
    FTextoError := FTextoError + #9 + 'Fecha de proceso' + #9 + '= ' + DateToStr(FFH_Proceso) + #9#13#10;
    if FCtrlCantidad then
    begin
      FTextoError := FTextoError + #13#10 + 'CANTIDADES' + #13#10#13#10;
      FTextoError := FTextoError + #9 + 'Declarada' + #9 + '= ' + IntToStr(FCantidadRegistros) + #13#10;
      FTextoError := FTextoError + #9 + 'Encontrada' + #9 + '= ' + IntToStr(CantidadEncontrada) + #13#10;
    end;
    if FCtrlImporte then
    begin
      FTextoError := FTextoError + #13#10 + 'IMPORTES' + #13#10#13#10;
      FTextoError := FTextoError + #9 + 'Declarado' + #9 + '= ' + FloatToStr(FImporteTotal) + #13#10;
      FTextoError := FTextoError + #9 + 'Encontrado' + #9 + '= ' + FloatToStr(ImporteEncontrado) + #13#10;
    end;
    FTextoError := FTextoError + #13#10;
    MessageBox(Application.Handle, PChar(FTextoError), PChar('Error en el Control de Totales'), 16);
  end;
  if (not lResultado) and Assigned(FOnInformaError) then
    FOnInformaError(FEmpresa, FCodProceso, FNroProceso, FCantidadRegistros,
      CantidadEncontrada, FImporteTotal, ImporteEncontrado,
      FH_Proceso, DescripcionProc);

  Result := lResultado;
end;

procedure TADOCtrlTotales.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FConexion <> nil) and (AComponent = FConexion) then
    Conexion := nil;
end;

procedure TADOCtrlTotales.SetConexion(const Value: TADOConnection);
begin
  FConexion := Value;
  MiQueryADO.Connection := FConexion;
end;

procedure TADOCtrlTotales.SetCtrlCantidad(const Value: Boolean);
begin
  if (not value) and (not FCtrlImporte) then
    FCtrlImporte := True;
  FCtrlCantidad := Value;
end;

procedure TADOCtrlTotales.SetCtrlImporte(const Value: Boolean);
begin
  if (not value) and (not FCtrlCantidad) then
    FCtrlCantidad := True;
  FCtrlImporte := Value;
end;

end.

