unit UDMCopiaATrx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, UGeneral, ADOCtrlP, FileCtrl, Define;

type
  TDMCopiaATrx = class(TDataModule)
    QryArchivos: TADOQuery;
    QryUltimaDistribucion: TADOQuery;
    QryUltimaDistribucionFH_DISTRIBUCION: TDateTimeField;
    QryUltimaDistribucionNRO_CORRIDA: TIntegerField;
    QryArchivosCOD_CIA: TIntegerField;
    QryArchivosNRO_PROCESO: TIntegerField;
    QryArchivosCOD_TIPO_ARCHIVO: TStringField;
    QryArchivosCOD_DISENO: TStringField;
    QryArchivosNRO_ORDEN: TIntegerField;
    QryArchivosFH_DISTRIBUCION: TDateTimeField;
    QryArchivosNRO_CORRIDA: TIntegerField;
    QryArchivosNOMBRE_ARCHIVO: TStringField;
    QryArchivosCANTIDAD_REGISTROS: TIntegerField;
    QryArchivosCANTIDAD_MOVIMIENTOS: TIntegerField;
    QryArchivosIMPORTE: TBCDField;
    QryArchivosUSUARIO: TStringField;
    QryArchivosFH_ACTUALIZACION: TDateTimeField;
    QryArchivosDESCRIPCION: TStringField;
    ADOControlProcesoGema: TADOCtrlProcesos;
    QryDistribucionesProcesos: TADOQuery;
    QryDistribucionesProcesosFH_PROCESO: TDateTimeField;
    QryFh_Proceso_Anterior: TADOQuery;
    QryFh_Proceso_AnteriorFH_PROCESO_ANTERIOR: TDateTimeField;
    QryArchivosPATH_SALIDA: TStringField;
  private
    FRegistroDistribucion: TRegistroDistribucion;
    FRuta_Trx,FRuta_Salida: String;
    procedure Verificar_Existencia(cPath: String);
    procedure Copiar_de_Generacion;
    procedure Copiar_de_Menu;
    procedure Eliminar_de_Origen(cPath: String);
    procedure Autorizar_Proceso101;
    procedure DesAutorizar_Proceso101;
    procedure Finalizar_Proceso101;
    procedure LogProceso(Msj: string);
  public
    Constructor create(AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ARutaSalida,ARutaTRX:String); reintroduce; overload;
    Destructor destroy; override;
    Procedure Copiar_A_Trx(AProcedencia: String);
  end;

implementation

uses UDMGemaConexion;

{$R *.DFM}

procedure TDMCopiaATrx.Autorizar_Proceso101;
begin
  { Autorizo el Proceso 101 }
  ADOControlProcesoGema.Empresa := FRegistroDistribucion.Cod_Cia;
  ADOControlProcesoGema.CodProceso := 101;
  ADOControlProcesoGema.NroProceso := FRegistroDistribucion.Nro_Proceso;
  ADOControlProcesoGema.FH_Proceso_Anterior := 0;
  ADOControlProcesoGema.ProcesosRelacionados :=  FRegistroDistribucion.Procesos_Relacionados;
  QryDistribucionesProcesos.First;
  while not QryDistribucionesProcesos.Eof do
  begin
    ADOControlProcesoGema.FH_Proceso := QryDistribucionesProcesosFH_PROCESO.Value;
    if not ADOControlProcesoGema.Autorizado then
      Abort;
    QryDistribucionesProcesos.Next;
  end;

end;

procedure TDMCopiaATrx.Copiar_A_Trx(AProcedencia: String);
begin

	{ Proviene de la Generacion de Archivos }
	if AProcedencia = 'GA' then
  begin
    Verificar_Existencia(FRegistroDistribucion.Path_Work);
    Copiar_de_Generacion;
    Eliminar_de_Origen(FRegistroDistribucion.Path_Work);
  end
  else
	{ Proviene de la Copia a Transmisión Manual }
  begin
    try
	    Autorizar_Proceso101;
	    Verificar_Existencia(FRuta_Salida);
  	  Copiar_de_Menu;
    	Eliminar_de_Origen(FRuta_Salida);
	    Finalizar_Proceso101;
    except
    on E:Exception do
    	begin
	      DesAutorizar_Proceso101;
  	    Raise Exception.Create('LOS ARCHIVOS NO FUERON COPIADOS A TRANSMISION.'+#13+#10+'Error: '+E.Message);
      end;
    end;
  end;

end;

procedure TDMCopiaATrx.Copiar_de_Generacion;
var PathSalida:string;
begin
  { Copio cada uno de los archivos }
  QryArchivos.First;
 	while (not QryArchivos.Eof) do
  begin
		{ Si el modo es automático copia directamente a transmisión desde WORK
    	sino copia a SALIDA para luego copiar manualmente}

    PathSalida := iif((qryArchivos.fieldByName('PATH_SALIDA').asString <> ''),qryArchivos.fieldByName('PATH_SALIDA').asString, iif((FRegistroDistribucion.Copia_A_Trx = 'A'),FRuta_Trx,FRuta_Salida) ) ;

    CopiarArchivo(FRegistroDistribucion.Path_Work+QryArchivosNOMBRE_ARCHIVO.Value,
                  PathSalida+QryArchivosNOMBRE_ARCHIVO.Value,False);
{
    if FRegistroDistribucion.Copia_A_Trx = 'A' then
      CopiarArchivo(FRegistroDistribucion.Path_Work+QryArchivosNOMBRE_ARCHIVO.Value,
      							FRuta_Trx+QryArchivosNOMBRE_ARCHIVO.Value,
                    False)
 	  else
      CopiarArchivo(FRegistroDistribucion.Path_Work+QryArchivosNOMBRE_ARCHIVO.Value,
      							FRuta_Salida+QryArchivosNOMBRE_ARCHIVO.Value,
                    False);
}
    QryArchivos.Next;
 	end;

end;

procedure TDMCopiaATrx.Copiar_de_Menu;
begin
  { Copio cada uno de los archivos }
  QryArchivos.First;
 	while (not QryArchivos.Eof) do
  begin
    CopiarArchivo(FRuta_Salida+QryArchivosNOMBRE_ARCHIVO.Value,
    							FRuta_Trx+QryArchivosNOMBRE_ARCHIVO.Value,
                  False);
    QryArchivos.Next;
 	end;
end;

constructor TDMCopiaATrx.create(AOwner: TComponent;
  ARegistroDistribucion: TRegistroDistribucion; ARutaSalida,ARutaTRX:String);
begin
  inherited Create(AOwner);

  FRuta_Salida:= Trim(ARutaSalida);
  FRuta_TRX := Trim(ARutaTRX);
  FRegistroDistribucion := ARegistroDistribucion;

  { Obtengo la última distribucion para la empresa - proceso}
  if FRegistroDistribucion.Es_AU then
    QryUltimaDistribucion.sql.Text := StringReplace(QryUltimaDistribucion.SQL.Text,'#NroProcesoGema','and NRO_PROCESO_GEMA = ' + intToStr(FRegistroDistribucion.Nro_Proceso_AU),[rfReplaceAll])
  else
    QryUltimaDistribucion.sql.Text := StringReplace(QryUltimaDistribucion.SQL.Text,'#NroProcesoGema','',[rfReplaceAll]);

  QryUltimaDistribucion.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryUltimaDistribucion.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryUltimaDistribucion.Open;
  if QryUltimaDistribucion.RecordCount = 0 then
    Raise Exception.Create('No existen distribuciones de la Empresa - Proceso solicitados');
  QryUltimaDistribucion.Last;
  //**********
  QryArchivos.Close;
  QryArchivos.Parameters.Clear;
  QryArchivos.SQL.Clear;

  QryArchivos.SQL.Add('Select A.*, ');
  QryArchivos.SQL.Add('B.DESCRIPCION, D.PATH_SALIDA ');
  QryArchivos.SQL.Add('from GEMA.RESUMENES A, ');
  QryArchivos.SQL.Add('GEMA.TIPOS_DE_ARCHIVO B, ');
  QryArchivos.SQL.Add('GEMA.Distribuciones_detalle D ');
  QryArchivos.SQL.Add('where A.COD_CIA = :pCod_Cia and ');
  QryArchivos.SQL.Add('A.NRO_PROCESO = :pNro_Proceso and ');
  QryArchivos.SQL.Add('A.FH_DISTRIBUCION = :pFh_Distribucion and ');
  QryArchivos.SQL.Add('A.NRO_CORRIDA = :pNro_Corrida and ');
  QryArchivos.SQL.Add('A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO ');
  QryArchivos.SQL.Add('and a.cod_cia = d.cod_cia ');
  QryArchivos.SQL.Add('and a.cod_diseno = d.cod_diseno ');
  QryArchivos.SQL.Add('and d.cod_tipo_archivo = a.cod_tipo_archivo ');
  QryArchivos.SQL.Add('and a.nro_proceso = d.nro_proceso ');
  QryArchivos.SQL.Add('and a.nro_orden = d.nro_orden ');

  if FRegistroDistribucion.Es_AU then
    QryArchivos.SQL.Add('and A.NRO_PROCESO_GEMA = ' + intToStr(FRegistroDistribucion.Nro_Proceso_AU));

  QryArchivos.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryArchivos.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryArchivos.Parameters.ParamByName('pFh_Distribucion').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
  QryArchivos.Parameters.ParamByName('pNro_Corrida').Value := QryUltimaDistribucionNRO_CORRIDA.Value;

  //**********
{
  //Obtengo todos los archivos de la ultima distribucion para la empresa - proceso
  QryArchivos.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryArchivos.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryArchivos.Parameters.ParamByName('pFh_Distribucion').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
  QryArchivos.Parameters.ParamByName('pNro_Corrida').Value := QryUltimaDistribucionNRO_CORRIDA.Value;

  if FRegistroDistribucion.Es_AU then
    QryArchivos.sql.Text := StringReplace(QryArchivos.SQL.Text,'#NroProcesoGema','and NRO_PROCESO_GEMA = ' + intToStr(FRegistroDistribucion.Nro_Proceso_AU),[rfReplaceAll])
  else
    QryArchivos.sql.Text := StringReplace(QryArchivos.SQL.Text,'#NroProcesoGema','',[rfReplaceAll]);
}
    {
Select A.*,
           B.DESCRIPCION, D.PATH_SALIDA
from GEMA.RESUMENES A,
        GEMA.TIPOS_DE_ARCHIVO B,
        GEMA.Distribuciones_detalle D
where A.COD_CIA = :pCod_Cia and
            A.NRO_PROCESO = :pNro_Proceso and
             A.FH_DISTRIBUCION = :pFh_Distribucion and
              A.NRO_CORRIDA = :pNro_Corrida and
               A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO
               and a.cod_cia = d.cod_cia 
and a.cod_diseno = d.cod_diseno  
and d.cod_tipo_archivo = a.cod_tipo_archivo
and a.nro_proceso = d.nro_proceso
and a.nro_orden = d.nro_orden
              

    }

  LogProceso('COD_CIA = ' +         intToStr(FRegistroDistribucion.Cod_Cia) + ' - ' +
             'NRO_PROCESO = ' +     intToStr(FRegistroDistribucion.Nro_Proceso) + ' - ' +
             'FH_DISTRIBUCION = ' + QryUltimaDistribucionFH_DISTRIBUCION.AsString + ' - ' +
             'NRO_CORRIDA = ' +     QryUltimaDistribucionNRO_CORRIDA.AsString  + ' - '+
             'SENTENCIA = '  + QryArchivos.SQL.Text);

  QryArchivos.Open;
  if QryArchivos.RecordCount < 1 then
    CorreoGrupoGire(GemaConexion.ADOConec,'GEMA_AUTOMATICO','Error en proceso automatico de GEMA',
    'Error al copiar archivos a transmisión. COD_CIA: ' + intToStr(FRegistroDistribucion.Cod_Cia) +' - '+
                                            'NRO_PROCESO_GEMA: '+intToStr(FRegistroDistribucion.Nro_Proceso_AU)+' - '+
                                            'SENTENCIA = '  + QryArchivos.SQL.Text,'GEMA-AU',['']);



  { Obtengo todas las fechas de proceso de la última Distribucion y Nro de Corrida}
  QryDistribucionesProcesos.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryDistribucionesProcesos.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryDistribucionesProcesos.Parameters.ParamByName('pFh_Distribucion').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
  QryDistribucionesProcesos.Parameters.ParamByName('pNro_Corrida').Value := QryUltimaDistribucionNRO_CORRIDA.Value;
  QryDistribucionesProcesos.Open;
end;

procedure TDMCopiaATrx.DesAutorizar_Proceso101;
begin
  { Vuelvo atrás el Proceso 101 }
  QryDistribucionesProcesos.First;
  while not QryDistribucionesProcesos.Eof do
  begin
    ADOControlProcesoGema.FH_Proceso := QryDistribucionesProcesosFH_PROCESO.Value;
    ADOControlProcesoGema.VueltaAtras;
    QryDistribucionesProcesos.Next;
  end;

end;

destructor TDMCopiaATrx.destroy;
begin
  QryDistribucionesProcesos.Close;
  QryArchivos.Close;
  QryUltimaDistribucion.Close;
  inherited;

end;

procedure TDMCopiaATrx.Eliminar_de_Origen(cPath: String);
begin
  { Elimino cada uno de los archivos copiados }
  QryArchivos.First;
	while (not QryArchivos.Eof) do
  begin
    BorrarArchivo(cPath+QryArchivosNOMBRE_ARCHIVO.Value);
 	  QryArchivos.Next;
  end;

end;

procedure TDMCopiaATrx.Finalizar_Proceso101;
begin
  { Finalizo el Proceso 101 }
  QryDistribucionesProcesos.First;
  while not QryDistribucionesProcesos.Eof do
  begin
    ADOControlProcesoGema.FH_Proceso := QryDistribucionesProcesosFH_PROCESO.Value;
    ADOControlProcesoGema.Finalizado;
    QryDistribucionesProcesos.Next;
  end;

end;

procedure TDMCopiaATrx.LogProceso(Msj: string);
begin
  FRegistroDistribucion.Log_Proceso := FRegistroDistribucion.Log_Proceso +'Proc    >> ' + TimeToStr(Time) + ' - '+ Msj +  #13#10;
end;

procedure TDMCopiaATrx.Verificar_Existencia(cPath: String);
begin
  { Verifico existan todos los archivos a copiar}
  QryArchivos.First;
  While (not QryArchivos.Eof) do
  begin
    if not FileExists(cPath+QryArchivosNOMBRE_ARCHIVO.Value) then
      Raise Exception.Create('No existe el archivo:'+QryArchivosNOMBRE_ARCHIVO.Value+#13#10+
                             ' en el directorio '+cPath);
    QryArchivos.Next;
  end;
end;

end.
