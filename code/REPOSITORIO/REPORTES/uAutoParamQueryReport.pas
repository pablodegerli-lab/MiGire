unit uAutoParamQueryReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, uGIRERepoBase, DB, DBTables, Grids, DBGrids;

type
  TFrmAutoParamQueryRepo = class(TForm)
    BtnPanel: TPanel;
    PanelPrinc: TPanel;
    ParamPanel: TPanel;
    GridPanel: TPanel;
    GrillaResultado: TDBGrid;
    Panel1: TPanel;
    BtnEmitir: TButton;
    BtnConsultar: TButton;
    SelDestino: TComboBox;
    Label2: TLabel;
    dsResultado: TDataSource;
    GridSplitter: TSplitter;
    ParamGrid: TStringGrid;
    procedure BtnEmitirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure ParamGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
  private
    { Private declarations }
    FReporteClass: TGIRERepoClass;
    FQuery: TQuery;
    procedure EmitirReporte;
    procedure EmitirReporteDestino(AReporte: TGIRERepoBase);
    procedure InitGridParams;
    procedure SetGridParams;
  public
    constructor Create(AOwner: TComponent; AQuery: TQuery; AReporteClass: TGIRERepoClass = nil); reintroduce; overload;
  end;


implementation

{$R *.DFM}

{ TfrmParamQueryTest }

constructor TFrmAutoParamQueryRepo.Create(AOwner: TComponent;
  AQuery: TQuery; AReporteClass: TGIRERepoClass);
begin
  inherited Create(AOwner);
  FQuery := AQuery;
  FReporteClass := AReporteClass;

  dsResultado.DataSet := AQuery;

  InitGridParams;
  SetGridParams;
end;



procedure TFrmAutoParamQueryRepo.BtnEmitirClick(Sender: TObject);
begin
  if FReporteClass <> nil then
  begin
    if FQuery <> nil then
      FQuery.Open;

    EmitirReporte;
  end;
end;

procedure TFrmAutoParamQueryRepo.EmitirReporteDestino(AReporte: TGIRERepoBase);
begin
  case SelDestino.ItemIndex of
    0: AReporte.PreviewModal;
    1: AReporte.Print;
  end;
end;

procedure TFrmAutoParamQueryRepo.FormCreate(Sender: TObject);
begin
  SelDestino.ItemIndex := 0;
end;

procedure TFrmAutoParamQueryRepo.EmitirReporte;
var
  Reporte: TGIRERepoBase;

begin
  Reporte := FReporteClass.Create(Self);
  try
    Reporte.SetDataSet(FQuery);

    EmitirReporteDestino(Reporte);
  finally
    Reporte.Free;
  end;

end;

procedure TFrmAutoParamQueryRepo.BtnConsultarClick(Sender: TObject);
begin
  if FQuery <> nil then
  begin
    FQuery.Close;
    FQuery.Open;
  end;
end;

procedure TFrmAutoParamQueryRepo.InitGridParams;
begin
  ParamGrid.Rows[0][0] := 'Parámetro';
  ParamGrid.Rows[0][1] := 'Valor';
end;

procedure TFrmAutoParamQueryRepo.SetGridParams;
var
  i: Integer;
begin
  ParamGrid.RowCount := FQuery.ParamCount +1;

  for i := 0 to FQuery.ParamCount -1 do
  begin
     ParamGrid.Rows[i+1][0] := FQuery.Params[i].DisplayName;
     ParamGrid.Rows[i+1][1] := FQuery.Params[i].AsString;
  end;
  
end;

procedure TFrmAutoParamQueryRepo.ParamGridSetEditText(Sender: TObject;
  ACol, ARow: Integer; const Value: String);
begin
  FQuery.Params[ARow -1].AsString := Value;
end;

end.
