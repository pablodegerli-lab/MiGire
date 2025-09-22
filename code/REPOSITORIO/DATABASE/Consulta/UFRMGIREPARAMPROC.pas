unit uFrmGireParamProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREGRAL, StdCtrls, Menus, StdActns, ActnList, ComCtrls, ToolWin,
  ExtCtrls, DBGrids, Db, DBTables, Grids, DBCtrls, DBActns, Espera;

type
  TTipoQuery = (tiOpen, tiExec);

  TFrmGireParamProc = class(TFrmGIREGral)
    PanelPrincipal: TPanel;
    PanelParams: TPanel;
    Splitter1: TSplitter;
    PanelGrilla: TPanel;
    EjecutarQuery: TAction;
    GrillaQuery: TDBGrid;
    dsQuery: TDataSource;
    ToolButton1: TToolButton;
    Ejecutar: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    Esperar: TEsperar;
    procedure EjecutarQueryExecute(Sender: TObject); virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FQuery: TQuery;
    FTipoQuery: TTipoQuery;
    function GetQuery: TQuery;
    procedure SetQuery(const Value: TQuery);
    procedure ObtenerTipoQuery;
  public
    property Query: TQuery read GetQuery write SetQuery;
    property TipoQuery: TTipoQuery read FTipoQuery write FTipoQuery;
    procedure AsignarPropiedadQuery(ParametroQuery:TQuery);
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses uFrmGIREBase, uImagenes,uErrorClase;

{$R *.DFM}

function TFrmGireParamProc.GetQuery: TQuery;
begin
  if FQuery = nil then
     Raise EParamProcNoExisteQry.Create(NoExisteQuery);

  Result := FQuery;
end;

procedure TFrmGireParamProc.SetQuery(const Value: TQuery);
begin
  FQuery := Value;
  dsQuery.DataSet := FQuery;
  ObtenerTipoQuery;
end;

procedure TFrmGireParamProc.EjecutarQueryExecute(Sender: TObject);
begin
  inherited;
  try
    Esperar.Text:= 'Ejecutando Consulta...';
    Esperar.Mostrarse(True);
    case FTipoQuery of
      tiOpen:
        FQuery.Open;
      tiExec:
        FQuery.ExecSQL;
    end;
  finally
    Esperar.Mostrarse(False);
  end;
end;

constructor TFrmGireParamProc.Create(AOwner: TComponent);
begin
  inherited;
  FQuery := nil;
  FTipoQuery := tiOpen;
end;

procedure TFrmGireParamProc.ObtenerTipoQuery;
begin
  if FQuery <> nil then
    if uppercase(Copy(Trim(FQuery.SQL.Text), 1, 6)) = 'SELECT' then
      FTipoQuery := tiOpen
    else
      FTipoQuery := tiExec;

end;

procedure TFrmGireParamProc.AsignarPropiedadQuery(ParametroQuery: TQuery);
begin
  Query:= ParametroQuery;
end;

procedure TFrmGireParamProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query.Close;
  inherited;
end;

end.
