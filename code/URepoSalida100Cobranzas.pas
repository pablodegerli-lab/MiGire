unit URepoSalida100Cobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, UDMConsultaDistribucion, DBClient, UGeneral,
  jpeg;

type
  TRepoSalida100Cobranzas = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Nombre_Archivo: TQRDBText;
    IMPORTE_ACEPTADOS: TQRDBText;
    IMPORTE_RECHAZADOS: TQRDBText;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRECount: TQRExpr;
    QRESum: TQRExpr;
    IMPORTE_REVERSIONES: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    CANTIDAD_ACEPTADOS: TQRDBText;
    CANTIDAD_RECHAZADOS: TQRDBText;
    CANTIDAD_REVERSIONES: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure NRO_TARJEPrint(sender: TObject; var Value: String);
  private
    FTabla_Reporte: TClientDataSet;
    procedure SetTabla_Reporte(const Value: TClientDataSet);
    { Private declarations }
  protected
    procedure Ver_Ejecuta_Totales; override;
  public
    { Public declarations }
    constructor create (AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ANro_Corrida: Double; ACopia: String; Tabla_Reporte: TClientDataSet);reintroduce; overload;
    property Tabla_Reporte : TClientDataSet read FTabla_Reporte write SetTabla_Reporte;
  end;

implementation

uses UDMGemaConexion, UDMGeneraArchivos;

{$R *.DFM}

procedure TRepoSalida100Cobranzas.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := True;
end;

procedure TRepoSalida100Cobranzas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := False;

end;

procedure TRepoSalida100Cobranzas.NRO_TARJEPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := #34+Value+#34;
end;

procedure TRepoSalida100Cobranzas.SetTabla_Reporte(
  const Value: TClientDataSet);
begin
  FTabla_Reporte := Value;
end;

constructor TRepoSalida100Cobranzas.create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion; ANro_Corrida: Double;
  ACopia: String;  Tabla_Reporte: TClientDataSet);
begin
  inherited Create(AOwner);
  FRegistroDistribucion := ARegistroDistribucion;
  DataSet := Tabla_Reporte;
end;

end.

