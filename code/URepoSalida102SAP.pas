unit URepoSalida102SAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida102SAP = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBTCantidad: TQRDBText;
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
    QRLNOMBRE_ARCHIVO: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QryBaseNOMBRE_ARCHIVO: TStringField;
    QryBaseCANTIDAD_REGISTROS: TIntegerField;
    QryBaseCANTIDAD_MOVIMIENTOS: TIntegerField;
    QryBaseCANTIDAD_LOTES: TIntegerField;
    QryBaseIMPORTE: TBCDField;
    QryBaseDESCRIPCION_MAIL: TStringField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BandaDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoSalida102SAP }

procedure TRepoSalida102SAP.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
	HoraDesde, HoraHasta: Double;
begin
	if FRegistroDistribucion.Cod_Cia = 3 then
  begin
    QRLabel6.Enabled := False;
    QRLabel7.Enabled := False;
    QRLabel8.Enabled := False;
    QRLHoraDesde.Enabled := False;
    QRLHoraHasta.Enabled := False;
  end
  else
  begin
		HoraDesde := Time + 0.00694444;
  	HoraHasta := HoraDesde + 0.02083333;
	  QRLHoraDesde.Caption := TimeToStr(HoraDesde);
  	QRLHoraHasta.Caption := TimeToStr(HoraHasta);
  end;
end;

procedure TRepoSalida102SAP.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel5.Caption := 'Informe del resultado del proceso '+IntToStr(FRegistroDistribucion.Nro_Proceso);
	if (FRegistroDistribucion.Cod_Cia <> 8) and (FRegistroDistribucion.Cod_Cia <> 92) then
  begin
    QRLabel10.Enabled := False;
    QRLabel11.Enabled := False;
  end;
end;

procedure TRepoSalida102SAP.BandaDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
	if FRegistroDistribucion.Cod_Cia = 3 then
  	// Quitar la extension y forzar .COB
	  QRLNOMBRE_ARCHIVO.Caption := Copy(QryBaseNOMBRE_ARCHIVO.Value,0,Pos('.',QryBaseNOMBRE_ARCHIVO.Value))+'COB'
  else
	  QRLNOMBRE_ARCHIVO.Caption := QryBaseNOMBRE_ARCHIVO.Value;
	if (FRegistroDistribucion.Cod_Cia <> 8) and (FRegistroDistribucion.Cod_Cia <> 92) then
  begin
    QRDBText1.Enabled := False;
    QRDBText2.Enabled := False;
  end;
end;

end.
