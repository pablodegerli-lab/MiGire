unit URepoSalida017Cobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida017Cobranzas = class(TRepoGemaBaseEmpresa)
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
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QryBaseAGENTE: TIntegerField;
    QryBaseIMPORTE: TBCDField;
    QryBaseTARJETA: TStringField;
    QryBaseCOD_AUTORIZA: TStringField;
    QryBaseNRO_OP: TBCDField;
    QryBaseNUMERO_CUPON: TIntegerField;
    QryBaseLOTE_TARJETA: TIntegerField;
    QryBaseCUOTAS: TIntegerField;
    QryBaseFECHA_OP: TDateTimeField;
    QryBaseTIPO_FC: TStringField;
    QryBaseFACTURA: TStringField;
    QryBaseCLIENTE: TStringField;
    QryBaseCOD_ENTIDAD_SEGUN_CIA: TStringField;
    QryBaseDESCRIPCION: TStringField;
  private
    { Private declarations }
  protected
    procedure Ver_Ejecuta_Totales; override;    
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;


{$R *.DFM}


procedure TRepoSalida017Cobranzas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;

end;

end.


