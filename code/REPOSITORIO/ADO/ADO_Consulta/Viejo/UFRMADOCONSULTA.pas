unit UFRMADOCONSULTA;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREGRAL, Db, DBActns, Menus, StdActns, ActnList, ComCtrls, ToolWin,
  ExtCtrls, Grids, DBGrids, DBTables, ADODB;

type
  TTipoQuery = (tiOpen, tiExec);

  TFrmADOConsulta = class(TFrmGIREGral)
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
    FQuery: TADOQuery;
    FTipoQuery: TTipoQuery;
    function GetQuery: TADOQuery;
    procedure SetQuery(const Value: TADOQuery);
    procedure ObtenerTipoQuery;
  protected
      {}
  public
    property Query: TADOQuery read GetQuery write SetQuery;
    property TipoQuery: TTipoQuery read FTipoQuery write FTipoQuery;
    procedure AsignarPropiedadQuery(ParametroQuery:TADOQuery);
    procedure AbrirQuery;Virtual;
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses uErrorClase;

{$R *.DFM}

{ TFrmGireConsulta }

procedure TFrmADOConsulta.AbrirQuery;
begin
  case FTipoQuery of
    tiOpen:
      FQuery.Open;
    tiExec:
      FQuery.ExecSQL;
  end;
end;

procedure TFrmADOConsulta.AsignarPropiedadQuery(ParametroQuery: TADOQuery);
begin
  Query:= ParametroQuery;
  AbrirQuery;
end;

constructor TFrmADOConsulta.Create(AOwner: TComponent);
begin
  inherited;
  FQuery := nil;
  FTipoQuery := tiOpen;
end;

procedure TFrmADOConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query.Close;
  inherited;
end;

function TFrmADOConsulta.GetQuery: TADOQuery;
begin
  if FQuery = nil then
     Raise EParamProcNoExisteQry.Create(NoExisteQuery);

  Result := FQuery;
end;

procedure TFrmADOConsulta.ObtenerTipoQuery;
begin
  if FQuery <> nil then
    if uppercase(Copy(Trim(FQuery.SQL.Text), 1, 6)) = 'SELECT' then
      FTipoQuery := tiOpen
    else
      FTipoQuery := tiExec;
end;

procedure TFrmADOConsulta.SetQuery(const Value: TADOQuery);
begin
  FQuery := Value;
  dsGrilla.DataSet := FQuery;
  ObtenerTipoQuery;
end;

end.
