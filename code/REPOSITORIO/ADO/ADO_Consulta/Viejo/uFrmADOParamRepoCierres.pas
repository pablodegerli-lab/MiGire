unit uFrmADOParamRepoCierres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, StdActns, ActnList, Grids, DBGrids, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, uRangeEditorBase, uEditorBase, Mask, DBActns, uErrorClase,
  uParamEditor,uMesAnioEdit, uFrmADOParamRepo, uFrmADOParamProc;

type
  TFrmADOParamRepoCierres = class(TFrmADOParamRepo)
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

procedure TFrmADOParamRepoCierres.EjecutarQueryExecute(Sender: TObject);
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

procedure TFrmADOParamRepoCierres.ParamBancoGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TEdit).Text;
end;

procedure TFrmADOParamRepoCierres.ParamBancoSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TEdit).Text:=value;
end;

procedure TFrmADOParamRepoCierres.ParamMesAnioGetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TMesAnioEdit).Text;
end;

procedure TFrmADOParamRepoCierres.ParamMesAnioSetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TMesAnioEdit).Text:=value;
end;

procedure TFrmADOParamRepoCierres.EdBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9',#8]) then
     Key := #0;
end;

end.
