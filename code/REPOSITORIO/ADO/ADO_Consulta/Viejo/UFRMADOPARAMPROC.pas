unit UFRMADOPARAMPROC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREGRAL, StdCtrls, Menus, StdActns, ActnList, ComCtrls, ToolWin,
  ExtCtrls, DBGrids, Db, DBTables, Grids, DBCtrls, DBActns, ADODB, Espera;

type
  TTipoQuery = (tiOpen, tiExec);

  TFrmADOParamProc = class(TFrmGIREGral)
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
    Ayuda1: TMenuItem;
    Esperar: TEsperar;
    procedure EjecutarQueryExecute(Sender: TObject); virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FQuery: TADOQuery;
    FTipoQuery: TTipoQuery;
    function GetQuery: TADOQuery;
    procedure SetQuery(const Value: TADOQuery);
    procedure ObtenerTipoQuery;
  public
    property Query: TADOQuery read GetQuery write SetQuery;
    property TipoQuery: TTipoQuery read FTipoQuery write FTipoQuery;
    procedure AsignarPropiedadQuery(ParametroQuery:TADOQuery);
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses uFrmGIREBase, uImagenes, uErrorClase;

{$R *.DFM}

function TFrmADOParamProc.GetQuery: TADOQuery;
begin
  if FQuery = nil then
     Raise EParamProcNoExisteQry.Create(NoExisteQuery);

  Result := FQuery;
end;

procedure TFrmADOParamProc.SetQuery(const Value: TADOQuery);
begin
  FQuery := Value;
  dsQuery.DataSet := FQuery;
  ObtenerTipoQuery;
end;

procedure TFrmADOParamProc.EjecutarQueryExecute(Sender: TObject);
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

constructor TFrmADOParamProc.Create(AOwner: TComponent);
begin
  inherited;
  FQuery := nil;
  FTipoQuery := tiOpen;
end;

procedure TFrmADOParamProc.ObtenerTipoQuery;
begin
  if FQuery <> nil then
    if uppercase(Copy(Trim(FQuery.SQL.Text), 1, 6)) = 'SELECT' then
      FTipoQuery := tiOpen
    else
      FTipoQuery := tiExec;

end;

procedure TFrmADOParamProc.AsignarPropiedadQuery(ParametroQuery: TADOQuery);
begin
  Query:= ParametroQuery;
end;

procedure TFrmADOParamProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query.Close;
  inherited;
end;

end.
