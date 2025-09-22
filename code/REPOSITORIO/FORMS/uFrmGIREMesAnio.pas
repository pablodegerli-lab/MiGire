unit uFrmGIREMesAnio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREDLG, StdCtrls, Mask, uMesAnioEdit, uEditorBase, ActnList,
  Buttons, ExtCtrls, uParamEditor, define;

type
  TFrmGIREMesAnio = class(TFrmGIREDlg)
    MesAnioEdit: TMesAnioEdit;
    lblMesAnio: TLabel;
    procedure EditorMesAnioGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure EditorMesAnioSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure AceptarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Mes: integer;
    function Anio: integer;
  end;

var
  FrmGIREMesAnio: TFrmGIREMesAnio;

implementation

{$R *.DFM}

{ TFrmGIREMesAnio }

function TFrmGIREMesAnio.Anio: integer;
begin
   Anio := MesAnioEdit.Anio ;
end;

function TFrmGIREMesAnio.Mes: integer;
begin
   Mes := MesAnioEdit.Mes;
end;


procedure TFrmGIREMesAnio.EditorMesAnioGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  Value := (AControl as TMesAnioEdit).Text
end;

procedure TFrmGIREMesAnio.EditorMesAnioSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TMesAnioEdit).Text := Value
end;

procedure TFrmGIREMesAnio.AceptarExecute(Sender: TObject);
begin
  MesAnioEdit.ValidateEdit;
  inherited;

end;

end.
