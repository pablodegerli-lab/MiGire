unit URepoSalida017Contracargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida017Contracargos = class(TRepoGemaBaseEmpresa)
    QRGEntidad: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QREInconsistencia: TQRExpr;
    BandaPiedeGrupo: TQRBand;
    QRSImporte: TQRExpr;
    QRLabel7: TQRLabel;
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QryBaseENTIDAD: TIntegerField;
    QryBaseRAZONSOCIAL: TStringField;
    QryBaseIMPORTE: TBCDField;
    QryBaseCBU_TARJETA: TStringField;
    QryBaseCLIENTE: TStringField;
    QryBaseFH_VENCIMIENTO: TDateTimeField;
    QryBaseINCONSISTENCIA: TStringField;
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

{ TRepoSalida017Contracargos }

procedure TRepoSalida017Contracargos.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;

end;

end.
