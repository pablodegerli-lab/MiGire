unit URepoSalida008SAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida008SAP = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QryBaseMES: TStringField;
    QryBaseANIO: TStringField;
    QryBaseTARJETAS: TStringField;
    QryBaseDESCRIPCION: TStringField;
    QryBaseCUIT: TStringField;
    QryBaseFH_DEPOSITO: TDateTimeField;
    QryBaseNRO_COMPROBANTE_IVA: TStringField;
    QryBaseIMPORTE: TBCDField;
    QryBaseNUM_SUC: TStringField;
    QryBaseTIP_COMP: TStringField;
    QryBaseLET_COMP: TStringField;
    QryBaseNUM_COMP: TStringField;
    QryBasePROVINCIA: TStringField;
    QryBaseCOD_JUR: TStringField;
    QryBaseSOBRE: TStringField;
    QryBaseHOJA: TStringField;
    QryBaseDESCRIPCION1: TStringField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

procedure TRepoSalida008SAP.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
   if QryBase.FieldByName('HOJA').AsString = '1' then
     QRLabel9.Caption := 'Ret.IVA RG3130'
  else
     QRLabel9.Caption := 'Ret.IIBB 2%';
end;

end.

