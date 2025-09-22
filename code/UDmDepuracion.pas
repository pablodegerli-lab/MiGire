unit UDmDepuracion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UDMGirePath, Db, ADODB, Ugeneral, Define, ApoDSet, ApoEnv;

type
  TDMDepuracion = class(TDMGirePath)
    QryTblServicios: TADOQuery;
    QryTblServiciosNOMBRE_TABLA_ORA: TStringField;
    SPDepuraEnBackup: TADOStoredProc;
  private
    FRegistroDistribucion: TRegistroDistribucion;
    procedure Obtener_Nombre_Tablas;
    procedure Depurar_Movimientos;
  public
    constructor create( AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

constructor TDMDepuracion.create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion);
begin
  inherited Create(AOwner);
  FRegistroDistribucion := ARegistroDistribucion;
  Obtener_Nombre_Tablas;
  Depurar_Movimientos;
end;

procedure TDMDepuracion.Depurar_Movimientos;
var
  cTabla: String;
begin
  while not QryTblServicios.Eof do
  begin
    cTabla := StrTran(QryTblServiciosNOMBRE_TABLA_ORA.Value, 'eeeee', Padl(IntToStr(FRegistroDistribucion.Cod_Cia),5,'0'));
    SPDepuraEnBackup.Parameters.Refresh;
    SPDepuraEnBackup.Parameters.ParamByName('TABLA_BACKUP').Value := 'BACKUP_'+cTabla;
    SPDepuraEnBackup.ExecProc;
    QryTblServicios.Next;
  end;

end;


destructor TDMDepuracion.destroy;
begin
  QryTblServicios.Close;
  inherited;

end;


procedure TDMDepuracion.Obtener_Nombre_Tablas;
begin
  QryTblServicios.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryTblServicios.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryTblServicios.Open;
end;

end.
