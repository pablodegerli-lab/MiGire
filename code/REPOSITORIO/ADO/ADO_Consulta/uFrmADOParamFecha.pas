unit uFrmADOParamFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, StdActns, ActnList, Grids, DBGrids, ExtCtrls,ComCtrls,
  ToolWin, DBFecha, uEditorBase, uParamEditor, StdCtrls, uRangeEditorBase,
  uProcArchivos,uImagenes, DBActns, uFrmADOParamProc;

type
  TFrmADOParamFecha = class(TFrmADOParamProc)
    REConsulta: TRangeEditor;
    ParamEdFechaDde: TParamEditor;
    ParamEdFechaHst: TParamEditor;
    PickerFechaDde: TDateTimePicker;
    PickerFechaHta: TDateTimePicker;
    procedure EjecutarQueryExecute(Sender: TObject);override;
    procedure ParamEdFechaDdeSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamEdFechaDdeGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamEdFechaHstSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamEdFechaHstGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

procedure TFrmADOParamFecha.EjecutarQueryExecute(Sender: TObject);

begin
    ParamEdFechaDde.ParamMapList.AddMap(Query,'FECHADDE',False);
    ParamEdFechaHst.ParamMapList.AddMap(Query,'FECHAHTA',False);
    ParamEdFechaDde.ParamMapList.ApplyFilter(ParamEdFechaDde.value);
    ParamEdFechaHst.ParamMapList.ApplyFilter(ParamEdFechaHst.value);
    GrillaQuery.SetFocus;
  inherited;
end;

procedure TFrmADOParamFecha.ParamEdFechaDdeSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TDateTimePicker).date:=value;
end;

procedure TFrmADOParamFecha.ParamEdFechaDdeGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TDateTimePicker).date;
end;

procedure TFrmADOParamFecha.ParamEdFechaHstSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TDateTimePicker).date;
end;

procedure TFrmADOParamFecha.ParamEdFechaHstGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TDateTimePicker).date;
end;

end.
