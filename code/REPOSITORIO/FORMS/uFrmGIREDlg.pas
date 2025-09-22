Unit uFrmGIREDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uFrmGIREBase, StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TFrmGIREDlg = class(TFrmGIREBase)
    Panel1: TPanel;
    Panel3: TPanel;
    BtnAceptar: TBitBtn;
    BtnCancelar: TBitBtn;
    Aceptar: TAction;
    Cancelar: TAction;
    procedure AceptarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGIREDlg: TFrmGIREDlg;

implementation

uses uImagenes;

{$R *.DFM}

procedure TFrmGIREDlg.AceptarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmGIREDlg.CancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
