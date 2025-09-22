unit URepoSalida508Cobranzas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida508Cobranzas = class(TRepoGemaBaseEmpresa)
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
    QryBaseTARJETA_GLOBAL: TIntegerField;
    QryBaseIMPORTE_COBRADO: TBCDField;
    QryBaseFH_OPERACION: TDateTimeField;
    QryBaseFH_PRESENTACION: TDateTimeField;
    QryBaseCOD_ENTIDAD: TIntegerField;
    QryBaseCBU_TARJETA: TStringField;
    QryBaseNRO_OPERACION: TBCDField;
    QryBaseCOD_ACCION: TStringField;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure NRO_TARJEPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  protected
    procedure Ver_Ejecuta_Totales; override;
    procedure Asignar_ParTotales; override;
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

procedure TRepoSalida508Cobranzas.Asignar_ParTotales;
begin
  QryTotales.Parameters.ParamByName('pFh_Proceso').Value := FRegistroDistribucion.FMaxFh_Proceso_Actual;

end;

procedure TRepoSalida508Cobranzas.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
end;

procedure TRepoSalida508Cobranzas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;

end;

procedure TRepoSalida508Cobranzas.NRO_TARJEPrint(sender: TObject;
  var Value: String);
begin
  Value := '"'+Value+'"';
end;

end.
