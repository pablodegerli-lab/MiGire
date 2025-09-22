unit uFrmGireParamRepoCierres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFrmGireParamRepo, UFrmGireParamProc, Db, Menus, StdActns, ActnList, Grids, DBGrids,
  ExtCtrls, ComCtrls, ToolWin, StdCtrls, uRangeEditorBase, uEditorBase,
  uParamEditor, Mask, uMesAnioEdit, DBActns;

type
  TFrmGireParamRepoCierres = class(TFrmGIREParamRepo)
    ParamBanco: TParamEditor;
    ParamMesAnio: TParamEditor;
    EdBanco: TEdit;
    EdMesAnio: TMesAnioEdit;
    Bevel1: TBevel;
    procedure EjecutarQueryExecute(Sender: TObject);override;
    procedure ParamBancoGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamBancoSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamMesAnioGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamMesAnioSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure EdBancoKeyPress(Sender: TObject; var Key: Char);
  private

  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrmGireParamRepoCierres.EjecutarQueryExecute(Sender: TObject);
begin
  try
    ParamBanco.ParamMapList.AddMap(Query, 'BANCO', False);
    ParamBanco.ParamMapList.ApplyFilter(ParamBanco.Value);
    ParamMesAnio.ParamMapList.AddMap(Query, 'CIERRE', False);
    ParamMesAnio.ParamMapList.ApplyFilter(ParamMesAnio.Value);
    inherited;
  except
    on E: EParamProc do
       MessageBox(Handle,Pchar(E.Message),Pchar('Error'),
       MB_OK+MB_ICONWARNING);
  end;
end;

procedure TFrmGireParamRepoCierres.ParamBancoGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TEdit).Text;
end;

procedure TFrmGireParamRepoCierres.ParamBancoSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TEdit).Text:=value;
end;

procedure TFrmGireParamRepoCierres.ParamMesAnioGetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TMesAnioEdit).Text;
end;

procedure TFrmGireParamRepoCierres.ParamMesAnioSetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TMesAnioEdit).Text:=value;
end;

procedure TFrmGireParamRepoCierres.EdBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9',#8]) then
     Key := #0;
end;

end.
