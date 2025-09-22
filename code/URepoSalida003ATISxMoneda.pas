unit URepoSalida003ATISxMoneda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls,
  RxMemDS, Variants, jpeg;

type
  TRepoSalida003ATISxMoneda = class(TRepoGemaBaseEmpresa)
    RxMDTotalesXMoneda: TRxMemoryData;
    RxMDTotalesXMonedaDESCRIP_MONEDA: TStringField;
    RxMDTotalesXMonedaIMPORTE: TFloatField;
    RxMDTotalesXMonedaCOD_MONEDA: TStringField;
    QryCobranzas: TADOQuery;
    QryEntidades: TADOQuery;
    QRDBTDescrip_Moneda: TQRDBText;
    QRDBTImporte: TQRDBText;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QREImporte_Total: TQRExpr;
    QRLCantidad: TQRLabel;
    RxMDTotalesXMonedaORDEN: TIntegerField;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QryEntidadesCOD_ENTIDAD: TIntegerField;
    QryEntidadesDESCRIPCION: TStringField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QryBaseAfterOpen(DataSet: TDataSet);
  private
  	procedure Clasificar_Tarjetas;
  	procedure Acumular_Cheques;
  	procedure Clasificar_Importes;
    procedure Acumular_Retenciones;
    procedure Acumular_En_Tabla(AOrden: Integer; AMoneda,ADescripcion: String; AImporte: Double);
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoGemaBaseEmpresa1 }

procedure TRepoSalida003ATISxMoneda.Acumular_Cheques;
begin
 	if (QryCobranzas.FieldByName('COD_MONEDA_1').Value <> null) and (Copy(QryCobranzas.FieldByName('COD_MONEDA_1').Value,1,1) = 'C') then
		  Acumular_En_Tabla(1,'CHE','CHEQUES',QryCobranzas.FieldByName('IMPORTE_MONEDA_1').Value);
 	if (QryCobranzas.FieldByName('COD_MONEDA_2').Value <> null)  and (Copy(QryCobranzas.FieldByName('COD_MONEDA_2').Value,1,1) = 'C') then
	  Acumular_En_Tabla(1,'CHE','CHEQUES',QryCobranzas.FieldByName('IMPORTE_MONEDA_2').Value);
 	if (QryCobranzas.FieldByName('COD_MONEDA_3').Value <> null) and (Copy(QryCobranzas.FieldByName('COD_MONEDA_3').Value,1,1) = 'C') then
	  Acumular_En_Tabla(1,'CHE','CHEQUES',QryCobranzas.FieldByName('IMPORTE_MONEDA_3').Value);
 	if (QryCobranzas.FieldByName('COD_MONEDA_4').Value <> null) and (Copy(QryCobranzas.FieldByName('COD_MONEDA_4').Value,1,1) = 'C') then
	  Acumular_En_Tabla(1,'CHE','CHEQUES',QryCobranzas.FieldByName('IMPORTE_MONEDA_4').Value);

end;

procedure TRepoSalida003ATISxMoneda.Acumular_En_Tabla(AOrden: Integer;
	AMoneda,ADescripcion: String; AImporte: Double);
begin
  if RxMDTotalesXMoneda.Locate('COD_MONEDA',AMoneda,[]) then
  begin
    RxMDTotalesXMoneda.Edit;
    RxMDTotalesXMonedaIMPORTE.Value := RxMDTotalesXMonedaIMPORTE.Value + AImporte;
    RxMDTotalesXMoneda.Post;
  end
	else
  begin
    RxMDTotalesXMoneda.Insert;
    RxMDTotalesXMonedaORDEN.Value := AOrden;
    RxMDTotalesXMonedaCOD_MONEDA.Value := AMoneda;
    if (AMoneda > '400') and (AMoneda < '500') then
    begin
	  	QryEntidades.Locate('COD_ENTIDAD',StrToInt(AMoneda),[]);
	    RxMDTotalesXMonedaDESCRIP_MONEDA.Value := QryEntidadesDESCRIPCION.Value;
    end
    else
	    RxMDTotalesXMonedaDESCRIP_MONEDA.Value := ADescripcion;
    RxMDTotalesXMonedaIMPORTE.Value := AImporte;
    RxMDTotalesXMoneda.Post;
  end;

end;

procedure TRepoSalida003ATISxMoneda.Acumular_Retenciones;
begin
 	if (QryCobranzas.FieldByName('COD_MONEDA_1').Value <> null) and (Copy(QryCobranzas.FieldByName('COD_MONEDA_1').Value,1,1) = 'R') then
	  Acumular_En_Tabla(3,'RET','RETENCIONES',QryCobranzas.FieldByName('IMPORTE_MONEDA_1').Value);

 	if (QryCobranzas.FieldByName('COD_MONEDA_2').Value <> null) and (Copy(QryCobranzas.FieldByName('COD_MONEDA_2').Value,1,1) = 'R') then
	  Acumular_En_Tabla(3,'RET','RETENCIONES',QryCobranzas.FieldByName('IMPORTE_MONEDA_2').Value);

 	if (QryCobranzas.FieldByName('COD_MONEDA_3').Value <> null) and (Copy(QryCobranzas.FieldByName('COD_MONEDA_3').Value,1,1) = 'R') then
	  Acumular_En_Tabla(3,'RET','RETENCIONES',QryCobranzas.FieldByName('IMPORTE_MONEDA_3').Value);

 	if (QryCobranzas.FieldByName('COD_MONEDA_4').Value <> null) and (Copy(QryCobranzas.FieldByName('COD_MONEDA_4').Value,1,1) = 'R') then
	  Acumular_En_Tabla(3,'RET','RETENCIONES',QryCobranzas.FieldByName('IMPORTE_MONEDA_4').Value);

end;

procedure TRepoSalida003ATISxMoneda.Clasificar_Importes;
begin
	{ Acumular por moneda en tabla en memoria }
  RxMDTotalesXMoneda.Open;
  QryEntidades.Open;
  QryCobranzas.First;
  while not QryCobranzas.Eof do
  begin
  	if QryCobranzas.FieldByName('IMPORTE_EN_PESOS').Value > 0 then
	    Acumular_En_Tabla(2,'PES','IMPORTE EN PESOS',QryCobranzas.FieldByName('IMPORTE_EN_PESOS').Value);

    Clasificar_Tarjetas;
    Acumular_Cheques;
    Acumular_Retenciones;

    QryCobranzas.Next;
  end;
  QryEntidades.Close;
  RxMDTotalesXMoneda.SortOnFields('ORDEN');
end;

procedure TRepoSalida003ATISxMoneda.Clasificar_Tarjetas;
var
	clave: String;
  importe: Double;
  nOrden: Integer;
begin
 	if QryCobranzas.FieldByName('COD_MONEDA_1').Value = 'TAR'  then
  begin
  	nOrden := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsInteger;
		clave := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsString;
    importe := QryCobranzas.FieldByName('IMPORTE_MONEDA_1').Value;
	  Acumular_En_Tabla(nOrden,clave,'',importe);
  end;
 	if QryCobranzas.FieldByName('COD_MONEDA_2').Value = 'TAR'  then
 	begin
  	nOrden := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsInteger;
		clave := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsString;
 	  importe := QryCobranzas.FieldByName('IMPORTE_MONEDA_2').Value;
	  Acumular_En_Tabla(nOrden,clave,'',importe);
  end;
 	if QryCobranzas.FieldByName('COD_MONEDA_3').Value = 'TAR'  then
 	begin
  	nOrden := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsInteger;
		clave := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsString;
 	  importe := QryCobranzas.FieldByName('IMPORTE_MONEDA_3').Value;
	  Acumular_En_Tabla(nOrden,clave,'',importe);
  end;
 	if QryCobranzas.FieldByName('COD_MONEDA_4').Value = 'TAR'  then
 	begin
  	nOrden := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsInteger;
		clave := QryCobranzas.FieldByName('COD_ENTIDAD_PAGADORA').AsString;
 	  importe := QryCobranzas.FieldByName('IMPORTE_MONEDA_4').Value;
	  Acumular_En_Tabla(nOrden,clave,'',importe);
  end;

end;

procedure TRepoSalida003ATISxMoneda.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLCantidad.Caption := IntToStr(QryCobranzas.RecordCount);

end;

procedure TRepoSalida003ATISxMoneda.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
	QRLTitulo2.Caption := 'Fecha de Proceso: ' + DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual);

end;

procedure TRepoSalida003ATISxMoneda.QryBaseAfterOpen(DataSet: TDataSet);
begin
  inherited;
  QryCobranzas.Parameters.ParamByName('pFh_proceso').Value := FRegistroDistribucion.FMaxFh_Proceso_Actual;
  QryCobranzas.Open;
  Clasificar_Importes;

end;

end.
