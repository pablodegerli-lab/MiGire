unit uFrmGIREBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ActnList;

type
  TFrmGIREBase = class(TForm)
    ActionList1: TActionList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FDestruirAlCerrar: Boolean;
  protected
    property DestruirAlCerrar: Boolean read FDestruirAlCerrar write FDestruirAlCerrar;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FrmGIREBase: TFrmGIREBase;

implementation

{$R *.DFM}

constructor TFrmGIREBase.Create(AOwner: TComponent);
begin
  inherited;
  FDestruirAlCerrar := True;
  Caption := Application.Title+' - '+Caption;
end;

procedure TFrmGIREBase.FormShow(Sender: TObject);
begin
  FDestruirAlCerrar := not (fsModal in FFormState);
end;

procedure TFrmGIREBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FDestruirAlCerrar then
    Action := caFree;
end;

procedure TFrmGIREBase.FormCreate(Sender: TObject);
begin
  Color := clSilver;
end;

end.
