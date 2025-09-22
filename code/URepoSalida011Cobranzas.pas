unit URepoSalida011Cobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, UDMConsultaDistribucion, DBClient, UGeneral,
  jpeg;

type
  TRepoSalida011Cobranzas = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    Nombre_Archivo: TQRDBText;
    IMPORTE_ACEPTADOS: TQRDBText;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRESum: TQRExpr;
    IMPORTE_REVERSIONES: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    CANTIDAD_ACEPTADOS: TQRDBText;
    CANTIDAD_REVERSIONES: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
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

procedure TRepoSalida011Cobranzas.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lblUsuario.caption := GemaConexion.UsuarioNombre;  
  PrintBand := True;
end;

procedure TRepoSalida011Cobranzas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := False;

end;

procedure TRepoSalida011Cobranzas.NRO_TARJEPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := #34+Value+#34;
end;

procedure TRepoSalida011Cobranzas.SetTabla_Reporte(
  const Value: TClientDataSet);
begin
  FTabla_Reporte := Value;
end;

constructor TRepoSalida011Cobranzas.create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion; ANro_Corrida: Double;
  ACopia: String;  Tabla_Reporte: TClientDataSet);
begin
  inherited Create(AOwner);
  FRegistroDistribucion := ARegistroDistribucion;
  DataSet := Tabla_Reporte;
end;

end.

