unit URepoResumenDistribucion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UREPOGIREBASEEMPRESA, Qrctrls, QuickRpt, ExtCtrls, Db, ADODB, UGeneral, Define,
  jpeg;

type
  TRepoResumenDistribucion = class(TRepoGIREBaseEmpresa)
    BandaTitulos: TQRChildBand;
    BandaGrupo: TQRGroup;
    BandaPie: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBTArchivo: TQRDBText;
    QRDBTTipo_Archivo: TQRDBText;
    QRDBTFh_Distri: TQRDBText;
    QRDBTMovimientos: TQRDBText;
    QRDBTRegistros: TQRDBText;
    QRDBTImporte: TQRDBText;
    QREMovimientos: TQRExpr;
    QRERegistros: TQRExpr;
    QREImporte: TQRExpr;
    QRBand1: TQRBand;
    QRETotMovimientos: TQRExpr;
    QRETotRegistros: TQRExpr;
    QRETotImporte: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBTNro: TQRDBText;
    QryBaseReporte: TADOQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLProceso: TQRLabel;
    QRLCia: TQRLabel;
    QRLCopia: TQRLabel;
    QRDBTFechadistribu: TQRDBText;
    QryBaseReporteCOD_CIA: TIntegerField;
    QryBaseReporteNRO_PROCESO: TIntegerField;
    QryBaseReporteCOD_TIPO_ARCHIVO: TStringField;
    QryBaseReporteCOD_DISENO: TStringField;
    QryBaseReporteNRO_ORDEN: TIntegerField;
    QryBaseReporteFH_DISTRIBUCION: TDateTimeField;
    QryBaseReporteNRO_CORRIDA: TIntegerField;
    QryBaseReporteNOMBRE_ARCHIVO: TStringField;
    QryBaseReporteCANTIDAD_REGISTROS: TIntegerField;
    QryBaseReporteCANTIDAD_MOVIMIENTOS: TIntegerField;
    QryBaseReporteIMPORTE: TBCDField;
    QryBaseReporteUSUARIO: TStringField;
    QryBaseReporteFH_ACTUALIZACION: TDateTimeField;
    QryBaseReporteDESCRIPCION: TStringField;
  private
    FRegistroDistribucion: TRegistroDistribucion;
    FUltimo_Nro_Corrida: Double;
    procedure Abrir_Qrys(AQry: TADOQuery);
    procedure Asociar_DataSet(AQry: TADOQuery);
    procedure Asignar_Expresiones(AQry: TADOQuery);
    procedure Informar_Usuario;
  public
  	{original}
    constructor create (AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ANro_Corrida: Double; ACopia: String);reintroduce; overload;
    {reimpresión}
    constructor create (AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ADataSet: TDataSet; ACopia: String);reintroduce; overload;
    constructor create (AOwner: TComponent; W_Cia, W_Proceso: Integer;  W_DescCia, W_DescProceso: String; ADataSet: TDataSet; ACopia: String);reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoResumenDistribucion }


procedure TRepoResumenDistribucion.Abrir_Qrys(AQry: TADOQuery);
begin
  DataSet := AQry;
  Asociar_DataSet(AQry);
  Asignar_Expresiones(AQry);

  (DataSet as TADOQuery).Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  (DataSet as TADOQuery).Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  (DataSet as TADOQuery).Parameters.ParamByName('pFh_Distribucion').Value := Date;
  (DataSet as TADOQuery).Parameters.ParamByName('pNro_Corrida').Value := FUltimo_Nro_Corrida;
  (DataSet as TADOQuery).Parameters.ParamByName('pNro_CorridaB').Value := FUltimo_Nro_Corrida;
  (DataSet as TADOQuery).Open;
end;

procedure TRepoResumenDistribucion.Asociar_DataSet(AQry: TADOQuery);
var
  i: Integer;
begin
  for i := 0 to BandaEncabezado.ControlCount - 1 do
    if BandaEncabezado.Controls[i].ClassType = TQRDBText then
      (BandaEncabezado.Controls[i] as TQRDBText).DataSet := AQry;

  for i := 0 to BandaDetalle.ControlCount - 1 do
    if BandaDetalle.Controls[i].ClassType = TQRDBText then
      (BandaDetalle.Controls[i] as TQRDBText).DataSet := AQry;

  for i := 0 to BandaPie.ControlCount - 1 do
    if BandaPie.Controls[i].ClassType = TQRDBText then
      (BandaPie.Controls[i] as TQRDBText).DataSet := AQry;

end;

constructor TRepoResumenDistribucion.create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion; ANro_Corrida: Double;
  ACopia: String);
begin
  inherited Create(AOwner);
  Informar_Usuario;
  DecimalSeparator := ',';
  FRegistroDistribucion := ARegistroDistribucion;
  QRLCia.Caption := IntToStr(ARegistroDistribucion.Cod_Cia)+' - '+ARegistroDistribucion.RazonSocial;
  QRLProceso.Caption := IntToStr(ARegistroDistribucion.Nro_Proceso)+' - '+ARegistroDistribucion.DescProceso;
  FUltimo_Nro_Corrida := ANro_Corrida;
  QRLCopia.Caption := ACopia;
  Abrir_Qrys(QryBaseReporte);

end;


destructor TRepoResumenDistribucion.destroy;
begin
  DecimalSeparator := '.';
  inherited;
end;

procedure TRepoResumenDistribucion.Asignar_Expresiones(AQry: TADOQuery);
begin
  BandaGrupo.Expression := AQry.Name+'.FH_DISTRIBUCION';

  QREMovimientos.Expression := 'SUM('+AQry.Name+'.CANTIDAD_MOVIMIENTOS)';
  QRERegistros.Expression := 'SUM('+AQry.Name+'.CANTIDAD_REGISTROS)';
  QREImporte.Expression := 'SUM('+AQry.Name+'.IMPORTE)';
  QRETotMovimientos.Expression := 'SUM('+AQry.Name+'.CANTIDAD_MOVIMIENTOS)';
  QRETotRegistros.Expression := 'SUM('+AQry.Name+'.CANTIDAD_REGISTROS)';
  QRETotImporte.Expression := 'SUM('+AQry.Name+'.IMPORTE)';
end;

constructor TRepoResumenDistribucion.create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion; ADataSet:TDataSet; ACopia: String);
begin
  inherited Create(AOwner);
  Informar_Usuario;
  DecimalSeparator := ',';
  FRegistroDistribucion := ARegistroDistribucion;
  QRLCia.Caption := IntToStr(ARegistroDistribucion.Cod_Cia)+' - '+ARegistroDistribucion.RazonSocial;
  QRLProceso.Caption := IntToStr(ARegistroDistribucion.Nro_Proceso)+' - '+ARegistroDistribucion.DescProceso;
  QRLCopia.Caption := ACopia;
  DataSet := ADataSet;
  Asociar_DataSet(DataSet as TADOQuery);
  Asignar_Expresiones(DataSet as TADOQuery);

end;

procedure TRepoResumenDistribucion.Informar_Usuario;
begin
  MuestraUsuario := True;
  Usuario := GemaConexion.NombreUsuario;
end;

constructor TRepoResumenDistribucion.create(AOwner: TComponent; W_Cia,
  W_Proceso: Integer; W_DescCia, W_DescProceso: String; ADataSet: TDataSet; ACopia: String);
begin
  inherited Create(AOwner);
  Informar_Usuario;
  DecimalSeparator := ',';
  QRLCia.Caption := IntToStr(W_Cia)+' - '+W_DescCia;
  QRLProceso.Caption := IntToStr(W_Proceso)+' - '+W_DescProceso;
  QRLCopia.Caption := ACopia;
  DataSet := ADataSet;
  Asociar_DataSet(DataSet as TADOQuery);
  Asignar_Expresiones(DataSet as TADOQuery);

end;

end.
