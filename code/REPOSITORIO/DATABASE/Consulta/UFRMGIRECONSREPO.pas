unit uFrmGireConsRepo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uFrmGireConsulta, Db, Menus, DBActns, StdActns, ActnList, Grids, DBGrids,
  ComCtrls, ToolWin, ExtCtrls, Quickrpt;

type
  TFrmGireConRepo = class(TFrmGireConsulta)
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Impresion1: TMenuItem;
    Imprimir1: TMenuItem;
    VistaPrevia1: TMenuItem;
    Imprimir: TAction;
    VistaPrevia: TAction;
    procedure ImprimirExecute(Sender: TObject);
    procedure VistaPreviaExecute(Sender: TObject);
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

uses uErrorClase;

{$R *.DFM}

procedure TFrmGireConRepo.AsignarPropiedadRepo(ParametroRepo: TQuickRep);
begin
  Reporte:= ParametroRepo;
end;

constructor TFrmGireConRepo.Create(AOwner: TComponent);
begin
  inherited;
  FReporte:=nil;
end;

function TFrmGireConRepo.GetReporte: TQuickRep;
begin
  if FReporte = nil then
     Raise EParamProcNoExisteReporte.Create(NoExisteReporte);

  Result := FReporte;
end;

procedure TFrmGireConRepo.ImprimirExecute(Sender: TObject);
begin
  inherited;
  if (GrillaQuery.DataSource.DataSet <> nil) and
     (GrillaQuery.DataSource.DataSet.Active) and
     (GrillaQuery.DataSource.DataSet.RecordCount <> 0) then
  begin
    FReporte.Prepare;
    FReporte.Print;
  end
    else
      MessageBox(handle,Pchar('No hay datos para imprimir'),Pchar('Atención'),MB_OK+MB_ICONEXCLAMATION)
end;

procedure TFrmGireConRepo.SetReporte(const Value: TQuickRep);
begin
  FReporte := Value;
  FReporte.DataSet:=query;
end;

procedure TFrmGireConRepo.VistaPreviaExecute(Sender: TObject);
begin
  inherited;
  if (GrillaQuery.DataSource.DataSet <> nil) and
     (GrillaQuery.DataSource.DataSet.Active) and
     (GrillaQuery.DataSource.DataSet.RecordCount <> 0) then
  begin
      Reporte.Prepare;
      Reporte.PreviewModal;
  end
    else
      MessageBox(handle,Pchar('No hay datos para imprimir'),Pchar('Atención'),
      MB_OK+MB_ICONEXCLAMATION);
end;

end.
