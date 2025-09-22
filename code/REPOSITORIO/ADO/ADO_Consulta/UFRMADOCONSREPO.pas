unit UFRMADOCONSREPO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uFrmADOConsulta, Db, Menus, DBActns, StdActns, ActnList, Grids, DBGrids,
  ComCtrls, ToolWin, ExtCtrls, Quickrpt, Espera, Ayuda;

type
  TFrmADOConsRepo = class(TFrmADOConsulta)
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

{$R *.DFM}

procedure TFrmADOConsRepo.AsignarPropiedadRepo(ParametroRepo: TQuickRep);
begin
  Reporte:= ParametroRepo;
end;

constructor TFrmADOConsRepo.Create(AOwner: TComponent);
begin
  inherited;
  FReporte:=nil;
end;

function TFrmADOConsRepo.GetReporte: TQuickRep;
begin
  if FReporte = nil then
     Raise Exception.Create('Falta el parametro Reporte');

  Result := FReporte;
end;

procedure TFrmADOConsRepo.ImprimirExecute(Sender: TObject);
begin
  inherited;
  if (GrillaQuery.DataSource.DataSet <> nil) and
     (GrillaQuery.DataSource.DataSet.Active) and
     (GrillaQuery.DataSource.DataSet.RecordCount <> 0) then
  begin
    try
      Esperar.Text:= 'Preparando el reporte, espere por favor...';
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

procedure TFrmADOConsRepo.SetReporte(const Value: TQuickRep);
begin
  FReporte := Value;
  FReporte.DataSet:=query;
end;

procedure TFrmADOConsRepo.VistaPreviaExecute(Sender: TObject);
begin
  inherited;
  if (GrillaQuery.DataSource.DataSet <> nil) and
     (GrillaQuery.DataSource.DataSet.Active) and
     (GrillaQuery.DataSource.DataSet.RecordCount <> 0) then
  begin
    try
      Esperar.Text:= 'Preparando la vista preliminar, espere por favor...';
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

end.
