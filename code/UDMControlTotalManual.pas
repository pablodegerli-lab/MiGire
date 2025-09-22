unit UDMControlTotalManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, UGeneral, ADOCtrlT, RxMemDS, Define, Variants;

type
  TDMControlTotalManual = class(TDataModule)
    QryServicios: TADOQuery;
    QryServiciosCOD_CIA: TIntegerField;
    QryServiciosNRO_PROCESO: TIntegerField;
    QryServiciosCOD_SERVICIO: TIntegerField;
    QryServiciosDESCRIPCION: TStringField;
    ADOCtrlTotalesGema: TADOCtrlTotales;
    MDTotalesControl: TRxMemoryData;
    MDTotalesControlCOD_SERVICIO: TIntegerField;
    MDTotalesControlDESCRIPCION: TStringField;
    MDTotalesControlCANTIDAD: TIntegerField;
    MDTotalesControlIMPORTE: TFloatField;
    QryTotales: TADOQuery;
    QryServiciosCOD_TIPO_ARCHIVO: TStringField;
    TblMovimientos: TADOTable;
    QryServiciosNOMBRE_TABLA_ORA: TStringField;
    QryServiciosCONDICION: TStringField;
    MDTotalesControlFH_PROCESO: TStringField;
    MDTotalesControlCANTIDAD_CTRL: TIntegerField;
    MDTotalesControlIMPORTE_CTRL: TFloatField;
    MDTotalesControlCOD_PROCESO: TIntegerField;
    QryServiciosCOD_PROCESO: TIntegerField;
    QryServiciosCANTIDAD: TBCDField;
    QryServiciosIMPORTE: TBCDField;
    procedure MDTotalesControlBeforeDelete(DataSet: TDataSet);
  private
  	FUserTotal: String;
    FRegistroDistribucion: TRegistroDistribucion;
    procedure Actualizar_Grilla;
    procedure Inicializar_Totales_X_Servicios;
    procedure SetUserTotal(const Value: String);
    procedure LimpioConexion(qry:TAdoQuery);
  public
    property UserTotal: String read FUserTotal write SetUserTotal;
    constructor create (AOwner: TComponent; ARegistro: TRegistroDistribucion; ATablasMovimientos: Array of String); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion, StrUtils, Math;

{$R *.DFM}

{ TDMControlTotalManual }

procedure TDMControlTotalManual.Actualizar_Grilla;
begin
  QryTotales.First;
  while not QryTotales.Eof do
  begin
    MDTotalesControl.Insert;
    MDTotalesControlCOD_SERVICIO.Value := QryServiciosCOD_SERVICIO.AsInteger;
    MDTotalesControlDESCRIPCION.Value  := QryServiciosDESCRIPCION.Value;
    MDTotalesControlCOD_PROCESO.Value  := QryServiciosCOD_PROCESO.AsInteger;

    if QryTotales.FieldByName('FH_PROCESO').Value = null then
      MDTotalesControlFH_PROCESO.Value := ''
    else
      MDTotalesControlFH_PROCESO.Value := DateToStr(QryTotales.FieldByName('FH_PROCESO').Value);

    if QryTotales.FieldByName('CANTIDAD').Value = null then
    begin
      MDTotalesControlCANTIDAD.Value := 0;
      MDTotalesControlCANTIDAD_CTRL.Value := 0;
    end
    else
    begin
      MDTotalesControlCANTIDAD.Value := 0;
      MDTotalesControlCANTIDAD_CTRL.Value := QryTotales.FieldByName('CANTIDAD').Value;
    end;

    if QryTotales.FieldByName('IMPORTE').Value = null then
    begin
      MDTotalesControlIMPORTE.Value := 0;
      MDTotalesControlIMPORTE_CTRL.Value := 0;
    end
    else
    begin
      MDTotalesControlIMPORTE.Value := 0;
      MDTotalesControlIMPORTE_CTRL.Value := QryTotales.FieldByName('IMPORTE').Value;
    end;
    MDTotalesControl.Post;
    QryTotales.Next;
  end;

end;

constructor TDMControlTotalManual.create(AOwner: TComponent;
  ARegistro: TRegistroDistribucion; ATablasMovimientos: Array of String);
begin
  inherited Create(AOwner);

  FRegistroDistribucion := ARegistro;
  Inicializar_Totales_X_Servicios;
  FUserTotal := GemaConexion.NombreUsuario;

end;

destructor TDMControlTotalManual.destroy;
begin
  MDTotalesControl.Close;
  QryServicios.Close;
  inherited;
end;

procedure TDMControlTotalManual.Inicializar_Totales_X_Servicios;
var
  Condicion: String;
begin
  MDTotalesControl.Open;

  { Servicios de cada empresa-proceso con su descripcion, nombre de tabla Oracle
    y condición }
  QryServicios.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryServicios.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryServicios.Open;
  if QryServicios.RecordCount = 0 then
    Raise Exception.Create('NO EXISTEN SERVICIOS PARA LA DISTRIBUCION SELECCIONADA');

  while not QryServicios.Eof do
  begin
    TblMovimientos.TableName := QryServiciosNOMBRE_TABLA_ORA.Value;
    TblMovimientos.TableName := 'GEMA.'+StrTran(TblMovimientos.TableName, 'eeeee', StrZero(FRegistroDistribucion.Cod_Cia, 5, 0));
    TblMovimientos.Open;
    if TblMovimientos.FindField('IMPORTE_COBRADO') <> nil then
    begin
      LimpioConexion(QryTotales);
      QryTotales.SQL.Add('Select FH_PROCESO, Nvl(Count(*),0) as CANTIDAD, Nvl(Sum(IMPORTE_COBRADO),0) as IMPORTE');
      QryTotales.SQL.Add('From '+TblMovimientos.TableName);
	    QryTotales.SQL.Add('Where FH_PROCESO <= To_Date('''+DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual)+''',''dd/mm/yyyy'')');
	    QryTotales.SQL.Add('      and NRO_PROCESO_GEMA = '+IntToStr(IfThen(FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU, FRegistroDistribucion.Nro_Proceso)));
      if Trim(QryServiciosCONDICION.Value) <> '' then
      begin
        Condicion := Trim(QryServiciosCONDICION.AsString);
        QryTotales.SQL.Add(' and '+Condicion);
      end;
      QryTotales.SQL.Add('Group by FH_PROCESO');
      QryTotales.Open;
      Actualizar_Grilla;
      QryTotales.Close;
      QryTotales.SQL.Text := '';
      TblMovimientos.Close;
    end
    else
    begin
      LimpioConexion(QryTotales);
      QryTotales.SQL.Add('Select FH_PROCESO, Nvl(Count(*),0) as CANTIDAD, 0 as IMPORTE');
      QryTotales.SQL.Add('From '+TblMovimientos.TableName);
      QryTotales.SQL.Add('Where FH_PROCESO <= To_Date('''+DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual)+''',''dd/mm/yyyy'')');
	    QryTotales.SQL.Add('      and NRO_PROCESO_GEMA = '+IntToStr(IfThen(FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU, FRegistroDistribucion.Nro_Proceso)));
      if Trim(QryServiciosCONDICION.Value) <> '' then
      begin
        Condicion := Trim(QryServiciosCONDICION.AsString);
        QryTotales.SQL.Add(' and '+Condicion);
      end;
      QryTotales.SQL.Add('Group by FH_PROCESO');
      QryTotales.Open;
      Actualizar_Grilla;
      QryTotales.Close;
      QryTotales.SQL.Text := '';
      TblMovimientos.Close;
    end;
    QryServicios.Next;
  end;
  MDTotalesControl.SortOnFields('FH_PROCESO;COD_PROCESO',True,True);

end;

procedure TDMControlTotalManual.LimpioConexion(qry: TAdoQuery);
begin
  try
    qry.close;
    qry.sql.clear;
    qry.Connection := nil;
    qry.Connection := GemaConexion.ADOConec;
  except
    on e:exception do
      raise exception.create('TDMControlTotalManual.LimpioConexion: No se pudo reasignar la conexión');
  end;
end;

procedure TDMControlTotalManual.MDTotalesControlBeforeDelete(
  DataSet: TDataSet);
begin
  Abort;

end;

procedure TDMControlTotalManual.SetUserTotal(const Value: String);
begin
  FUserTotal := Value;
end;

end.
