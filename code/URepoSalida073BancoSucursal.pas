unit URepoSalida073BancoSucursal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida073BancoSucursal = class(TRepoGemaBaseEmpresa)
    QRGBanco: TQRGroup;
    QRFBanco: TQRBand;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel6: TQRLabel;
    QRGSucursal: TQRGroup;
    QRFSucursal: TQRBand;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QryBaseENTIDAD: TIntegerField;
    QryBaseRAZONSOCIAL: TStringField;
    QryBaseCOD_SUCURSAL: TIntegerField;
    QryBaseIMPORTE: TBCDField;
    QryBaseCOMISION: TBCDField;
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoSalida073BancoSucursal }

end.
