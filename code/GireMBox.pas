unit GireMBox;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Math;

type
  TGireMessageBox = class(TComponent)
  private
    FBotones: TStrings;
    FLetraDelMensaje: TFont;
    FTitulo: string;
    FIcono: TIcon;
    FMensaje: TStrings;
    FVerAhora: boolean;
    FColorDelFondo: TColor;
    FBotonPorDefaul: integer;
    FRetorno: integer;
    Formulario: TForm;
    procedure SetBotones(const Value: TStrings);
    procedure SetLetraDelMensaje(const Value: TFont);
    procedure SetTitulo(const Value: string);
    procedure SetIcono(const Value: TIcon);
    procedure SetMensaje(const Value: TStrings);
    procedure SetVerAhora(const Value: boolean);
    procedure SetColorDelFondo(const Value: TColor);
    procedure SetBotonPorDefaul(const Value: integer);
    { Private declarations }
  protected
    { Protected declarations }
    procedure MiOnClick(Sender: TObject);
  public
    { Public declarations }
    constructor Create(AOwner : TComponent ) ; override ;
    destructor Destroy ; override ;
    function Ejecutar: integer;
  published
    { Published declarations }
    property Botones: TStrings read FBotones write SetBotones;
    property BotonPorDefaul: integer read FBotonPorDefaul write SetBotonPorDefaul default 1;
    property ColorDelFondo: TColor read FColorDelFondo write SetColorDelFondo default clBtnFace;
    property Icono: TIcon read FIcono write SetIcono;
    property LetraDelMensaje: TFont read FLetraDelMensaje write SetLetraDelMensaje;
    property Mensaje: TStrings read FMensaje write SetMensaje;
    property Titulo: string read FTitulo write SetTitulo;
    property VerAhora: boolean read FVerAhora write SetVerAhora default False;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire', [TGireMessageBox]);
end;

{ TGireMessageBox }

constructor TGireMessageBox.Create(AOwner: TComponent);
var
  I: integer;
begin
  for I := 0 to AOwner.ComponentCount -1 do
  begin
    if AOwner.Components[I] is TGireMessageBox then
       raise Exception.Create('No se admite mas de un componente de la clase '
                                     + '"TMessageBox" por formulario.');
  end;
  inherited Create(AOwner);
  FBotones := TStringList.Create;
  FLetraDelMensaje := TFont.Create;
  FMensaje := TStringList.Create;
  FIcono := TIcon.Create;
  FVerAhora := False;
  FColorDelFondo := clBtnFace;
  FBotonPorDefaul := 1;
  FRetorno := 0;
end;

destructor TGireMessageBox.Destroy;
begin
  FMensaje.Free;
  FLetraDelMensaje.Free;
  FBotones.Free;
  FIcono.Free;
  inherited Destroy;
end;

function TGireMessageBox.Ejecutar: integer;
var
   Imagen: TImage;
   Texto: TLabel;
   Boton1, Boton2, Boton3: TButton;
   AnchoBotones: integer;
begin
   FRetorno := 0;
   Boton1 := nil;
   Boton2 := nil;
   Boton3 := nil;
   AnchoBotones := 0;
   Formulario := TForm.Create(Application);
   try
     Formulario.BorderIcons := [biSystemMenu];
     Formulario.BorderStyle := bsDialog;
     if FTitulo = '' then
       Formulario.Caption := 'GIRE s.a  -  ' + Application.Title
     else
       Formulario.Caption := FTitulo;
     Formulario.color := FColorDelFondo;
     Formulario.Position := poDesktopCenter;
     Imagen := TImage.Create(Formulario);

     Imagen.Parent := Formulario;
     Imagen.Transparent := True;
     Imagen.Picture.Assign(FIcono);
     Imagen.AutoSize := True;
     Imagen.Top := 15;
     Imagen.Left := 15;

     case FBotones.Count of
     0:
       begin
         Boton1 := TButton.Create(Formulario);
         Boton1.Parent := Formulario;
         Boton1.Name := 'B1';
         Boton1.Caption := '&Aceptar';
         Boton1.OnClick := MiOnClick;
         AnchoBotones := Boton1.Width;
       end;
     1:
       begin
         Boton1 := TButton.Create(Formulario);
         Boton1.Parent := Formulario;
         Boton1.Name := 'B1';
         Boton1.Caption := FBotones.Strings[0];
         Boton1.OnClick := MiOnClick;
         Boton1.Width := Formulario.Canvas.TextWidth(Boton1.Caption) + 20;
         AnchoBotones := Boton1.Width;
       end;
     2:
       begin
         Boton1 := TButton.Create(Formulario);
         Boton1.Parent := Formulario;
         Boton1.Name := 'B1';
         Boton1.Caption := FBotones.Strings[0];
         Boton1.OnClick := MiOnClick;
         Boton2 := TButton.Create(Formulario);
         Boton2.Parent := Formulario;
         Boton2.Name := 'B2';
         Boton2.Caption := FBotones.Strings[1];
         Boton2.OnClick := MiOnClick;
         AnchoBotones := Max(Formulario.Canvas.TextWidth(Boton1.Caption),
                             Formulario.Canvas.TextWidth(Boton2.Caption)) + 20;
         Boton1.Width := AnchoBotones;
         Boton2.Width := AnchoBotones;
         AnchoBotones := (AnchoBotones * 2) + 15;
       end;
     3:
       begin
         Boton1 := TButton.Create(Formulario);
         Boton1.Parent := Formulario;
         Boton1.Name := 'B1';
         Boton1.Caption := FBotones.Strings[0];
         Boton1.OnClick := MiOnClick;
         Boton2 := TButton.Create(Formulario);
         Boton2.Parent := Formulario;
         Boton2.Name := 'B2';
         Boton2.Caption := FBotones.Strings[1];
         Boton2.OnClick := MiOnClick;
         Boton3 := TButton.Create(Formulario);
         Boton3.Parent := Formulario;
         Boton3.Name := 'B3';
         Boton3.Caption := FBotones.Strings[2];
         Boton3.OnClick := MiOnClick;
         AnchoBotones := Max(Formulario.Canvas.TextWidth(Boton1.Caption),
                             Formulario.Canvas.TextWidth(Boton2.Caption));
         AnchoBotones := Max(AnchoBotones,
                             Formulario.Canvas.TextWidth(Boton3.Caption)) + 30;
         Boton1.Width := AnchoBotones;
         Boton2.Width := AnchoBotones;
         Boton3.Width := AnchoBotones;
         AnchoBotones := (AnchoBotones * 3) + 30;
       end;
     end;

     Texto := TLabel.Create(Formulario);
     Texto.Parent := Formulario;
     Texto.Caption := FMensaje.Text;
     Texto.Font.Assign(FLetraDelMensaje);
     Texto.Top := 15;
     Texto.Left := Imagen.Left + Imagen.Width + 10;

     Formulario.ClientHeight := 40 + Max(Texto.Height, Imagen.Height) + Boton1.Height;

     Formulario.ClientWidth := 40 + Imagen.Width + Max(Max(Texto.Width, AnchoBotones),
                                    Trunc(Formulario.Canvas.TextWidth(FTitulo) * 1.15));

     Boton1.Top := (Formulario.ClientHeight -15) - (Boton1.Height);
     Boton1.Left := Trunc((Formulario.ClientWidth - AnchoBotones) / 2);

     if Boton2 <> nil then
     begin
       Boton2.Top := (Formulario.ClientHeight -15) - (Boton2.Height);
       Boton2.Left := Trunc((Formulario.ClientWidth - AnchoBotones) / 2) + 15 + Boton1.Width;
     end;

     if Boton3 <> nil then
     begin
       Boton3.Top := (Formulario.ClientHeight -15) - (Boton3.Height);
       Boton3.Left := Trunc((Formulario.ClientWidth - AnchoBotones) / 2)
                      + 30 + Boton1.Width + Boton2.Width;
     end;

     case FBotonPorDefaul of
       1: Boton1.TabOrder := 0;
       2: Boton2.TabOrder := 0;
       3: Boton3.TabOrder := 0;
     end;

     Formulario.ShowModal
   finally
     Formulario.Free
   end;
   result := FRetorno;
end;

procedure TGireMessageBox.MiOnClick(Sender: TObject);
begin
  FRetorno := StrToInt(TButton(Sender).Name[2]);
  Formulario.Close;
end;

procedure TGireMessageBox.SetBotones(const Value: TStrings);
var
   x: integer;
begin
  if Value.Count > 3 then
  begin
     ShowMessage('Sólo se permite un máximo de 3 botones.');
     FBotones.Clear;
     for x := 0 to 2 do
     begin
       FBotones.Add(Value.Strings[x]);
     end;
  end
  else
  begin
    FBotones.Clear;
    for x := 0 to Value.Count -1 do
       FBotones.Add(Value.Strings[x]);
  end;
  if FBotonPorDefaul > FBotones.Count then
    FBotonPorDefaul := 1;
end;

procedure TGireMessageBox.SetBotonPorDefaul(const Value: integer);
begin
  if (Value <= FBotones.Count) and (Value <> 0) then
    FBotonPorDefaul := Value;
end;

procedure TGireMessageBox.SetColorDelFondo(const Value: TColor);
begin
  FColorDelFondo := Value;
end;

procedure TGireMessageBox.SetIcono(const Value: TIcon);
begin
  FIcono.Assign(Value);
end;

procedure TGireMessageBox.SetLetraDelMensaje(const Value: TFont);
begin
  FLetraDelMensaje.Assign(Value);
end;

procedure TGireMessageBox.SetMensaje(const Value: TStrings);
begin
  FMensaje.Assign(Value);
end;

procedure TGireMessageBox.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TGireMessageBox.SetVerAhora(const Value: boolean);
begin
  if FVerAhora <> Value then
     Ejecutar;
  FVerAhora := False;
end;

end.
