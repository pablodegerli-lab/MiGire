unit URepoSalida018EntSucCableDebito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida018EntSucCableDebito = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QryBaseFH_PROCESO: TDateTimeField;
    QryBaseCOD_CABLEVISION_ID: TBCDField;
    QryBaseDESCCABLE: TStringField;
    QryBaseCOD_ENTIDAD: TBCDField;
    QryBaseFH_COBRO: TDateTimeField;
    QryBaseCANT_TOT: TBCDField;
    QryBaseIMP_TOT: TBCDField;
    QryBaseCANT_ACEP: TBCDField;
    QryBaseIMP_ACEP: TBCDField;
    QryBaseCANT_RECH: TBCDField;
    QryBaseIMP_RECH: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

end.
