unit URepoSalida008AltasBajas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida008AltasBajas = class(TRepoGemaBaseEmpresa)
    QryBaseBANCO: TIntegerField;
    QryBaseRAZONSOCIAL: TStringField;
    QryBaseCLIENTE: TStringField;
    QryBaseTIPO: TStringField;
    QryBaseCBU_TARJETA: TStringField;
    QryBaseFH_VENCIMIENTO: TDateTimeField;
    QryBaseFH_PRESENTACION: TDateTimeField;
    QryBaseFH_PROCESO: TDateTimeField;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QryBaseID_TIPO_DEBITO: TStringField;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
  protected
    procedure Ver_Ejecuta_Totales; override;
  public
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

{ TRepoSalida008AltasBajas }

procedure TRepoSalida008AltasBajas.Ver_Ejecuta_Totales;
begin
  EjecutaTotales := True;
end;

procedure TRepoSalida008AltasBajas.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
	if QryBaseID_TIPO_DEBITO.Value = 'D' then
    lbltitulo.Text := 'Altas y Bajas de Debito Directo'
  else
    lbltitulo.Text := 'Altas y Bajas de Debito Automatico';
end;

end.
