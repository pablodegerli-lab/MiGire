unit URepoSalida018EntSucCable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida018EntSucCable = class(TRepoGemaBaseEmpresa)
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
    QryBaseFH_PROCESO: TDateTimeField;
    QryBaseCOD_CABLEVISION_ID: TIntegerField;
    QryBaseDESCCABLE: TStringField;
    QryBaseCOD_ENTIDAD: TBCDField;
    QryBaseDESCENTIDAD: TStringField;
    QryBaseFH_COBRO: TDateTimeField;
    QryBaseCANTIDAD: TBCDField;
    QryBaseIMPORTE: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

end.
 
