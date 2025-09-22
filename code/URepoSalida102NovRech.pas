unit URepoSalida102NovRech;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg, define;

type
  TRepoSalida102NovRech = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    A00: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QryBaseCLIENTE: TStringField;
    QryBaseTIPO_TRX: TStringField;
    QryBaseCOD_ENTIDAD: TIntegerField;
    QryBaseFH_TRX: TStringField;
    QryBaseTIPO_RECHAZO: TStringField;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure FH_VENTAPrint(sender: TObject; var Value: String);
    procedure A00Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  protected
    procedure Ver_Ejecuta_Totales; override;
    procedure Asignar_ParTotales; override;
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion, Variants;

{$R *.DFM}

procedure TRepoSalida102NovRech.Asignar_ParTotales;
begin
  QryTotales.Parameters.ParamByName('pFh_Proceso').Value := FRegistroDistribucion.FMaxFh_Proceso_Actual;

end;

procedure TRepoSalida102NovRech.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
end;

procedure TRepoSalida102NovRech.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;

end;

procedure TRepoSalida102NovRech.QRDBText5Print(sender: TObject;
  var Value: String);
var sAux:string;
begin
//  inherited;
  value := ''''+value;
end;

procedure TRepoSalida102NovRech.FH_VENTAPrint(sender: TObject;
  var Value: String);
var sAux:string;
begin
//  inherited;
end;

procedure TRepoSalida102NovRech.A00Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value :=  ''''+Value;
end;

end.
