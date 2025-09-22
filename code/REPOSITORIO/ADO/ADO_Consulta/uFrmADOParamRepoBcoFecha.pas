unit uFrmADOParamRepoBcoFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, StdActns, ActnList, Grids, DBGrids, ExtCtrls, ComCtrls,
  ToolWin, StdCtrls, uRangeEditorBase, uEditorBase, DBActns,
  uParamEditor, UFRMADOPARAMREPO;

type
  TFrmADOParamRepoBcoFecha = class(TFrmADOParamRepo)
    ParamBanco: TParamEditor;
    RangoFechas: TRangeEditor;
    ParamFechaDde: TParamEditor;
    ParamFechaHta: TParamEditor;
    edBanco: TEdit;
    PickerFechaDde: TDateTimePicker;
    PickerFechaHta: TDateTimePicker;
    procedure EjecutarQueryExecute(Sender: TObject);override;
    procedure ParamBancoGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamBancoSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamFechaDdeGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamFechaDdeSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamFechaHtaGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamFechaHtaSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TFrmADOParamRepoBcoFecha.EjecutarQueryExecute(Sender: TObject);
begin
  ParamBanco.ParamMapList.AddMap(Query, 'BANCO', False);
  ParamBanco.ParamMapList.ApplyFilter(ParamBanco.Value);
  ParamFechaDde.ParamMapList.AddMap(Query, 'FechaDde', False);
  ParamFechaDde.ParamMapList.ApplyFilter(ParamFechaDde.Value);
  ParamFechaHta.ParamMapList.AddMap(Query, 'FechaHta', False);
  ParamFechaHta.ParamMapList.ApplyFilter(ParamFechaHta.Value);
  inherited;
end;

procedure TFrmADOParamRepoBcoFecha.ParamBancoGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  Value:= (AControl as TEdit).Text;
end;

procedure TFrmADOParamRepoBcoFecha.ParamBancoSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TEdit).Text:=Value;
end;

procedure TFrmADOParamRepoBcoFecha.ParamFechaDdeGetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  Value:= (AControl as TDateTimePicker).Date;
end;

procedure TFrmADOParamRepoBcoFecha.ParamFechaDdeSetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TDateTimePicker).Date:=Value;
end;

procedure TFrmADOParamRepoBcoFecha.ParamFechaHtaGetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
    Value:= (AControl as TDateTimePicker).Date;
end;

procedure TFrmADOParamRepoBcoFecha.ParamFechaHtaSetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TDateTimePicker).Date:=Value;
end;

end.
  