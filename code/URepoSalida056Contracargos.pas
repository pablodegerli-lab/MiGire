unit URepoSalida056Contracargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida056Contracargos = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    TARJ_GLOB: TQRDBText;
    IMPORTE: TQRDBText;
    FH_VENTA: TQRDBText;
    FH_PRESENT: TQRDBText;
    COD_TARJE: TQRDBText;
    NRO_TARJE: TQRDBText;
    NRO_OPERAC: TQRDBText;
    C_ACCION: TQRDBText;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRECount: TQRExpr;
    QRESum: TQRExpr;
    QryBaseCOD_ENTIDAD: TIntegerField;
    QryBaseCLIENTE: TStringField;
    QryBaseIMPORTE_COBRADO: TBCDField;
    QryBaseFH_CONTRACARGO: TDateTimeField;
    QryBaseFH_VENCIMIENTO: TDateTimeField;
    QryBaseCBU_TARJETA: TStringField;
    QryBaseMONEDA_FACTURACION: TStringField;
    QryBaseID_TIPO_DEBITO: TStringField;
    QryBaseINCONSISTENCIA: TStringField;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure NRO_TARJEPrint(sender: TObject; var Value: String);
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

procedure TRepoSalida056Contracargos.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
end;

procedure TRepoSalida056Contracargos.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;

end;

procedure TRepoSalida056Contracargos.NRO_TARJEPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := #34+Value+#34;
end;

end.
 
