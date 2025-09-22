unit UFrmProgreso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Animate, UGeneral, GIFCtrl, Gauges;
type
  TFrmProgresoDistribucion = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    LEmpresa: TLabel;
    Label9: TLabel;
    LProceso: TLabel;
    Label10: TLabel;
    LFh_Proceso: TLabel;
    REProgreso: TMemo;
    GifAnimadoEngranajes: TRxGIFAnimator;
    PBGeneraFiles: TGauge;
    procedure FormActivate(Sender: TObject);
  private
    FRegistroDistribucion: TRegistroDistribucion;
  public
    constructor create (AOwner: TComponent; ARegistro: TRegistroDistribucion); reintroduce; overload;
  end;

implementation

{$R *.DFM}

procedure TFrmProgresoDistribucion.FormActivate(Sender: TObject);
begin
  GifAnimadoEngranajes.Animate := True;
  LEmpresa.Caption := IntToStr(FRegistroDistribucion.Cod_Cia)+' - '+FRegistroDistribucion.RazonSocial;
  LProceso.Caption := IntToStr(FRegistroDistribucion.Nro_Proceso)+' - '+FRegistroDistribucion.DescProceso;
  LFh_Proceso.Caption := DateToStr(FRegistroDistribucion.Fh_Proceso);
  Application.ProcessMessages;

end;

constructor TFrmProgresoDistribucion.create(AOwner: TComponent;
  ARegistro: TRegistroDistribucion);
begin
  inherited Create (AOwner);
  REProgreso.Color := TColor($02AF7F06);
  FRegistroDistribucion := ARegistro;
  PBGeneraFiles.ForeColor := TColor($02AF7F06);
end;

end.
