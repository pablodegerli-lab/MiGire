unit UFRMADOPARAMPROC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFRMGIREGRAL, StdCtrls, Menus, StdActns, ActnList, ComCtrls, ToolWin,
  ExtCtrls, DBGrids, Db, DBTables, Grids, DBCtrls, DBActns, ADODB, Espera,
  Ayuda;

type
  TTipoQuery = (tiOpen, tiExec);

  TFrmADOParamProc = class(TFrmGIREGral)
//  TFrmADOParamProc = class(TForm)
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
    Ayuda: TAyuda;
    acAyuda: TAction;
    Ayuda2: TMenuItem;
    procedure EjecutarQueryExecute(Sender: TObject); virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrillaQueryKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SalirExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure acAyudaExecute(Sender: TObject);
    procedure GrillaQueryKeyPress(Sender: TObject; var Key: Char);
  private
    FQuery: TADOQuery;
    FTipoQuery: TTipoQuery;
    FConexionHelp: TADOConnection;
    function GetQuery: TADOQuery;
    procedure SetQuery(const Value: TADOQuery);
    procedure ObtenerTipoQuery;
    procedure SetConexionHelp(const Value: TADOConnection);
  public
    property ConexionHelp: TADOConnection read FConexionHelp write SetConexionHelp;
    property Query: TADOQuery read GetQuery write SetQuery;
    property TipoQuery: TTipoQuery read FTipoQuery write FTipoQuery;

    procedure AsignarPropiedadQuery(ParametroQuery:TADOQuery);

    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses uFrmGIREBase, uImagenes;

{$R *.DFM}

function TFrmADOParamProc.GetQuery: TADOQuery;
begin
  if FQuery = nil then
     Raise Exception.Create('Falta el parametro Query');

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
    Esperar.OcultaVentana := true;	
    case FTipoQuery of
      tiOpen:
      begin
        StatusBar1.Panels[0].Text:='';
        FQuery.Open;
        StatusBar1.Panels[0].Text:='Cantidad de Registros : '+ IntToStr(Query.RecordCount);
        StatusBar1.Repaint;
      end;
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

procedure TFrmADOParamProc.GrillaQueryKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 9 then
     key := 0;
end;

procedure TFrmADOParamProc.SalirExecute(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='';
  Query.Close;
  inherited;
end;

procedure TFrmADOParamProc.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and (key = 116) then
      EjecutarQueryExecute(Sender);
end;

procedure TFrmADOParamProc.SetConexionHelp(const Value: TADOConnection);
begin
  FConexionHelp := Value;
end;

procedure TFrmADOParamProc.acAyudaExecute(Sender: TObject);
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

procedure TFrmADOParamProc.GrillaQueryKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #9 then
  begin
     ToolBarEspecifica.SetFocus;
     key:= #0;
  end;
end;

end.
