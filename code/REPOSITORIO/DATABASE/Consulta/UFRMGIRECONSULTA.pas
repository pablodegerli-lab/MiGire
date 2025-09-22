unit uFrmGireConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREGRAL, Db, DBActns, Menus, StdActns, ActnList, ComCtrls, ToolWin,
  ExtCtrls, Grids, DBGrids, DBTables;

type
  TTipoQuery = (tiOpen, tiExec);

  TFrmGireConsulta = class(TFrmGIREGral)
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    dsGrilla: TDataSource;
    GrillaQuery: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FQuery: TQuery;
    FTipoQuery: TTipoQuery;
    function GetQuery: TQuery;
    procedure SetQuery(const Value: TQuery);
    procedure ObtenerTipoQuery;
  protected
      {}
  public
    property Query: TQuery read GetQuery write SetQuery;
    property TipoQuery: TTipoQuery read FTipoQuery write FTipoQuery;
    procedure AsignarPropiedadQuery(ParametroQuery:TQuery);
    procedure AbrirQuery;Virtual;
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses uErrorClase;

{$R *.DFM}

{ TFrmGireConsulta }

procedure TFrmGireConsulta.AbrirQuery;
begin
  case FTipoQuery of
    tiOpen:
      FQuery.Open;
    tiExec:
      FQuery.ExecSQL;
  end;
end;

procedure TFrmGireConsulta.AsignarPropiedadQuery(ParametroQuery: TQuery);
begin
  Query:= ParametroQuery;
  AbrirQuery;
end;

constructor TFrmGireConsulta.Create(AOwner: TComponent);
begin
  inherited;
  FQuery := nil;
  FTipoQuery := tiOpen;
end;

procedure TFrmGireConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query.Close;
  inherited;
end;

function TFrmGireConsulta.GetQuery: TQuery;
begin
  if FQuery = nil then
     Raise EParamProcNoExisteQry.Create(NoExisteQuery);

  Result := FQuery;
end;

procedure TFrmGireConsulta.ObtenerTipoQuery;
begin
  if FQuery <> nil then
    if uppercase(Copy(Trim(FQuery.SQL.Text), 1, 6)) = 'SELECT' then
      FTipoQuery := tiOpen
    else
      FTipoQuery := tiExec;
end;

procedure TFrmGireConsulta.SetQuery(const Value: TQuery);
begin
  FQuery := Value;
  dsGrilla.DataSet := FQuery;
  ObtenerTipoQuery;
end;

end.
