unit URepoSalida064SucCableBco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UrepoGemaBaseEmpresa, Db, ADODB, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TRepoSalida064SucCableBco = class(TRepoGemaBaseEmpresa)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QryBaseFH_PROCESO: TDateTimeField;
    QryBaseCOD_SUCURSAL_CABLE: TIntegerField;
    QryBaseCOD_ENTIDAD_SEGUN_CIA: TStringField;
    QryBaseCANTIDAD: TBCDField;
    QryBaseIMPORTE: TBCDField;
    procedure BandaEncabezadoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TRepoSalida064SucCableBco.BandaEncabezadoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := False;
end;

end.
