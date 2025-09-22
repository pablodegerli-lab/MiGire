unit uFrmGireParamRepo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREPARAMPROC, Db, Menus, StdActns, ActnList, Grids, DBGrids, ExtCtrls,
  ComCtrls, ToolWin, Quickrpt, QRCtrls, StdCtrls, uEditorBase, uParamEditor,
  DBCtrls, DBActns, Espera;

type

  TFrmGIREParamRepo = class(TFrmGireParamProc)
    TBImprimir: TToolButton;
    TBPreview: TToolButton;
    Imprimir: TAction;
    Preview: TAction;
    Impesion1: TMenuItem;
    Imprimir2: TMenuItem;
    VistaPevia1: TMenuItem;
    procedure ImprimirExecute(Sender: TObject);
    procedure PreviewExecute(Sender: TObject); virtual;
    procedure EjecutarQueryExecute(Sender: TObject);override;
  private
    FReporte: TQuickRep;
    function GetReporte: TQuickRep;
    procedure SetReporte(const Value: TQuickRep);
  public
    procedure AsignarPropiedadRepo(ParametroRepo:TQuickRep);
    property Reporte: TQuickRep read GetReporte write SetReporte;
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
   uErrorClase;
{$R *.DFM}

{ TFrmParamRepo }

constructor TFrmGIREParamRepo.Create(AOwner: TComponent);
begin
  inherited;
  FReporte:=nil;
end;

function TFrmGIREParamRepo.GetReporte: TQuickRep;
begin
  if FReporte = nil then
     Raise EParamProcNoExisteReporte.Create(NoExisteReporte);

  Result := FReporte;
end;

procedure TFrmGIREParamRepo.SetReporte(const Value: TQuickRep);
begin
  FReporte := Value;
  FReporte.DataSet:=query;
end;

procedure TFrmGIREParamRepo.ImprimirExecute(Sender: TObject);
begin
  if (GrillaQuery.DataSource.DataSet <> nil) and
     (GrillaQuery.DataSource.DataSet.Active) and
     not (GrillaQuery.DataSource.DataSet.eof) then
  begin
    try
      Esperar.Text:='Preparando el reporte, espere por favor...';
      Esperar.MuestraAVI := False;
      Esperar.Mostrarse(True);
      FReporte.Prepare;
    finally
      Esperar.Mostrarse(False);
    end;
    FReporte.Print;
  end
    else
      MessageBox(handle,Pchar('No hay datos para imprimir'),Pchar('Atención'),MB_OK+MB_ICONEXCLAMATION)
end;

procedure TFrmGIREParamRepo.PreviewExecute(Sender: TObject);
begin
  inherited;
  if (GrillaQuery.DataSource.DataSet <> nil) and
     (GrillaQuery.DataSource.DataSet.Active) and
     not ((GrillaQuery.DataSource.DataSet.eof) and
          (GrillaQuery.datasource.dataset.bof)) then
  begin
    try
      Esperar.Text:='Preparando la vista preliminar, espere por favor...';
      Esperar.MuestraAVI := False;
      Esperar.Mostrarse(True);
      Reporte.Prepare;
    finally
      Esperar.Mostrarse(False);
    end;
    Reporte.PreviewModal;
  end
    else
      MessageBox(handle,Pchar('No hay datos para imprimir'),Pchar('Atención'),
      MB_OK+MB_ICONEXCLAMATION);
end;

procedure TFrmGIREParamRepo.EjecutarQueryExecute(Sender: TObject);
begin
    GrillaQuery.SetFocus;
    inherited;
end;

procedure TFrmGIREParamRepo.AsignarPropiedadRepo(
  ParametroRepo: TQuickRep);
begin
  Reporte:= ParametroRepo;
end;

end.
