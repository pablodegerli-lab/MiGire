unit Espera;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, ToolWin, StdCtrls;

type
  TIconAnimat = (iaCopiaArchivos, iaBorraArchivos, iaBuscaArchivo,
    iaBuscaCarpeta, iaBuscaEnPC, iaNone);
  TCentrarEsperar = (ecPantalla, ecFormulario);
  TEsperar = class(TComponent)
  private
    { Private declarations }
    FEstado: boolean;
    FText: string;
    FIconoAnimado: TIconAnimat;
    FBarraDeProgreso: boolean;
    FBarraValMax: integer;
    FBarraValMin: integer;
    FOcultaVentana: boolean;
    FHabilitaVentana: boolean;
    FMuestraAvi: boolean;
    FTipoLetra: TFontStyles;
    FTamanoLetra: integer;
    FColorLetra: TColor;
    FrmEsperar: TForm;
    FPanel2: TPanel;
    FAnimate1: TAnimate;
    FLabel1: TLabel;
    FProgressBar1: TProgressBar;
    FVentanaPre: HWnd;
    FArchivoAvi: string;
    FCentrado: TCentrarEsperar;
    procedure SetIconoAnimado(const Value: TIconAnimat);
    procedure SetMuestraAvi(const Value: boolean);
    procedure SetArchivoAvi(const Value: string);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Mostrarse(Accion: boolean; Pos_Barra: integer = 0);
  published
    { Published declarations }
    property Text: string read FText write FText;
    property IconoAnimado: TIconAnimat read FIconoAnimado write SetIconoAnimado default iaCopiaArchivos;
    property BarraDeProgreso: boolean read FBarraDeProgreso write FBarraDeProgreso;
    property BarraValMax: integer read FBarraValMax write FBarraValMax default 100;
    property BarraValMin: integer read FBarraValMin write FBarraValMin default 0;
    property OcultaVentana: boolean read FOcultaVentana write FOcultaVentana default False;
    property HabilitaVentana: boolean read FHabilitaVentana write FHabilitaVentana default False;
    property MuestraAvi: boolean read FMuestraAvi write SetMuestraAvi default True;
    property TipoLetra: TFontStyles read FTipoLetra write FTipoLetra;
    property TamanoLetra: integer read FTamanoLetra write FTamanoLetra default 8;
    property ColorLetra: TColor read FColorLetra write FColorLetra default 0;
    property ArchivoAvi: string read FArchivoAvi write SetArchivoAvi;
    property Centrado: TCentrarEsperar read FCentrado write FCentrado default ecPantalla;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire', [TEsperar]);
end;

{ TEsperar }

constructor TEsperar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIconoAnimado := iaCopiaArchivos;
  FBarraValMax := 100;
  FBarraValMin := 0;
  FOcultaVentana := False;
  FHabilitaVentana := False;
  FMuestraAvi := True;
  FTipoLetra := [fsItalic, fsBold];
  FTamanoLetra := 8;
  FColorLetra := 0;
  FEstado := False;
  FArchivoAvi := '';
  FCentrado := ecPantalla;
end;

destructor TEsperar.Destroy;
begin
  inherited Destroy;
end;

procedure TEsperar.Mostrarse(Accion: boolean; Pos_Barra: integer);
begin
  if Accion and (not FEstado) then
  begin
    FrmEsperar := TForm.Create(Application);
    try
      with FrmEsperar do
      begin
        BorderStyle := bsNone;
        if (FindWindow(nil, 'Delphi 7') = 0) then
          FormStyle := fsStayOnTop
        else
          FormStyle := fsNormal;

        case FCentrado of
          ecFormulario: Position := poOwnerFormCenter;
          ecPantalla: Position := poDesktopCenter;
        end;

        FPanel2 := Tpanel.Create(FrmEsperar);
        with FPanel2 do
        begin
          Parent := FrmEsperar;
          Align := alClient;
          BorderStyle := bsNone;
          BevelInner := bvLowered;
          BorderWidth := 1;
          BevelOuter := bvRaised;
          BevelWidth := 1;
          Color := clSilver;
          FLabel1 := TLabel.Create(FPanel2);
          with FLabel1 do
          begin
            Parent := FPanel2;
            Left := 3;
            Top := 3;
            Width := 5;
            Height := 13;
          end;
          if FMuestraAvi then
          begin
            FAnimate1 := TAnimate.Create(FPanel2);
            with FAnimate1 do
              Parent := FPanel2;
          end;
          FProgressBar1 := TProgressBar.Create(FPanel2);
          with FProgressBar1 do
          begin
            Parent := FPanel2;
            Left := 3;
            Top := 75;
            Width := 98;
            Height := 16;
            BorderWidth := 2;
            Min := 0;
          end;
        end;
      end;
      FEstado := True;
      FLabel1.Caption := '  ' + FText;
      FLabel1.Font.Name := 'Arial';
      FLabel1.Font.Style := FTipoLetra;
      FLabel1.Font.Size := FTamanoLetra;
      FLabel1.Font.Color := FColorLetra;
      FrmEsperar.Width := FLabel1.Width + 20;
      FrmEsperar.Height := FLabel1.Height + 8;
      if (FIconoAnimado = iaNone) and (FArchivoAvi = '') then
        FMuestraAvi := False;
      if FMuestraAvi then
      begin
        case FIconoAnimado of
          iaCopiaArchivos: FAnimate1.CommonAVI := aviCopyFiles;
          iaBorraArchivos: FAnimate1.CommonAVI := aviDeleteFile;
          iaBuscaArchivo: FAnimate1.CommonAVI := aviFindFile;
          iaBuscaCarpeta: FAnimate1.CommonAVI := aviFindFolder;
          iaBuscaEnPC: FAnimate1.CommonAVI := aviFindComputer;
          iaNone: FAnimate1.FileName := FArchivoAvi;
        end;
        if FLabel1.Width < FAnimate1.Width then
          FrmEsperar.Width := FAnimate1.Width + 20;
        FrmEsperar.Height := FrmEsperar.Height + FAnimate1.Height - 3;
      end;
      if (FrmEsperar.Width < 250) and FMuestraAvi then
        FrmEsperar.Width := 250;
      FLabel1.Align := alTop;
      if FBarraDeProgreso then
      begin
        FProgressBar1.Align := alBottom;
        FrmEsperar.Height := FrmEsperar.Height + FProgressBar1.Height;
        FProgressBar1.Max := FBarraValMax;
        FProgressBar1.Min := FBarraValMin;
      end
      else
        FProgressBar1.Visible := False;
      if FMuestraAvi then
      begin
        FAnimate1.Align := alClient;
        FAnimate1.Active := True;
      end;
      FVentanaPre := GetActiveWindow;
      if not FHabilitaVentana then
        EnableWindow(FVentanaPre, False);
      if FOcultaVentana then
        ShowWindow(FVentanaPre, SW_HIDE);
      FrmEsperar.Show;
      FrmEsperar.Refresh;
      FrmEsperar.Repaint;
    except
      FrmEsperar.Free;
      FEstado := False;
    end;
  end
  else if FEstado and (not Accion) then
  begin
    FrmEsperar.Free;
    FProgressBar1 := nil;
    FEstado := False;
    if FOcultaVentana then
      ShowWindow(FVentanaPre, SW_RESTORE);
    if not FHabilitaVentana then
      EnableWindow(FVentanaPre, True);
  end;
  if FProgressBar1 <> nil then
    FProgressBar1.Position := Pos_Barra;
end;

procedure TEsperar.SetArchivoAvi(const Value: string);
begin
  if FArchivoAvi <> Value then
  begin
    if Value = '' then
      FArchivoAvi := ''
    else
    begin
      if UpperCase(ExtractFileExt(Value)) = '.AVI' then
      begin
        if FileExists(Value) then
        begin
          FIconoAnimado := iaNone;
          FArchivoAvi := Value;
        end
        else
          ShowMessage('No se localizó el archivo' + #13#10 + '"' + Value + '"');
      end
      else
        ShowMessage('Archivo con extensión inválida.');
    end;
  end;
end;

procedure TEsperar.SetIconoAnimado(const Value: TIconAnimat);
begin
  if FIconoAnimado <> Value then
  begin
    FArchivoAvi := '';
    FIconoAnimado := Value;
  end;
end;

procedure TEsperar.SetMuestraAvi(const Value: boolean);
begin
  if (FArchivoAvi <> '') or (IconoAnimado <> iaNone) then
    FMuestraAvi := Value
  else
    FMuestraAvi := False;
end;

end.

