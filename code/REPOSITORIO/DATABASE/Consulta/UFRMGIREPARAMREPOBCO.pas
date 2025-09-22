unit uFrmGireParamRepoBco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREPARAMREPO, uFrmGireParamProc, Db, Menus, StdActns, ActnList, Grids, DBGrids,
  ExtCtrls, ComCtrls, ToolWin, StdCtrls, uEditorBase, uParamEditor, DBActns, uErrorClase;

ResourceString
  EdConsultaVacia = 'Debe ingeresar datos';

type

  EParamProcEdConsultaVacia = class(EParamProc);

  TFrmGireParamRepoBco = class(TFrmGIREParamRepo)
    Bevel1: TBevel;
    ParamBanco: TParamEditor;
    EdConsulta: TEdit;
    procedure ParamBancoGetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure ParamBancoSetValue(Editor: TEditorBase;
      AControl: TWinControl; var Value: Variant);
    procedure EdConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure EjecutarQueryExecute(Sender: TObject);override;
  private
    procedure ValidoEdConsulta;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.DFM}

{ TFrmGireParamRepoBco }

procedure TFrmGireParamRepoBco.EjecutarQueryExecute(Sender: TObject);
begin
  try
    ValidoEdConsulta;
    ParamBanco.ParamMapList.AddMap(Query, 'BANCO' ,False);
    ParamBanco.ParamMapList.ApplyFilter(ParamBanco.Value);
    inherited;
  except
    on E: EParamProc do
       MessageBox(Handle,Pchar(E.Message),Pchar('Error'),
       MB_OK+MB_ICONWARNING);
  end;
end;

procedure TFrmGireParamRepoBco.ParamBancoGetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  value:=(AControl as TEdit).Text;
end;

procedure TFrmGireParamRepoBco.ParamBancoSetValue(Editor: TEditorBase;
  AControl: TWinControl; var Value: Variant);
begin
  inherited;
  (AControl as TEdit).Text:=value;
end;

procedure TFrmGireParamRepoBco.ValidoEdConsulta;
begin
  if EdConsulta.Text = '' then
       Raise EParamProcEdConsultaVacia.Create(EdConsultaVacia);
end;

procedure TFrmGireParamRepoBco.EdConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9',#8]) then
     Key := #0;
end;

end.
