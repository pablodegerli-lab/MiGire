unit degrade;

{$DEBUGINFO OFF}

interface

uses
  Classes, Controls, Graphics, WinTypes, WinProcs, SysUtils;

type
  TDireccion = (dHorizontal, dVertical);
  TDegrade = class(TGraphicControl)
  private
    FDireccion: TDireccion;
    FColorDesde, FColorHasta: TColor;
    procedure SetDireccion(valor: TDireccion);
    procedure SetColorDesde(valor: TColor);
    procedure SetColorHasta(valor: TColor);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Direccion: TDireccion read FDireccion write SetDireccion default dHorizontal;
    property ColorDesde: TColor read FColorDesde write SetColorDesde default clBlue;
    property ColorHasta: TColor read FColorHasta write SetColorHasta default clBlack;
    property Align;
  end;

procedure Register;

implementation

constructor TDegrade.Create(AOwner: TComponent);
var
  I: Integer;
  Total: Integer;
begin
  inherited Create(AOwner);
  Total := 0;
  for I := 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[I] is TDegrade then
      inc(Total);
    if Total > 1 then
      raise Exception.Create('No se admite mas de un componente de la clase '
        + '"TDegrade" por formulario.');
  end;
  FDireccion := dHorizontal;
  FColorDesde := clBlue;
  FColorHasta := clBlack;
  Align := alClient;
end;

procedure TDegrade.SetDireccion(Valor: TDireccion);
begin
  if FDireccion <> valor then
  begin
    FDireccion := Valor;
    Repaint;
  end;
end;

procedure TDegrade.SetColorDesde(Valor: TColor);
begin
  if FColorDesde <> Valor then
  begin
    FColorDesde := Valor;
    Repaint;
  end;
end;

procedure TDegrade.SetColorHasta(Valor: TColor);
begin
  if FColorHasta <> Valor then
  begin
    FColorHasta := Valor;
    Repaint;
  end;
end;

procedure TDegrade.Paint;
var
  RGBDesde, RGBHasta, RGBDif: array[0..2] of byte;
  contador, Rojo, Verde, Azul: integer;
  Banda: TRect;
  Factor: array[0..2] of shortint;
begin
  RGBDesde[0] := GetRValue(ColorToRGB(FColorDesde));
  RGBDesde[1] := GetGValue(ColorToRGB(FColorDesde));
  RGBDesde[2] := GetBValue(ColorToRGB(FColorDesde));
  RGBHasta[0] := GetRValue(ColorToRGB(FColorHasta));
  RGBHasta[1] := GetGValue(ColorToRGB(FColorHasta));
  RGBHasta[2] := GetBValue(ColorToRGB(FColorHasta));
  for contador := 0 to 3 do
  begin
    RGBDif[contador] := Abs(RGBHasta[contador] - RGBDesde[contador]);
    if RGBHasta[contador] > RGBDesde[contador] then factor[contador] := 1 else factor[contador] := -1;
  end;
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Mode := pmCopy;
  if FDireccion = dHorizontal then
  begin
    Banda.Left := 0;
    Banda.Right := Width;
    for contador := 0 to 255 do
    begin
      Banda.Top := MulDiv(contador, height, 256);
      Banda.Bottom := MulDIv(contador + 1, height, 256);
      Rojo := RGBDesde[0] + factor[0] * MulDiv(contador, RGBDif[0], 255);
      Verde := RGBDesde[1] + factor[1] * MulDiv(contador, RGBDif[1], 255);
      Azul := RGBDesde[2] + factor[2] * MulDiv(contador, RGBDif[2], 255);
      Canvas.Brush.Color := RGB(Rojo, Verde, Azul);
      Canvas.FillRect(Banda);
    end;
  end;
  if FDireccion = dVertical then
  begin
    Banda.Top := 0;
    Banda.Bottom := Height;
    for contador := 0 to 255 do
    begin
      Banda.Left := MulDiv(contador, width, 256);
      Banda.Right := MulDIv(contador + 1, width, 256);
      Rojo := RGBDesde[0] + factor[0] * MulDiv(contador, RGBDif[0], 255);
      Verde := RGBDesde[1] + factor[1] * MulDiv(contador, RGBDif[1], 255);
      Azul := RGBDesde[2] + factor[2] * MulDiv(contador, RGBDif[2], 255);
      Canvas.Brush.Color := RGB(Rojo, Verde, Azul);
      Canvas.FillRect(Banda);
    end;
  end;
end;

procedure Register;
begin
  RegisterComponents('Gire', [TDegrade]);
end;

end.

