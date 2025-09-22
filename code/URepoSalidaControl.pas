unit URepoSalidaControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalidaControl = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBTImporte: TQRDBText;
    QRDBTObservacion: TQRDBText;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLHoraDesde: TQRLabel;
    QRLabel8: TQRLabel;
    QRLHoraHasta: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRLNombreArchivo: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion, uRepoGIREBaseLogo;

{$R *.DFM}

{ TRepoSalidaControl }

procedure TRepoSalidaControl.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
	HoraDesde, HoraHasta: Double;
begin
		HoraDesde := Time + 0.00694444;
  	HoraHasta := HoraDesde + 0.02083333;
	  QRLHoraDesde.Caption := TimeToStr(HoraDesde);
  	QRLHoraHasta.Caption := TimeToStr(HoraHasta);
    //lblUsuario.Caption := 'prueba';//Usuario;
end;

procedure TRepoSalidaControl.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel5.Caption := 'Informe del resultado del proceso '+IntToStr(FRegistroDistribucion.Nro_Proceso);
end;

procedure TRepoSalidaControl.BandaDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  PrintBand := (QryBase.FieldByName('NOMBRE_ARCHIVO').asString  <> '') or
               ((QryBase.RecordCount = 1) and (QryBase.FieldByName('NOMBRE_ARCHIVO').asString =  '') and (QryBase.FieldByName('CANTIDAD_LOTES').asInteger = 4));

end;

procedure TRepoSalidaControl.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lblUsuario.caption := GemaConexion.UsuarioNombre;
end;

end.
