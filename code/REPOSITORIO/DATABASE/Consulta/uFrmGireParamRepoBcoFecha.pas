unit uFrmGireParamRepoBcoFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREPARAMREPO, Db, Menus, StdActns, ActnList, Grids, DBGrids,
  ExtCtrls, ComCtrls, ToolWin, StdCtrls, uRangeEditorBase, uEditorBase,
  uParamEditor, DBActns;

type
  TFrmGireParamRepoBcoFecha = class(TFrmGIREParamRepo)
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

procedure TFrmGireParamRepoBcoFecha.EjecutarQueryExecute(Sender: TObject);
begin
  ParamBanco.ParamMapList.AddMap(Query, 'BANCO', False);
  ParamBanco.ParamMapList.ApplyFilter(ParamBanco.Value);
  ParamFechaDde.ParamMapList.AddMap(Query, 'FechaDde', False);
  ParamFechaDde.ParamMapList.ApplyFilter(ParamFechaDde.Value);
  ParamFechaHta.ParamMapList.AddMap(Query, 'FechaHta', False);
  ParamFechaHta.ParamMapList.ApplyFilter(ParamFechaHta.Value);
  inherited;
end;

procedure TFrmGireParamRepoBcoFecha.ParamBancoGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  Value:= (AControl as TEdit).Text;
end;

procedure TFrmGireParamRepoBcoFecha.ParamBancoSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TEdit).Text:=Value;
end;

procedure TFrmGireParamRepoBcoFecha.ParamFechaDdeGetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  Value:= (AControl as TDateTimePicker).Date;
end;

procedure TFrmGireParamRepoBcoFecha.ParamFechaDdeSetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TDateTimePicker).Date:=Value;
end;

procedure TFrmGireParamRepoBcoFecha.ParamFechaHtaGetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
    Value:= (AControl as TDateTimePicker).Date;
end;

procedure TFrmGireParamRepoBcoFecha.ParamFechaHtaSetValue(
  Editor: TEditorBase; AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TDateTimePicker).Date:=Value;
end;

end.
  