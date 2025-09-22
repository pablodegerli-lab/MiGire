unit UFRMADOCONSULTA;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREGRAL, Db, DBActns, Menus, StdActns, ActnList, ComCtrls, ToolWin,
  ExtCtrls, Grids, DBGrids, DBTables, ADODB, Espera, Ayuda;

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
    Esperar: TEsperar;
    MnuAyuda: TMenuItem;
    acAyuda: TAction;
    Ayuda: TAyuda;
    Ayuda1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalirExecute(Sender: TObject);
    procedure GrillaQueryKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acAyudaExecute(Sender: TObject);
  private
    FQuery: TADOQuery;
    FTipoQuery: TTipoQuery;
    FConexionHelp: TADOConnection;
    function GetQuery: TADOQuery;
    procedure SetQuery(const Value: TADOQuery);
    procedure ObtenerTipoQuery;
    procedure SetConexionHelp(const Value: TADOConnection);
  protected
      {}
  public
    property ConexionHelp: TADOConnection read FConexionHelp write SetConexionHelp;
    property Query: TADOQuery read GetQuery write SetQuery;
    property TipoQuery: TTipoQuery read FTipoQuery write FTipoQuery;

    procedure AsignarPropiedadQuery(ParametroQuery:TADOQuery);
    procedure AbrirQuery;Virtual;

    constructor Create(AOwner: TComponent); override;
  end;


implementation

{$R *.DFM}

{ TFrmGireConsulta }

procedure TFrmADOConsulta.AbrirQuery;
begin
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
     Raise Exception.Create('Falta el parametro Query');

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

procedure TFrmADOConsulta.SalirExecute(Sender: TObject);
begin
  inherited;
  StatusBar1.Panels[0].Text:='';
  Query.Close;
end;

procedure TFrmADOConsulta.GrillaQueryKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 9 then
     key := 0;
end;

procedure TFrmADOConsulta.SetConexionHelp(const Value: TADOConnection);
begin
  FConexionHelp := Value;
end;

procedure TFrmADOConsulta.acAyudaExecute(Sender: TObject);
begin
  if (FConexionHelp <> Nil) then
  begin
    Ayuda.Conexion:= FConexionHelp;
    Ayuda.Ejecutar;
  end
  else if (Ayuda.Conexion <> Nil) then
    Ayuda.Ejecutar
  else
    MessageBox(Handle, PChar('Falta asignar la conección al componente de ayuda'), PChar('Información'), 64 );
end;

end.
