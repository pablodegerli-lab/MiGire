unit uRepoGIREBase;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DB;

type
  TBandaDetalleColor = array[Boolean] of TColor;

  TRepoGIREBase = class(TQuickRep)
    BandaDetalle: TQRBand;
    procedure BandaDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FBandasPares: Boolean;
    procedure IniBandaDetalleColor;
    procedure SetControlsDataSet(ADataSet: TDataSet);
    procedure SetControlsColor(ABandaDetalle: TQRCustomBand);
  protected
    FBandaDetalleColor: TBandaDetalleColor;
  public
    property BandasPares: Boolean read FBandasPares write FBandasPares default False;
    procedure SetDataSet(ADataSet: TDataSet); overload;
    procedure SetDataSet; overload;
    constructor Create(AOwner: TComponent); override;
  end;

  TRepoGIREClass = class of TRepoGIREBase;

var
  RepoGIREBase: TRepoGIREBase;

implementation

{$R *.DFM}

constructor TRepoGIREBase.Create(AOwner: TComponent);
begin
  inherited;
  IniBandaDetalleColor;
  FBandasPares := False;
end;

procedure TRepoGIREBase.IniBandaDetalleColor;
begin
  FBandaDetalleColor[False] := clWhite;
  FBandaDetalleColor[True] := clSilver;
end;

procedure TRepoGIREBase.BandaDetalleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if FBandasPares then
  begin
    Sender.Color := FBandaDetalleColor[ (RecordNumber mod 2) = 0 ] ;
    SetControlsColor( Sender );
  end;

end;

procedure TRepoGIREBase.SetDataSet(ADataSet: TDataSet);
begin
  if DataSet = nil then
    DataSet := ADataSet;

  SetControlsDataSet(ADataSet);
end;

procedure TRepoGIREBase.SetControlsDataSet(ADataSet: TDataSet);
var
  i: Integer;
begin
  for i := 0 to ControlCount -1 do
    if (Controls[i] is TQRDBText)
       or (Controls[i] is TQRDBRichText)
       or (Controls[i] is TQRDBImage) then
       TQRDBText(Controls[i]).DataSet := ADataSet;

end;

procedure TRepoGIREBase.SetDataSet;
begin
  SetControlsDataSet(DataSet);
end;

procedure TRepoGIREBase.SetControlsColor(ABandaDetalle: TQRCustomBand);
var
  i: Integer;
begin
  ABandaDetalle.Color := FBandaDetalleColor[ (RecordNumber mod 2) = 0 ];
  for i := 0 to ABandaDetalle.ControlCount -1 do
  begin
    if (ABandaDetalle.Controls[i] is TQRCustomLabel) then
    (ABandaDetalle.Controls[i] as TQRCustomLabel).Color := FBandaDetalleColor[ (RecordNumber mod 2) = 0 ] ;
    if (ABandaDetalle.Controls[i] is TQRCustomRichText) then
    (ABandaDetalle.Controls[i] as TQRCustomRichText).Color := FBandaDetalleColor[ (RecordNumber mod 2) = 0 ] ;
  end;

end;

end.
