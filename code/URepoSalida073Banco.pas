unit URepoSalida073Banco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida073Banco = class(TRepoGemaBaseEmpresa)
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRDBTBanco: TQRDBText;
    QRDBTRazon: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel6: TQRLabel;
    QryBaseENTIDAD: TIntegerField;
    QryBaseRAZONSOCIAL: TStringField;
    QryBaseIMPORTE: TBCDField;
    QryBaseCOMISION: TBCDField;
  private
  protected
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

end.
