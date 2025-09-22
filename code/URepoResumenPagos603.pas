unit URepoResumenPagos603;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg, define;

type
  TRepoResumenPagos603 = class(TRepoGemaBaseEmpresa)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    qrBandPieLote: TQRBand;
    QryBaseCOD_CIA_CITI: TIntegerField;
    QryBaseCOD_ENTIDAD: TIntegerField;
    QryBaseNOMBRE_ENTIDAD: TStringField;
    QryBaseNOMBRE_CIA_CITI: TStringField;
    QryBaseCUIT_CIA_CITI: TBCDField;
    QryBasePRESTACION: TStringField;
    QryBaseDEB_ACEP: TBCDField;
    QryBaseREV_ACEP: TBCDField;
    QryBaseDEB_RECH: TBCDField;
    QryBaseREV_RECH: TBCDField;
    qrBandTotalGral: TQRBand;
    QryBaseDETALLE: TWideStringField;
    QRDBText12: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QryBaseCABECERA: TWideStringField;
    QRDBText7: TQRDBText;
    QryBasePIE: TWideStringField;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    lblTotales: TQRLabel;
    QRLabel1: TQRLabel;
    lblTotalGral: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    lblLinea1: TQRLabel;
    lblLinea2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand3: TQRBand;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    procedure BandaDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBandPieLoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBandTotalGralBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QryBaseBeforeOpen(DataSet: TDataSet);
  private
    cDA, cRA, cDR, cRR:currency;
    cTDA, cTRA, cTDR, cTRR:currency;
    procedure InicializoVariables;
  protected
    procedure Ver_Ejecuta_Totales; override;
  public
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoResumenPagos603 }

procedure TRepoResumenPagos603.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;
end;

procedure TRepoResumenPagos603.BandaDetalleBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//  inherited;
  cDA := cDA + QryBaseDEB_ACEP.Value;
  cRA := cRA + QryBaseREV_ACEP.Value;
  cDR := cDR + QryBaseDEB_RECH.Value;
  cRR := cRR + QryBaseREV_RECH.Value;

  cTDA := cTDA + QryBaseDEB_ACEP.Value;
  cTRA := cTRA + QryBaseREV_ACEP.Value;
  cTDR := cTDR + QryBaseDEB_RECH.Value;
  cTRR := cTRR + QryBaseREV_RECH.Value;

end;

procedure TRepoResumenPagos603.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lblUsuario.caption := GemaConexion.UsuarioNombre;
  QRLTitulo2.Caption := 'Fecha de compensación : '+DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual);
  qrlGire.caption := trim(qrlGire.Caption);

  //LABL 20160728 lblLinea1.caption := lblNombreEmpresa.Caption + ' ' + trim(lblDateLine.caption) + '      CIERRE DE CAMARA COMPENSADORA';
  lblLinea1.caption := trim(lblDateLine.caption) + '      CIERRE DE CAMARA COMPENSADORA';
  lblLinea2.caption := 'GIRE S.A.                                                         Hoja:'+ formatFloat('#0',Self.PageNumber);
////LABL 20160728  QRLabel8.caption := 'EMPRESA: ' + lblNombreEmpresa.Caption;
//LABL 20160728  QRLabel8.caption := 'EMPRESA : ' + lblNombreEmpresa.Caption;
  QRLabel8.caption := 'EMPRESA : ' + IIF(FRegistroDistribucion.Cod_Cia=603,'CITIBANK',lblNombreEmpresa.Caption);
  lblDateLine.Enabled := false;
  qrSysData1.Enabled := false;
  qrlGire.Enabled := false;
  //InicializoVariables;
end;

procedure TRepoResumenPagos603.qrBandPieLoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

  lblTotales.Caption :=
  padl(' ',15,' ') +
  padl(formatFloat('##########0.00',cDA),15,' ') +
  padl(formatFloat('##########0.00',cRA),14,' ') +
  padl(formatFloat('##########0.00',cDR),14,' ') +
  padl(formatFloat('##########0.00',cRR),15,' ');
  QRMemo1.Lines.Clear;
  QRMemo1.lines.Add(QryBase.fieldbyname('PIE').AsString);
  //InicializoVariables;
end;

procedure TRepoResumenPagos603.InicializoVariables;
begin
  cDA := 0;
  cRA := 0;
  cDR := 0;
  cRR := 0;
end;

procedure TRepoResumenPagos603.qrBandTotalGralBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  //lblTotalGral.caption :=
  QRMemo2.Lines.Clear;
  QRMemo2.Lines.Add(
    padr('Total General',15,' ') +
  padl(formatFloat('##########0.00',cTDA),15,' ') +
  padl(formatFloat('##########0.00',cTRA),14,' ') +
  padl(formatFloat('##########0.00',cTDR),14,' ') +
  padl(formatFloat('##########0.00',cTRR),15,' '));
end;

procedure TRepoResumenPagos603.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  InicializoVariables;  
end;

procedure TRepoResumenPagos603.QryBaseBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  cTDA := 0;
  cTRA := 0;
  cTDR := 0;
  cTRR := 0;
end;

end.
