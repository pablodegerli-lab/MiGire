unit Dehoras;

{$DEBUGINFO OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TMuestraHora = class(TCustomPanel)
  private
    MiReloj : TTimer;
    FTexto: string;
    FShowSegundos: boolean;
    procedure SetTexto(const Value: string);
    procedure SetShowSegundos(const Value: boolean);
    { Private declarations }
  protected
    procedure MiEvento(Sender: TObject);
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent ) ; override ;
    destructor Destroy; override;
    { Public declarations }
  published
    property BevelOuter;
    property BevelInner;
    property BorderStyle;
    property BevelWidth;
    property BorderWidth;
    property Color;
    property Enabled;
    property Font;
    property ShowHint;
    property ShowSegundos : boolean read FShowSegundos write SetShowSegundos;
    property Texto : string read FTexto write SetTexto;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Gire', [TMuestraHora]);
end;

{ TMuestraHora }

constructor TMuestraHora.Create(AOwner: TComponent);
begin
     inherited Create( AOwner );
     Width := 121;
     Height := 21;
     Caption := FTexto + TimeToStr( Time );
     FShowSegundos := True;
     MiReloj := TTimer.Create( Self );
     MiReloj.Interval := 450;
     MiReloj.Enabled := True;
     MiReloj.OnTimer := MiEvento;
end;

destructor TMuestraHora.Destroy;
begin
  MiReloj.Free;
  inherited Destroy;
end;

procedure TMuestraHora.MiEvento(Sender: TObject);
begin
     If not FShowSegundos then
        Caption := FTexto + Copy(TimeToStr( Time ), 1, 5)
     else
         Caption := FTexto + TimeToStr( Time );
end;

procedure TMuestraHora.SetShowSegundos(const Value: boolean);
begin
  if Value then
     Caption := FTexto + TimeToStr( Time )
  else
      Caption := FTexto + Copy(TimeToStr( Time ), 1, 5);
  FShowSegundos := Value;
end;

procedure TMuestraHora.SetTexto(const Value: string);
begin
  FTexto := Value;
  if FShowSegundos then
     Caption := FTexto + TimeToStr( Time )
  else
      Caption := FTexto + Copy(TimeToStr( Time ), 1, 5);
end;

end.
