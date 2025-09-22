unit UDMVueltaAtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UDMConversionInicial, ApoEnv, ADODB, Db, ApoDSet, Define, Ugeneral,
  ADOCtrlP, Espera, UFrmProgresoConversion, CliCusEx, CliMacEx;

type
  TDMVueltaAtras = class(TDMConversionInicial)
    QryUltimaDistribucion: TADOQuery;
    QryUltimaDistribucionFH_DISTRIBUCION: TDateTimeField;
    QryUltimaDistribucionNRO_CORRIDA: TIntegerField;
    QryDelTotales_Control: TADOQuery;
    QryDelEstados: TADOQuery;
    QryAct_Fh_Proceso: TADOQuery;
    QryDistribucionesProcesos: TADOQuery;
    QryDistribucionesProcesosFH_PROCESO: TDateTimeField;
    QryDelResumenes: TADOQuery;
    SPInsertVueltaAtras: TADOStoredProc;
    QryUltimaDistProceso: TADOQuery;
    QryUltimaDistProcesoFH_DISTRIBUCION: TDateTimeField;
    QryUltimaDistProcesoNRO_CORRIDA: TIntegerField;
    SPVuelveAtrasSecuencia: TADOStoredProc;
    QryVueltaAtrasSecuencia: TADOQuery;
    qryDistrubucionesAutomatico: TADOQuery;
    DateTimeField1: TDateTimeField;
  private
    FUltima_Fh_Proceso: TDate;
    FFrmProgresoConversion: TFrmProgresoConversion;
    procedure Back_Registros_Ora;
    procedure Back_Registros_DBF;
    procedure Eliminar_Estados_y_Totales;
    procedure Actualizar_Fh_Proceso;
    procedure Actualizar_Automatico;
    procedure Eliminar_Proceso101;
    procedure Eliminar_Resumen;
    procedure Volver_Atras_Secuencia;
  public
    procedure Volver_Atras;
    procedure Back_GireCtrl;
    procedure RollBack_DBFs;
    constructor create( AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ARuta_Distribucion,ACaption: String); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion, ManError, StrUtils, Math;

{$R *.DFM}

{ TDMConversionVueltaAtras }

procedure TDMVueltaAtras.Back_Registros_Ora;
var
  cTablaOrigen, cTablaBackup: String;
begin
  { Paso del backup a la tabla de origen los registros que no provienen
    de la conversion inicial }
  try
	  cTablaOrigen := QryTblDBFaTblOraNOMBRE_TABLA_ORA.Value;
  	cTablaOrigen := StrTran(cTablaOrigen, 'eeeee', Padl(IntToStr(FRegistroDistribucion.Cod_Cia),5,'0'));;
	  cTablaBackup := 'BACKUP_'+cTablaOrigen;
  	SPInsertVueltaAtras.Parameters.Refresh;
	  SPInsertVueltaAtras.Parameters.ParamByName('TABLA_ORIGEN').Value := cTablaOrigen;
  	SPInsertVueltaAtras.Parameters.ParamByName('TABLA_BACKUP').Value := cTablaBackup;
	  SPInsertVueltaAtras.Parameters.ParamByName('FH_DISTRIBUCION').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
  	SPInsertVueltaAtras.Parameters.ParamByName('NRO_CORRIDA').Value := QryUltimaDistribucionNRO_CORRIDA.Value;
  	SPInsertVueltaAtras.Parameters.ParamByName('NRO_PROCESO_GEMA').Value := FRegistroDistribucion.Nro_Proceso;
	  SPInsertVueltaAtras.ExecProc;
  except
  on E:Exception do
  	Raise Exception.Create(E.Message);
  end;

end;

constructor TDMVueltaAtras.create(AOwner: TComponent; ARegistroDistribucion: TRegistroDistribucion; ARuta_Distribucion,ACaption: String);
begin
  FRegistroDistribucion := ARegistroDistribucion;
  inherited Create (AOwner,FRegistroDistribucion,ACaption);

  { Obtengo la última distribucion para la empresa - proceso}
  QryUltimaDistribucion.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryUltimaDistribucion.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryUltimaDistribucion.Open;
  if QryUltimaDistribucion.RecordCount < 1 then
  begin
    Application.MessageBox(PChar('NO EXISTEN DISTRIBUCIONES PARA VOLVER ATRAS'+#13#10+#13#10+'Empresa: '+FRegistroDistribucion.RazonSocial+#13#10+'Proceso: '+FRegistroDistribucion.DescProceso),
                           PChar('Gema - Generación de Archivos'),
                           MB_ICONWARNING );
    Abort;
	end;
  QryUltimaDistribucion.Last;

	{ Si la FH_DISTRIBUCION de GEMA.RESUMENES es < a la de GEMA.DISTRIBUCIONES_PROCESOS
  	o son iguales pero el NRO_CORRIDA  de GEMA.RESUMENES  < al de GEMA.DISTRIBUCIONES_PROCESOS
    entonces ya se realizó una la vuelta atrás para esa EMPRESA - PROCESO }
  QryUltimaDistProceso.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryUltimaDistProceso.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryUltimaDistProceso.Open;
  QryUltimaDistProceso.Last;
  if (QryUltimaDistribucionFH_DISTRIBUCION.Value = QryUltimaDistProcesoFH_DISTRIBUCION.Value) and
  		(QryUltimaDistribucionNRO_CORRIDA.Value = QryUltimaDistProcesoNRO_CORRIDA.Value) then
	begin
	  { Obtengo todas las fechas de proceso de la última Distribucion y Nro de Corrida}
  	QryDistribucionesProcesos.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
	  QryDistribucionesProcesos.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  	QryDistribucionesProcesos.Parameters.ParamByName('pFh_Distribucion').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
	  QryDistribucionesProcesos.Parameters.ParamByName('pNro_Corrida').Value := QryUltimaDistribucionNRO_CORRIDA.Value;
  	QryDistribucionesProcesos.Open;
	  QryDistribucionesProcesos.Last;
  	FUltima_Fh_Proceso := QryDistribucionesProcesosFH_PROCESO.Value;

	  TblGireCtrl.TableName := FRegistroDistribucion.Path_Cia+TblGireCtrl.TableName;
  end
  else
  begin
    Application.MessageBox(PChar('YA EXISTE UNA VUELTA ATRAS EFECTUADA'+#13#10+#13#10+'Empresa: '+FRegistroDistribucion.RazonSocial+#13#10+'Proceso: '+FRegistroDistribucion.DescProceso),
                           PChar('Gema - Generación de Archivos'),
                           MB_ICONWARNING );
    Abort;
  end;
end;

destructor TDMVueltaAtras.destroy;
begin
  QryDistribucionesProcesos.Close;
  QryUltimaDistribucion.Close;
  inherited;
end;

procedure TDMVueltaAtras.Back_Registros_DBF;
begin
  { Actualizo en la Tabla DBF los registros que provienen de la
    conversion inicial}
  if FRegistroDistribucion.Existe_Conversion then
   begin
    TblDBF.TableName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.DBF';
    TblDBF.TableType := Asigna_TipoIndice(QryTblDBFaTblOraTIPO_INDICE_DBF.Value);
    TblDBF.IndexName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.'+QryTblDBFaTblOraTIPO_INDICE_DBF.Value;

    { Copia la DBF como .NEW }
    Recuperar_TablaDbf(TblDBF.TableName);
    TblDBF.Open;
    TblDBF.Reindex;
    TblDBF.Commit;
    TblDBF.Close;
   end;

end;

procedure TDMVueltaAtras.Volver_Atras;
var
  cTablaAnterior: String;
begin
  try
    FFrmProgresoConversion := TFrmProgresoConversion.Create(Self,'Progreso de la Vuelta Atras');
    FFrmProgresoConversion.Caption := 'Progreso de la Vuelta Atrás';
    FFrmProgresoConversion.GroupBox2.Visible := False;
    FFrmProgresoConversion.LConvirtiendoTabla.Caption := 'Volviendo atrás...... ';
    FFrmProgresoConversion.Show;

  try
    GemaConexion.ADOConec.BeginTrans;
    SPRBSGrande.ExecProc;

    cTablaAnterior := '';
    QryTblDBFaTblOra.First;
    while not QryTblDBFaTblOra.Eof do
    begin
      { Mapeo de Campos }
      QryDistConversion.Close;
      QryDistConversion.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
      QryDistConversion.Parameters.ParamByName('pNro_Proceso').Value := IfThen( FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU, FRegistroDistribucion.Nro_Proceso);
      QryDistConversion.Parameters.ParamByName('pTipo_Archivo').Value := QryTblDBFaTblOraCOD_TIPO_ARCHIVO.Value;
      QryDistConversion.Parameters.ParamByName('pTipo_Archivo_DBF').Value := QryTblDBFaTblOraCOD_TIPO_ARCHIVO_DBF.Value;
      QryDistConversion.Open;

      FFrmProgresoConversion.LConvirtiendoTabla.Caption := 'Volviendo atrás '+StrTran(QryTblDBFaTblOraNOMBRE_TABLA_ORA.Value,'eeeee',Padl(IntToStr(FRegistroDistribucion.Cod_Cia),5,'0'));
      if QryDistConversion.RecordCount > 0 then
        Back_Registros_DBF;

      if cTablaAnterior <> QryTblDBFaTblOraNOMBRE_TABLA_ORA.Value then
      begin
        Application.ProcessMessages;
        Back_Registros_Ora;
        cTablaAnterior := QryTblDBFaTblOraNOMBRE_TABLA_ORA.Value;
      end;

      QryTblDBFaTblOra.Next;
    end;
    Back_GireCtrl;
    Volver_Atras_Secuencia;
    Eliminar_Resumen;
    GemaConexion.ADOConec.CommitTrans;

  except
    on E: Exception do
    begin
      GemaConexion.ManejaError1.IDRegistro := 'USER-ORA:'+GemaConexion.NombreUsuario+
                                              '; USER-NOVELL: '+Usuario_Novell+'; '+
                                              E.Message;
      HuboError;
      GemaConexion.ADOConec.RollbackTrans;
      RollBack_DBFs;
      Raise Exception.Create(' No se pudo realizar la vuelta atrás - '+E.Message);
    end;

  end;

  finally
    FFrmProgresoConversion.Free;
  end;

end;

procedure TDMVueltaAtras.Back_GireCtrl;
begin
  if FRegistroDistribucion.Existe_Conversion then
   begin
    Recuperar_TablaDBF(TblGireCtrl.TableName);
    Eliminar_Estados_y_Totales;
   end;
  Eliminar_Proceso101;
  Actualizar_Fh_Proceso;
  Actualizar_Automatico;
end;

procedure TDMVueltaAtras.Eliminar_Estados_y_Totales;
begin
  { Se elimina el proceso 100 de las fechas de proceso de la GireCtrl }
  TblGireCtrl.Open;
  while not TblGireCtrl.Eof do
  begin
    if (TblGireCtrl.FieldByName('COD_CIA').Value = FRegistroDistribucion.Cod_Cia) and
         (TblGireCtrl.FieldByName('NRO_PROC_S').Value = ifThen(FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU, FRegistroDistribucion.Nro_Proceso)) and
           (TblGireCtrl.FieldByName('FH_PROC_S').Value <= FUltima_Fh_Proceso) then
    begin

      { Elimino registro de GIRE.TOTALES_CONTROL }
      QryDelTotales_Control.Parameters.ParamByName('COD_CIA').Value := TblGireCtrl.FieldByName('COD_CIA').Value;
      QryDelTotales_Control.Parameters.ParamByName('COD_PROCESO').Value := TblGireCtrl.FieldByName('COD_PROCES').Value;
      QryDelTotales_Control.Parameters.ParamByName('NRO_PROCESO').Value := TblGireCtrl.FieldByName('NRO_PROCES').Value;
      QryDelTotales_Control.Parameters.ParamByName('COD_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('COD_PROC_S').Value;
      QryDelTotales_Control.Parameters.ParamByName('NRO_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('NRO_PROC_S').Value;
      QryDelTotales_Control.Parameters.ParamByName('FH_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('FH_PROC_S').Value;
      QryDelTotales_Control.ExecSQL;

      { Elimino registro de GIRE.ESTADOS }
      QryDelEstados.Parameters.ParamByName('COD_CIA').Value := TblGireCtrl.FieldByName('COD_CIA').Value;
      QryDelEstados.Parameters.ParamByName('COD_PROCESO').Value := TblGireCtrl.FieldByName('COD_PROCES').Value;
      QryDelEstados.Parameters.ParamByName('NRO_PROCESO').Value := TblGireCtrl.FieldByName('NRO_PROCES').Value;
      QryDelEstados.Parameters.ParamByName('FH_PROCESO').Value := TblGireCtrl.FieldByName('FH_PROC_S').Value;
      QryDelEstados.ExecSQL;
    end;
    TblGireCtrl.Next;
  end;
end;

procedure TDMVueltaAtras.Actualizar_Fh_Proceso;
begin
  { Actualiza última fecha de proceso (FH_PROCESO) con FH_PROCESO_ANTERIOR}
	try
  	QryAct_Fh_Proceso.Close;
    QryAct_Fh_Proceso.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
    QryAct_Fh_Proceso.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
    QryAct_Fh_Proceso.ExecSQL;
	except
		Raise Exception.Create(' ERROR AL ACTUALIZAR FECHA DE PROCESO EN LA TABLA DE DISTRIBUCIONES ');
  End;

end;

procedure TDMVueltaAtras.RollBack_DBFs;
begin

  { Si se produce un error en la vuelta atrás hay que dejar la
    GireCtrl y todas las DBF's como antes }
  Recuperar_DBFNEW(TblGireCtrl.TableName);

  { Falta Recuperar cada una de las tablas DBF }
  QryDistConversion.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryDistConversion.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryDistConversion.Parameters.ParamByName('pTipo_Archivo').Value := QryTblDBFaTblOraCOD_TIPO_ARCHIVO.Value;
  QryDistConversion.Parameters.ParamByName('pTipo_Archivo_DBF').Value := QryTblDBFaTblOraCOD_TIPO_ARCHIVO_DBF.Value;
  QryDistConversion.Open;

  if QryDistConversion.RecordCount > 0 then
  begin
    TblDBF.TableName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.DBF';
    TblDBF.IndexName := FRegistroDistribucion.Path_Cia+Trim(QryTblDBFaTblOraNOMBRE_TABLA_DBF.Value)+'.'+QryTblDBFaTblOraTIPO_INDICE_DBF.Value;
    Recuperar_TablaDbf(TblDBF.TableName);
  end;
  QryDistConversion.Close;
end;

procedure TDMVueltaAtras.Eliminar_Proceso101;
begin
  { Elimino el Proceso 100 de GIRE.ESTADOS }
  QryDistribucionesProcesos.First;
  while not QryDistribucionesProcesos.Eof do
  begin
    QryDelEstados.Parameters.ParamByName('COD_CIA').Value := FRegistroDistribucion.Cod_Cia;
    QryDelEstados.Parameters.ParamByName('COD_PROCESO').Value := 100;
    QryDelEstados.Parameters.ParamByName('NRO_PROCESO').Value := FRegistroDistribucion.Nro_Proceso;
    QryDelEstados.Parameters.ParamByName('FH_PROCESO').Value := QryDistribucionesProcesosFH_PROCESO.Value;
    QryDelEstados.ExecSQL;

    QryDistribucionesProcesos.Next;
  end;

  { Elimino el Proceso 101 de GIRE.ESTADOS }
  QryDistribucionesProcesos.First;
  while not QryDistribucionesProcesos.Eof do
  begin
    QryDelEstados.Parameters.ParamByName('COD_CIA').Value := FRegistroDistribucion.Cod_Cia;
    QryDelEstados.Parameters.ParamByName('COD_PROCESO').Value := 101;
    QryDelEstados.Parameters.ParamByName('NRO_PROCESO').Value := FRegistroDistribucion.Nro_Proceso;
    QryDelEstados.Parameters.ParamByName('FH_PROCESO').Value := QryDistribucionesProcesosFH_PROCESO.Value;
    QryDelEstados.ExecSQL;

    QryDistribucionesProcesos.Next;
  end;

end;

procedure TDMVueltaAtras.Eliminar_Resumen;
begin
  QryDelResumenes.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryDelResumenes.Parameters.ParamByName('pNro_Proceso').Value := ifThen(FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU, FRegistroDistribucion.Nro_Proceso);
  QryDelResumenes.Parameters.ParamByName('pFh_Distribucion').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
  QryDelResumenes.Parameters.ParamByName('pNro_Corrida').Value := QryUltimaDistribucionNRO_CORRIDA.Value;
  QryDelResumenes.ExecSQL;

end;

procedure TDMVueltaAtras.Volver_Atras_Secuencia;
begin
  {Obtener las CLAVE_SECUENCIA de los archivos generados }
  QryVueltaAtrasSecuencia.Close;
	QryVueltaAtrasSecuencia.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryVueltaAtrasSecuencia.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
 	QryVueltaAtrasSecuencia.Parameters.ParamByName('pFh_Distribucion').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
  QryVueltaAtrasSecuencia.Parameters.ParamByName('pNro_Corrida').Value := QryUltimaDistribucionNRO_CORRIDA.Value;
 	QryVueltaAtrasSecuencia.Open;

  while not QryVueltaAtrasSecuencia.Eof do
  begin
  	// Ver reemplazo de la mascara de CLAVE_SECUENCIA

		// Vuelve atrás el nro de secuencia
	  SPVuelveAtrasSecuencia.Parameters.Refresh;
	  SPVuelveAtrasSecuencia.Parameters.ParamByName('Empresa').Value := FRegistroDistribucion.Cod_Cia;
	  SPVuelveAtrasSecuencia.Parameters.ParamByName('Nroproceso').Value := FRegistroDistribucion.Nro_Proceso;
	  SPVuelveAtrasSecuencia.Parameters.ParamByName('ClaveSecuencia').Value := QryVueltaAtrasSecuencia.FieldByName('CLAVE_SECUENCIA').Value;
      SPVuelveAtrasSecuencia.Parameters.ParamByName('FhDistribucion').Value := QryUltimaDistribucionFH_DISTRIBUCION.Value;
      SPVuelveAtrasSecuencia.Parameters.ParamByName('NroCorrida').Value := QryUltimaDistribucionNRO_CORRIDA.Value;

	  SPVuelveAtrasSecuencia.ExecProc;
    QryVueltaAtrasSecuencia.Next;
  end;

end;

procedure TDMVueltaAtras.Actualizar_Automatico;
begin
  { Actualiza el estado de proceso para que pueda correr el gema automatico}

  if FRegistroDistribucion.Es_AU then
   begin
	  try
  	  qryDistrubucionesAutomatico.Close;
      qryDistrubucionesAutomatico.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
      qryDistrubucionesAutomatico.Parameters.ParamByName('pCod_Archivo').Value := FRegistroDistribucion.Nro_Proceso_AU;
      qryDistrubucionesAutomatico.ExecSQL;
	  except
		  Raise Exception.Create(' ERROR AL ACTUALIZAR EL PROCESO AUTOMATICO EN LA TABLA DE DISTRIBUCIONES ');
    End;
   end;

end;

end.

