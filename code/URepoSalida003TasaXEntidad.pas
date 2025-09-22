unit URepoSalida003TasaXEntidad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida003TasaPorEntidad = class(TRepoGemaBaseEmpresa)
    ChildBand1: TQRChildBand;
    lBanco: TQRLabel;
    lDescripcion: TQRLabel;
    QRLabel1: TQRLabel;
    lTalones: TQRLabel;
    lImpCob: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    dbBanco: TQRDBText;
    dbDescripcion: TQRDBText;
    dbTalones: TQRDBText;
    dbImpCob: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    BandaTotales: TQRBand;
    lTotal: TQRLabel;
    v_dbTalones: TQRExpr;
    v_dbImpCob: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QryBaseDBBANCO: TStringField;
    QryBaseDBDESCRIPCION: TStringField;
    QryBaseDBCANAUTO: TBCDField;
    QryBaseDBIMPAUTO: TBCDField;
    QryBaseDBCANNOAUTO: TBCDField;
    QryBaseDBIMPNOAUTO: TBCDField;
    QryBaseDBCANSIGE: TBCDField;
    QryBaseDBIMPSIGE: TBCDField;
    QryBaseDBCANCARS: TBCDField;
    QryBaseDBIMPCARS: TBCDField;
    QryBaseDBCANATIS: TBCDField;
    QryBaseDBIMPATIS: TBCDField;
    QryBaseDBCANTIDAD: TBCDField;
    QryBaseDBIMPORTE: TBCDField;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

procedure TRepoSalida003TasaPorEntidad.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
	cNroProc: String;
begin
  inherited;
  if FRegistroDistribucion.Nro_Proceso = 1 then
  	cNroProc := ' (UNO)'
  else
  	cNroProc := ' (DOS)';
  lblNombreEmpresa.Caption := 'Telefónica de Argentina - Proceso '+IntToStr(FRegistroDistribucion.Nro_Proceso)+cNroProc;
	QRLTitulo2.Caption := 'Cobranzas Ventanilla - Fecha de Proceso: ' + DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual);

end;

end.
