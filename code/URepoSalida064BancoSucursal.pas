unit URepoSalida064BancoSucursal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida064BancoSucursal = class(TRepoGemaBaseEmpresa)
    QRGroupBanco: TQRGroup;
    QRGroupSucursal: TQRGroup;
    QRFooterBanco: TQRBand;
    QRFooterSucursal: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QryBaseCOD_ENTIDAD: TIntegerField;
    QryBaseCOD_SUCURSAL_CABLE: TIntegerField;
    QryBaseCANTIDAD: TBCDField;
    QryBaseIMPORTE: TBCDField;
    QryBaseRAZONSOCIAL: TStringField;
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoSalida064BancoSucursal }

end.
