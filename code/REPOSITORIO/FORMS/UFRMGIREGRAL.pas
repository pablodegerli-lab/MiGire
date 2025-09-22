unit uFrmGIREGral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ActnList, StdActns, StdCtrls, Buttons,
  ToolWin, ExtCtrls, uFrmGIREBase;

type
  TFrmGIREGral = class(TFrmGIREBase)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    MnuEdit: TMenuItem;
    MnuCopy: TMenuItem;
    MnuCut: TMenuItem;
    MnuPaste: TMenuItem;
    MnuPrincipal: TMenuItem;
    MnuSalir: TMenuItem;
    N1: TMenuItem;
    EditCopy: TEditCopy;
    EditCut: TEditCut;
    EditPaste: TEditPaste;
    Salir: TAction;
    Panel1: TPanel;
    ToolBarEspecifica: TToolBar;
    ToolBarGeneral: TToolBar;
    BtnSalir: TToolButton;
    procedure SalirExecute(Sender: TObject);
  end;

var
  FrmGIREGral: TFrmGIREGral;

implementation

uses uImagenes;

{$R *.DFM}

procedure TFrmGIREGral.SalirExecute(Sender: TObject);
begin
  Close;
end;

end.
 