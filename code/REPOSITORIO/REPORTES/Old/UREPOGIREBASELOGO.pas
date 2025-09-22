unit uRepoGIREBaseLogo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
     ExtCtrls, Forms, Quickrpt, QRCtrls, uRepoGIREBase, Define;

type
  TRepoGIREBaseLogo = class(TRepoGIREBase)
    BandaEncabezado: TQRBand;
    QRImage1: TQRImage;
    lblNombreSistema: TQRLabel;
    lblPagina: TQRLabel;
    lblFecha: TQRLabel;
    lblHora: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    lblDateLine: TQRLabel;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.DFM}

constructor TRepoGIREBaseLogo.Create(AOwner: TComponent);
begin
  inherited;
  lblNombreSistema.Caption := Application.Name;
  lblDateLine.Caption:= DateLine;
end;


end.
