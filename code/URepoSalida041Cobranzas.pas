unit URepoSalida041Cobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida041Cobranzas = class(TRepoGemaBaseEmpresa)
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    BandaDeTotales: TQRBand;
    ImporteTotal: TQRExpr;
    CantidadTotal: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QryBaseTARJETA: TStringField;
    QryBaseCANTIDAD: TBCDField;
    QryBaseIMPORTE: TBCDField;
    QryBaseFH_PROCESO: TDateTimeField;
    procedure QRLabel13Print(sender: TObject; var Value: String);
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


procedure TRepoSalida041Cobranzas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := False;

end;

procedure TRepoSalida041Cobranzas.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  inherited;
  value := 'Fecha de Proceso: ' + QryBase.FieldByName('FH_PROCESO').AsString;  
end;

end.


