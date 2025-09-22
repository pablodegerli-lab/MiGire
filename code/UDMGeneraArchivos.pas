unit UDMGeneraArchivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ADOCtrlP, CliCusEx, CliMacEx, UGeneral, Define, Db, ADODB, FileCtrl,
  UFrmProgreso, Espera, ApoDSet, ApoEnv, DBTables, ADOCtrlT,
  AdoGenAr, UDMGirePath, QRPDFFilt, QRExport, QRPrntr, URepoGemaBaseEmpresa, QuickRpt,
  ADOGraTo, Variants, DBClient, ProcFile;

type
//  TArrayDeChar = array [1..2048] of Char;

  TClaseFiltros = class of TQRExportFilter;

  TClaseRepoSalidas = class of TRepoGemaBaseEmpresa;

  TDMGeneraArchivos = class(TDMGirePath)
    AdoGeneraArchivoGema: TAdoGeneraArchivo;
    MacroEvalGema: TClipperMacroExpr;
    QryDistribuciones_Parametro: TADOQuery;
    QryDistribuciones_Detalle: TADOQuery;
    QryDistribuciones_Diseno: TADOQuery;
    QryDistribuciones_DisenoCOD_CIA: TIntegerField;
    QryDistribuciones_DisenoNRO_PROCESO: TIntegerField;
    QryDistribuciones_DisenoCOD_TIPO_ARCHIVO: TStringField;
    QryDistribuciones_DisenoCOD_DISENO: TStringField;
    QryDistribuciones_DisenoCOD_MODO: TIntegerField;
    QryIns_Resumenes: TADOQuery;
    QryUlt_Nro_Corrida: TADOQuery;
    QryAct_Fh_Proceso: TADOQuery;
    QrySelecciona_Tablas: TADOQuery;
    QrySelecciona_TablasTABLA: TStringField;
    ADOControlProcesoGema: TADOCtrlProcesos;
    QryInsTotales_Control: TADOQuery;
    QryInsEstados: TADOQuery;
    QryFh_Proceso_Anterior: TADOQuery;
    QryFh_Proceso_AnteriorFH_PROCESO_ANTERIOR: TDateTimeField;
    QryTablas_Oracle: TADOQuery;
    QryTablas_OracleNOMBRE_TABLA_ORA: TStringField;
    QryFh_Proceso_Ora: TADOQuery;
    QryDelTotales_Control: TADOQuery;
    QryDelEstados: TADOQuery;
    QryFh_Proceso: TADOQuery;
    QryCiasGema: TADOQuery;
    QryCiasGemaCOD_MODO: TIntegerField;
    QryCiasGemaDESCRIPCION: TStringField;
    QryCiasGemaCOPIA_A_TRANSMISION: TStringField;
    QryActDistriProcesos: TADOQuery;
    QryDistribucionesProcesos: TADOQuery;
    QryDistribucionesProcesosFH_PROCESO: TDateTimeField;
    QryXBase: TADOQuery;
    QryDistParCantidad: TADOQuery;
    QryDistParCantidadCOD_SQL: TStringField;
    QryDistribuciones_ParametroCOD_CIA: TIntegerField;
    QryDistribuciones_ParametroNRO_PROCESO: TIntegerField;
    QryDistribuciones_ParametroCOD_TIPO_ARCHIVO: TStringField;
    QryDistribuciones_ParametroCOD_DISENO: TStringField;
    QryDistribuciones_ParametroNRO_ORDEN: TIntegerField;
    QryDistribuciones_ParametroCOD_SQL: TStringField;
    QryDistribuciones_ParametroNRO_PARAMETRO: TIntegerField;
    QryDistribuciones_ParametroPROCEDENCIA_PARAMETRO: TStringField;
    QryDistribuciones_ParametroVALOR_PARAMETRO: TStringField;
    QryDistribuciones_Reemplazo: TADOQuery;
    QryDistribuciones_ReemplazoNRO_REEMPLAZO: TIntegerField;
    QryDistribuciones_ReemplazoVALOR_REEMPLAZO: TStringField;
    SPActBackup: TADOStoredProc;
    tblProcesta: TApolloTable;
    tblProccont: TApolloTable;
    QryNombreArchivo: TADOQuery;
    SPActSecuencia: TADOStoredProc;
    QryDistribuciones_DetalleCOD_CIA: TIntegerField;
    QryDistribuciones_DetalleNRO_PROCESO: TIntegerField;
    QryDistribuciones_DetalleCOD_TIPO_ARCHIVO: TStringField;
    QryDistribuciones_DetalleCOD_DISENO: TStringField;
    QryDistribuciones_DetalleNRO_ORDEN: TIntegerField;
    QryDistribuciones_DetalleHABILITADO: TIntegerField;
    QryDistribuciones_DetalleNOMBRE_ARCHIVO: TStringField;
    QryDistribuciones_DetalleCOD_FORMATO: TStringField;
    QryDistribuciones_DetallePATH_SALIDA: TStringField;
    QryDistribuciones_DetalleCONDICION_CORTE_ARCHIVO: TStringField;
    QryDistribuciones_DetalleUSUARIO: TStringField;
    QryDistribuciones_DetalleFH_ACTUALIZACION: TDateTimeField;
    QryDistribuciones_DetalleNULO: TIntegerField;
    QryDistribuciones_DetalleCOD_TIPO_ARCHIVO_DBF: TStringField;
    QryDistribuciones_DetalleINCLUIR_EN_FACTURA: TIntegerField;
    QryDistribuciones_DetalleLLEVA_SECUENCIA: TIntegerField;
    SPIniSecuencia: TADOStoredProc;
    QryDistribuciones_DetalleCLAVE_SECUENCIA: TStringField;
    QryDistribuciones_DetalleINCREMENTA_SECUENCIA: TIntegerField;
    QryDistribuciones_DetalleDESCRIPCION: TStringField;
    SPEliminaOrigen: TADOStoredProc;
    SPIniVbleSecuencia: TADOStoredProc;
    QryCantRegDetDBF: TADOQuery;
    QryCantRegDetDBFCANTIDAD: TIntegerField;
    QryDistribuciones_DetalleINFORME_MAIL: TIntegerField;
    QryDistribuciones_DetalleDESCRIPCION_MAIL: TStringField;
    QryDistribuciones_Param_Repor: TADOQuery;
    QryDistribuciones_Param_ReporCOD_CIA: TIntegerField;
    QryDistribuciones_Param_ReporNRO_PROCESO: TIntegerField;
    QryDistribuciones_Param_ReporCOD_TIPO_ARCHIVO: TStringField;
    QryDistribuciones_Param_ReporCOD_DISENO: TStringField;
    QryDistribuciones_Param_ReporNRO_ORDEN: TIntegerField;
    QryDistribuciones_Param_ReporNRO_PARAMETRO: TIntegerField;
    QryDistribuciones_Param_ReporVALOR_PARAMETRO: TStringField;
    QryDistribuciones_Reemp_Repor: TADOQuery;
    QryDistribuciones_Reemp_ReporCOD_CIA: TIntegerField;
    QryDistribuciones_Reemp_ReporNRO_PROCESO: TIntegerField;
    QryDistribuciones_Reemp_ReporCOD_TIPO_ARCHIVO: TStringField;
    QryDistribuciones_Reemp_ReporCOD_DISENO: TStringField;
    QryDistribuciones_Reemp_ReporNRO_ORDEN: TIntegerField;
    QryDistribuciones_Reemp_ReporNRO_REEMPLAZO: TIntegerField;
    QryDistribuciones_Reemp_ReporVALOR_REEMPLAZO: TStringField;
    SPDiaHabilCia: TADOStoredProc;
    QryCiasGemaCALCULO_DIA_HABIL: TStringField;
    SPDiaHabil: TADOStoredProc;
    QryExisteConversion: TADOQuery;
    QryUlt_Nro_CorridaULTIMO_NRO_CORRIDA: TBCDField;
    QryDistParCantidadCANTIDAD: TBCDField;
    ProcArchivos: TProcArchivos;
    Tabla_Reporte: TClientDataSet;
    QryDistribuciones_DetalleADMINISTRA_FINDELINEA: TIntegerField;
    SPMarcarTiempoProceso: TADOStoredProc;
    qryArchivosNulos: TADOQuery;
    SPSiempreDiaHabil: TADOStoredProc;
    procedure AdoGeneraArchivoGemaExisteArchivo(const Archivo: string;
      var Sigue: Boolean);
    procedure AdoGeneraArchivoGemaInformaTotales(Valor: Integer);
    procedure AdoGeneraArchivoGemaInformaRegistro(Valor: Integer);
    procedure ProcArchivosProcesarArchivo(ANombreArchivo: TFileName);
    procedure AdoGeneraArchivoGemaCreandoTemporal;
    procedure AdoGeneraArchivoGemaTemporalCreado;
    procedure AdoGeneraArchivoGemaPasoDos;
    procedure AdoGeneraArchivoGemaPasoTres;

  private
    FDISEMP: string;
    FIndice: string;
    FRegistroDistribucion: TRegistroDistribucion;
    FRuta_Salida, FRuta_Trx: string;
    FUltimo_Nro_Corrida: Integer;
    FrmProgreso: TFrmProgresoDistribucion;
    FUltima_Fh_Proceso, FFh_proceso_Anterior: TDate;
    AFechasProceso: TMiArraydeFechas;
    ATablasMovimientos: array of string;
    FListaClaseRepoSalidas: array of TClaseRepoSalidas;
    FReporteSalidas: TRepoGemaBaseEmpresa;
    FListaExportFilter: array of TClaseFiltros;
    FExportFilter: TQRExportFilter;
    FMisFiltros: array[0..5] of string;
    Fh_proceso_Ctrl: TDate;
    procedure SetListaAbstractExportFilter;
    procedure SetListaClaseRepoSalidas;
    procedure SetMisFiltros;
    procedure Importar_GireCtrl;
    procedure Autorizar_Procesos;
    procedure Finalizar_Procesos;
    procedure Restaurar_Procesos;
    procedure RollBack_Estados_Y_Totales;
    procedure Convertir_Tablas_DBF;
    procedure DesHacer_Convertir_Tablas_DBF;
    procedure Generar_Archivos;
    procedure Armar_Archivo;
    procedure Tratar_Totales;
    function Calcula_Ultimo_Nro_Corrida: Integer;
    procedure Actualiza_Fh_Proceso;
    procedure Actualizar_Procesados;
    procedure Limpia_GireCtrl;
    procedure SetMensajeProgreso(AMensaje: string);
    procedure Controlar_Totales;
    procedure Controlar_Fh_Procesos;
    procedure Ini_Vector_Tablas_Movimientos;
    procedure Copiar_A_Transmision;
    procedure Imprimir_Resumen;
    procedure Depura_Tablas;
    procedure Obtener_Estructuras_XBase;
    procedure Crear_Tabla_XBase(cNombre: string);
    procedure Inicializar_Secuencias;
    procedure Actualizar_Secuencias;
    procedure Inicializar_Variables_Secuencias;
    procedure Almacenar_Fecha_GireCtrl(var i: Integer);
    procedure Asignar_Indice_GireCtrl;
    procedure Distribucion_Permitida;
    procedure Inicializar_Procesta;
    procedure Finalizar_Procesta;
    procedure Generar_Reporte(ANroReporte: Integer; ANombre: string; AParamRepor, AReempRepor: Variant; ACodDiseno:string);
    procedure Insertar_En_Resumenes(ANombre_Archivo: string; ARegis, AMovim, ALotes: Integer; AImporte: Double);
    procedure AntesDeApendearDetalle(var Registro: string; var Appendea: Boolean);
    function getDato(ARegistro, ACampo: String):String;
    procedure Imprimir_Resumen_100;
    procedure LogProceso(Msj: string);
    procedure MarcoInicioFinProceso(sEstado:String);
    function Existe_Columna_EnTabla(pColumna,pTabla : String) : Boolean;
    function Genero_Archivo_Nulo(pCodCia, pNroProc :integer; pCodDiseno:string): Boolean;
    {Funciones propias de Gema que evalua el componente Evaluador}
    function FH_PROCESO: Variant;
    function PARAMETRO_INTERNO: Variant;
    function PATH_WORK: Variant;
    function MASCARA_ARCHIVO: Variant;
    function CODIGO_CIA: Variant;
    function NRO_PROCESO: Variant;
    function FH_DISTRI: Variant;
    function NRO_CORRIDA: Variant;
    function DIA_HABIL: Variant;
    function DIA_HABIL_CIA: Variant;
    function SIEMPRE_DIA_HABIL: Variant;    
    function NRO_LOTE: Variant;


  public
    constructor create(AOwner: TComponent; var ARegistro: TRegistroDistribucion; ARuta_Salida, ARuta_Trx: string); reintroduce; overload;
    destructor destroy; override;
  end;

implementation

uses UDMGemaConexion, URepoResumenDistribucion,
  UfrmControlTotalesManual, UDMCopiaATrx, UDMConversionInicial,
  UDmDepuracion, ManError, URepoSalida073Banco, URepoSalida073BancoSucursal,
  URepoSalida064BancoSucursal, URepoMailAEmpresa, URepoMailAEmpresaXArchivoSur,
  URepoMailAEmpresaXArchivoSurT, URepoMailAEmpresaXArchivoSurD, URepoSalida017Reversiones,
  URepoSalida064BcoSuc, URepoSalida064SucCableBco, URepoSalida508Cobranzas,
  URepoSalida003ATISxMoneda, URepoSalida056Contracargos,
  URepoSalida017Contracargos, URepoSalida008AltasBajas,
  URepoSalida003TasaXEntidad, URepoSalida018EntSucCable,
  URepoSalida018EntSucCableDebito, URepoSalida017Cobranzas,
  URepoSalida544Cobranzas, URepoSalida041Cobranzas, URepoSalida008SAP, URepoSalida100Cobranzas,
  Math, StrUtils, uRepoSalida057Cobranzas, uRepoSalida057ContabilizacionPagos,
  URepoResumenPagos603,uRepoResumenPagos603Edenor,uRepoSalida1379Cobranzas,
  URepoSalida1379ContabilizacionPagos, URepoSalida102SAP,uRepoSalidaControl,
  URepoSalida011Cobranzas, URepoSalida102NovRech, uRepoSalida244CcgCupones;

{$R *.DFM}

{ TDMGeneraArchivos }

procedure TDMGeneraArchivos.Armar_Archivo;
begin
  FrmProgreso := TFrmProgresoDistribucion.Create(Self, FRegistroDistribucion);

  try
    FrmProgreso.Show;

    try
      { Control de Procesos }
      LogProceso('Importando GireCtrl');
      Importar_GireCtrl;
      LogProceso('Realizando Control de Procesos');
      //GEMAU-124
      sleep(10000);
      Autorizar_Procesos;

      try
        GemaConexion.ADOConec.BeginTrans;
        { Obtengo las tablas de movimientos de la empresa }
        LogProceso( 'Obteniendo las tablas de movimientos de la empresa');
        Ini_Vector_Tablas_Movimientos;

        { Conversión Inicial (DBF --> ORA) }
        LogProceso( 'Ejecutando Conversión Inicial (DBF --> ORA)' );
        Convertir_Tablas_DBF;

        try
          { Controla si existe mas de una fecha de proceso distinta. De ser así
            indica al operador que tiene que distribuir por fecha de proceso en
            orden ascendente a menos que la empresa permita distintas fechas en
            un mismo archivo el cual llevará el nombre de la fecha mayor  }
          LogProceso( 'Controlando fechas de proceso' );
          Controlar_Fh_Procesos;

          { Control Manual de Totales }
          LogProceso('Esperando Control manual de Totales');
          Controlar_Totales;

          {Marcamos la tabla GEMA.DISTRIBUCIONES con la hora de inicio del proceso}
          LogProceso( 'Grabando la hora de inicio del proceso');
          MarcoInicioFinProceso('I');

          { Generación de Archivos }
          LogProceso('Generando el archivo de salida');
          Generar_Archivos;

          { Grabacion de FH_PROCESO en DISTRIBUCIONES }
          LogProceso('Grabando fechas de proceso en distribuciones');
          Actualiza_Fh_Proceso;

          LogProceso('Limpiando la tabla GireCtrl');
          Limpia_GireCtrl;

          { Depuración automática de las tablas de entrada }
          LogProceso('Depurando las tablas de datos');
          Depura_Tablas;

          { Actualización de los registros procesados. Puede que haga un Truncate
            con lo cual la siguiente instruccion no tiene ningun efecto }
          LogProceso('Pasando datos al Backup');
          Actualizar_Procesados;

          LogProceso('Aplicando los cambios realizados');
          {Marcamos la tabla GEMA.DISTRIBUCIONES con la hora de inicio del proceso}
          LogProceso( 'Grabando la hora de fin del proceso');
          MarcoInicioFinProceso('F');
          GemaConexion.ADOConec.CommitTrans;

          { Da por finalizado el proceso }
          LogProceso('Finalizando el control de procesos');
          try
            Finalizar_Procesos;
          except
            FRegistroDistribucion.Log_Proceso := FRegistroDistribucion.Log_Proceso + 'Error - Finalizando Procesos' +  #13#10;
          end;
          { Para la Afip - Código Cia 100}
          LogProceso('Consultando si la empresa es AFIP para generar listado especial');
          if FRegistroDistribucion.Cod_Cia = 100 then
          begin
             LogProceso( 'Imprimiendo resumen 100');
             Imprimir_Resumen_100;
          end;

          { Copia a Transmisión }
          LogProceso('Copiando el archivo del Work a transmision');
          Copiar_A_Transmision;

          { Impresion de totales de salida de la Distribucion }
          LogProceso('Imprimiendo listados si fuera necesario');
          Imprimir_Resumen;
          if not FRegistroDistribucion.Es_AU then
            Application.MessageBox(PChar('GENERACIÓN DE ARCHIVOS CONCLUIDA' + #13#10 + #13#10 + 'Empresa: ' + FRegistroDistribucion.RazonSocial + #13#10 + 'Proceso: ' + FRegistroDistribucion.DescProceso),
            PChar('Gema - Generación de Archivos'),
            MB_ICONINFORMATION);
          LogProceso('GENERACIÓN DE ARCHIVOS CONCLUIDA: '+FRegistroDistribucion.Nombre_Archivo);

        except
          on E: Exception do
          begin
            { Volver atrás la conversión de las DBF's }
            LogProceso('Realizando vuelta atras de DBFs por error: '+e.Message);
            DesHacer_Convertir_Tablas_DBF;

            raise Exception.Create(E.Message);
          end;
        end;

      except
        on E: Exception do
        begin
          try
            GemaConexion.ADOConec.RollbackTrans;
          except
          end;

          { Vuelta atras para cada fecha de proceso distinta del vector }
          LogProceso('Realizando vuelta atras de Oracle por error: '+e.Message);
          Restaurar_Procesos;
          raise Exception.Create(' El Proceso No Puede Continuar - ' + E.Message);

        end;
      end;

    except
      on E: Exception do
      begin
        LogProceso('Realizando recuperacion del proceso por el Error: '+e.Message);
        GemaConexion.ManejaError1.IDRegistro := 'USER-ORA:' + GemaConexion.NombreUsuario +
          '; USER-NOVELL: ' + Usuario_Novell + '; ' +
          '; DISTRIBUCION: ' + FRegistroDistribucion.RazonSocial + ' - ' +
          FRegistroDistribucion.DescProceso + '; ' +
          E.Message;
        HuboError;
        if FileExists(TblGireCtrl.TableName) and (FRegistroDistribucion.Existe_Conversion) then
        begin
          LogProceso( 'TblGireCtrl.Close;');
          TblGireCtrl.Close;
          LogProceso( 'Recuperar_DBFBCK(TblGireCtrl.TableName);');
          Recuperar_DBFBCK(TblGireCtrl.TableName);
          LogProceso( 'TblGireCtrl.Open;');
          TblGireCtrl.Open;
          LogProceso( 'Asignar_Indice_GireCtrl;');
          Asignar_Indice_GireCtrl;
          LogProceso( 'RollBack_Estados_Y_Totales;');
          RollBack_Estados_Y_Totales;
        end;
        if  FRegistroDistribucion.Es_AU then
          raise Exception.Create(E.Message)
        else
          Application.MessageBox(PChar(e.Message),
          PChar('Gema - Generación de Archivos'),
          MB_ICONERROR);

      end;
    end;

  finally
    LogProceso( 'Liberando FrmProgreso');
    FrmProgreso.Free;
  end;

end;

constructor TDMGeneraArchivos.create(AOwner: TComponent;
  var ARegistro: TRegistroDistribucion; ARuta_Salida, ARuta_Trx: string);
begin
  inherited Create(AOwner);
//  LogProceso('TDMGeneraArchivos.create');
  FRegistroDistribucion := ARegistro;

//  LogProceso(Format('Verificar_Directorios %s, %s', [ARuta_Salida, ARuta_Trx]));
  Verificar_Directorios(ARuta_Salida, ARuta_Trx);

  FRuta_Salida := ARuta_Salida;
  FRuta_Trx := ARuta_Trx;
  
//  LogProceso('MacroEvalGema.FuncList');
  MacroEvalGema.FuncList.AddIdent('FH_PROCESO', FH_PROCESO);
  MacroEvalGema.FuncList.AddIdent('PARAMETRO_INTERNO', PARAMETRO_INTERNO);
  MacroEvalGema.FuncList.AddIdent('PATH_WORK', PATH_WORK);
  MacroEvalGema.FuncList.AddIdent('MASCARA_ARCHIVO', MASCARA_ARCHIVO);
  MacroEvalGema.FuncList.AddIdent('CODIGO_CIA', CODIGO_CIA);
  MacroEvalGema.FuncList.AddIdent('NRO_PROCESO', NRO_PROCESO);
  MacroEvalGema.FuncList.AddIdent('NRO_LOTE', NRO_LOTE);
  MacroEvalGema.FuncList.AddIdent('FH_DISTRI', FH_DISTRI);
  MacroEvalGema.FuncList.AddIdent('NRO_CORRIDA', NRO_CORRIDA);
  MacroEvalGema.FuncList.AddIdent('DIA_HABIL', DIA_HABIL);
  MacroEvalGema.FuncList.AddIdent('DIA_HABIL_CIA', DIA_HABIL_CIA);
  MacroEvalGema.FuncList.AddIdent('SIEMPRE_DIA_HABIL', SIEMPRE_DIA_HABIL);
  FDISEMP := 'DISEMP';

//  LogProceso('Distribucion_Permitida');
  Distribucion_Permitida;

//  LogProceso('Inicializar_Procesta');
  Inicializar_Procesta;

//  LogProceso('Tabla_Reporte');
  Tabla_Reporte.CreateDataSet;
  Tabla_Reporte.Open;

  try
    QryCiasGema.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
    QryCiasGema.Open;

//    LogProceso('SetListaClaseRepoSalidas');
    SetListaClaseRepoSalidas;
//    LogProceso('SetListaAbstractExportFilter');
    SetListaAbstractExportFilter;
//    LogProceso('SetMisFiltros');
    SetMisFiltros;

    ATablasMovimientos := nil;

//    LogProceso('Armar_Archivo');
    Armar_Archivo;
  finally
   //if FRegistroDistribucion.Es_AU then
     ARegistro.Log_Proceso :=  FRegistroDistribucion.Log_Proceso + 'Proc    >> ' + TimeToStr(Time) + ' - Finalizando Tabla Procesta.';
//     LogProceso('Finalizar_Procesta');
     Finalizar_Procesta;
  end;
end;

procedure TDMGeneraArchivos.AdoGeneraArchivoGemaExisteArchivo(
  const Archivo: string; var Sigue: Boolean);
begin
  Sigue := True;
end;

procedure TDMGeneraArchivos.Tratar_Totales;
var
  i, nCantidad_Registros, nCantidad_Movimientos, nCantReg: Integer;
begin
  {Actualizo totales en tabla RESUMENES}
  try
    nCantReg := 0;
    for i := 0 to AdoGeneraArchivoGema.CantArchivosProcesados - 1 do
    begin

      if (AdoGeneraArchivoGema.ArchivosProcesados[i].Tamano > 0) or
        ((AdoGeneraArchivoGema.ArchivosProcesados[i].CantRegDetalle = 0) and (QryDistribuciones_Detalle.FieldByName('NULO').Value = 1)) then
      begin

        { Creo salida DBF }
        if QryDistribuciones_DetalleCOD_FORMATO.Value = 'DBF' then
          Crear_Tabla_XBase(AdoGeneraArchivoGema.ArchivosProcesados[i].Nombre);

        if AdoGeneraArchivoGema.ArchivosProcesados[i].Complemento <> '' then
          nCantidad_Movimientos := StrToInt(AdoGeneraArchivoGema.ArchivosProcesados[i].Complemento)
        else
          nCantidad_Movimientos := AdoGeneraArchivoGema.ArchivosProcesados[i].CantRegDetalle;

        nCantidad_Registros := AdoGeneraArchivoGema.ArchivosProcesados[i].CantRegHeader +
          AdoGeneraArchivoGema.ArchivosProcesados[i].CantRegDetalle +
          AdoGeneraArchivoGema.ArchivosProcesados[i].CantRegTrailer;

        nCantReg := nCantReg + nCantidad_Registros;

        Insertar_En_Resumenes(AdoGeneraArchivoGema.ArchivosProcesados[i].Nombre,
          nCantidad_Registros,
          nCantidad_Movimientos,
          AdoGeneraArchivoGema.ArchivosProcesados[i].CantLotes,
          AdoGeneraArchivoGema.ArchivosProcesados[i].ImporteDetalle)

      end
      else
        BorrarArchivo(AdoGeneraArchivoGema.ArchivosProcesados[i].Path + AdoGeneraArchivoGema.ArchivosProcesados[i].Nombre);

    end;
    { Actualización del Nº de Secuencia }
    if QryDistribuciones_Detalle.FieldByName('Lleva_Secuencia').Value = 1 then
      if (QryDistribuciones_Detalle.FieldByName('Nulo').Value = 1) or (nCantReg > 0) then
        Actualizar_Secuencias;

  except
    on E: Exception do
      raise Exception.Create(' Se ha producido el siguiente ERROR: ' + E.Message);
  end;
end;

function TDMGeneraArchivos.Calcula_Ultimo_Nro_Corrida: Integer;
begin
  QryUlt_Nro_Corrida.Close;
  QryUlt_Nro_Corrida.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryUlt_Nro_Corrida.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryUlt_Nro_Corrida.Parameters.ParamByName('pFh_Distribucion').Value := Date;
  if FRegistroDistribucion.Es_AU then
    QryUlt_Nro_Corrida.Parameters.ParamByName('pNro_proceso_gema').Value := FRegistroDistribucion.Nro_Proceso_AU
  else
    QryUlt_Nro_Corrida.Parameters.ParamByName('pNro_proceso_gema').Value := 0;
  QryUlt_Nro_Corrida.Open;

  if QryUlt_Nro_Corrida.Eof then
    Result := 1
  else
    Result := QryUlt_Nro_CorridaULTIMO_NRO_CORRIDA.AsInteger + 1;
end;

procedure TDMGeneraArchivos.Actualiza_Fh_Proceso;
var
  i: Integer;
  bReintentar:boolean;
  iReintentos:integer;
begin
  { Actualiza tabla GEMA.DISTRIBUCIONES_PROCESO}
  iReintentos := 0;
  for i := 0 to Length(AFechasProceso) - 1 do
  begin
  repeat
      try
        bReintentar := false;
        QryActDistriProcesos.Close;
        QryActDistriProcesos.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
        QryActDistriProcesos.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
        QryActDistriProcesos.Parameters.ParamByName('pFh_Distribucion').Value := Date;
        if FRegistroDistribucion.Es_AU then
         begin
          //Guardar el codigo de archivo para que funcione la corrida
		  QryActDistriProcesos.Parameters.ParamByName('pNro_Corrida').Value := Calcula_Ultimo_Nro_Corrida;
          QryActDistriProcesos.Parameters.ParamByName('pNro_proceso_gema').Value := FRegistroDistribucion.Nro_Proceso_AU;
         end
        else
         begin
          QryActDistriProcesos.Parameters.ParamByName('pNro_Corrida').Value := FUltimo_Nro_Corrida;
          QryActDistriProcesos.Parameters.ParamByName('pNro_proceso_gema').Value := 0;
         end;
        QryActDistriProcesos.Parameters.ParamByName('pFh_Proceso').Value := AFechasProceso[i];
        //if not FRegistroDistribucion.Es_AU then
          QryActDistriProcesos.ExecSQL;
      except

        begin
          bReintentar := true;
          iReintentos := iReintentos + 1;
        end;

      end;
    until (not bReintentar) or (iReintentos >= 20);
  end;

  { Obtengo la fecha de proceso mayor }
  QryDistribucionesProcesos.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryDistribucionesProcesos.Parameters.ParamByName('pNro_proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryDistribucionesProcesos.Parameters.ParamByName('pFh_Distribucion').Value := Date;
  QryDistribucionesProcesos.Parameters.ParamByName('pNro_Corrida').Value := FUltimo_Nro_Corrida;
  QryDistribucionesProcesos.Open;
  QryDistribucionesProcesos.Last;
  FUltima_Fh_Proceso := QryDistribucionesProcesosFH_PROCESO.Value;
  QryDistribucionesProcesos.Close;

  { Actualiza última fecha de proceso en GEMA.DISTRIBUCIONES }
  SetMensajeProgreso('Finalizando Generación de Archivos........');
  try
    QryAct_Fh_Proceso.Close;
    QryAct_Fh_Proceso.Parameters.ParamByName('pFh_Proceso').Value := FUltima_Fh_Proceso;
    QryAct_Fh_Proceso.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
    QryAct_Fh_Proceso.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
    QryAct_Fh_Proceso.ExecSQL;
  except
    raise Exception.Create(' ERROR AL ACTUALIZAR FECHA DE PROCESO EN LA TABLA DE DISTRIBUCIONES ');
  end;

end;

procedure TDMGeneraArchivos.Actualizar_Procesados;
var
  cTabla: string;
  i: Integer;
begin
  SetMensajeProgreso('Actualizando Tablas de Backup........');
  try
    for i := 0 to Length(ATablasMovimientos) - 1 do
    begin
      cTabla := ATablasMovimientos[i];

      { Actualizo los registros distribuidos }
      SPActBackup.Parameters.Refresh;
      SPActBackup.Parameters.ParamByName('TABLA_ORIGEN').Value := cTabla;
      SPActBackup.Parameters.ParamByName('TABLA_BACKUP').Value := 'BACKUP_' + cTabla;
      SPActBackup.Parameters.ParamByName('FH_PROCESO').Value := FRegistroDistribucion.Fh_Proceso;
      SPActBackup.Parameters.ParamByName('NRO_CORRIDA').Value := FUltimo_Nro_Corrida;
      SPActBackup.Parameters.ParamByName('NRO_PROCESO_GEMA').Value :=  IfThen(FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU, FRegistroDistribucion.Nro_Proceso); //FRegistroDistribucion.Nro_Proceso;
      SPActBackup.ExecProc;

      QrySelecciona_Tablas.Next;
    end

  except
    on E: Exception do
      raise Exception.Create(' Error en la actualización de registros procesados ' + E.Message);
  end;

end;

procedure TDMGeneraArchivos.Generar_Archivos;
procedure SimulaProceso;
var
  Valor: integer;
  Teclado: TKeyboardState;
  Salir: boolean;
begin
  Valor:=0;
  FrmProgreso.PBGeneraFiles.MaxValue := 100000;
  SetMensajeProgreso('Simulando proceso, presione (CTRL+F5) para salir........');
  Salir:=True;
  while Salir do
   begin
     FrmProgreso.PBGeneraFiles.Progress := Valor;
     if Valor mod 1000 = 0 then
       Application.ProcessMessages;
     inc(Valor);
     if Valor = 100000 then
       Valor := 0;
     GetKeyboardState(Teclado);
     If ( (Teclado[VK_CONTROL] and 128)=128 ) and ( (Teclado[VK_F5]      and 128)=128 )  then
      begin
        SetMensajeProgreso('Continuando con la generacion........');
        Salir:=False;
      end;
   end;
end;

var
  cNomArch: string;
  pParametros: Variant;
  pReemplazos: array of string;
//  nCantReg: Integer;
begin

  SetMensajeProgreso('Generando Archivos de Salida........');

  //SimulaProceso;  // Para Probar procesos simultaneos

  FUltimo_Nro_Corrida := Calcula_Ultimo_Nro_Corrida;
  FRegistroDistribucion.Nro_Corrida := FUltimo_Nro_Corrida;

  {Obtengo de la tabla DISTRIBUCIONES_DISENO los distintos diseños de la
   empresa/proceso a tratar}
  QryDistribuciones_Diseno.Close;
  QryDistribuciones_Diseno.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryDistribuciones_Diseno.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryDistribuciones_Diseno.Open;
  while (not QryDistribuciones_Diseno.Eof) do
  begin
    AdoGeneraArchivoGema.CodigoDiseno := QryDistribuciones_Diseno.FieldByName('COD_DISENO').Value;

    {Obtengo de la tabla DISTRIBUCIONES_DETALLE los distintos archivos que
     reponden a los diseños de la empresa/proceso a tratar}
    QryDistribuciones_Detalle.Close;
    QryDistribuciones_Detalle.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
    QryDistribuciones_Detalle.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
    QryDistribuciones_Detalle.Parameters.ParamByName('pTipo_Archivo').Value := QryDistribuciones_DisenoCOD_TIPO_ARCHIVO.Value;
    QryDistribuciones_Detalle.Parameters.ParamByName('pDiseno').Value := QryDistribuciones_DisenoCOD_DISENO.Value;
    QryDistribuciones_Detalle.Open;
    while (not QryDistribuciones_Detalle.Eof) do
    begin

      {Obtengo (si existe) el diseño de la tabla XBase de Salida}
      if QryDistribuciones_DetalleCOD_FORMATO.Value = 'DBF' then
        Obtener_Estructuras_XBase;

      {Estas salidas son Reportes}
      if Copy(QryDistribuciones_DetalleCOD_DISENO.Value, 7, 4) = 'LIST' then
      begin
        QryNombreArchivo.Close;
        QryNombreArchivo.Parameters.ParamByName('pCamino').Value := FRegistroDistribucion.Path_Work;
        QryNombreArchivo.Parameters.ParamByName('pMascara').Value := QryDistribuciones_Detalle.FieldByName('NOMBRE_ARCHIVO').Value;
        QryNombreArchivo.Parameters.ParamByName('pFecha').Value := DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual);
        QryNombreArchivo.Parameters.ParamByName('pEmpresa').Value := FRegistroDistribucion.Cod_Cia;
        QryNombreArchivo.Open;
        cNomArch := QryNombreArchivo.FieldByName('NOMARCH').Value;
        SetMensajeProgreso('Ejecutando diseño ' + QryDistribuciones_DetalleCOD_DISENO.Value + '-' + QryDistribuciones_DetalleDESCRIPCION.Value);

        { Carga de parametros para el Reporte}
        QryDistribuciones_Param_Repor.Close;
        QryDistribuciones_Param_Repor.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
        QryDistribuciones_Param_Repor.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
        QryDistribuciones_Param_Repor.Parameters.ParamByName('pTipo_Archivo').Value := QryDistribuciones_DetalleCOD_TIPO_ARCHIVO.Value;
        QryDistribuciones_Param_Repor.Parameters.ParamByName('pDiseno').Value := QryDistribuciones_DetalleCOD_DISENO.Value;
        QryDistribuciones_Param_Repor.Parameters.ParamByName('pNro_Orden').Value := QryDistribuciones_DetalleNRO_ORDEN.Value;
        QryDistribuciones_Param_Repor.Open;
        if QryDistribuciones_Param_Repor.RecordCount > 0 then
        begin
          pParametros := VarArrayCreate([1, QryDistribuciones_Param_Repor.RecordCount], varVariant);
          while not QryDistribuciones_Param_Repor.Eof do
          begin
            pParametros[QryDistribuciones_Param_ReporNRO_PARAMETRO.AsInteger] := MacroEvalGema.EvalString(QryDistribuciones_Param_ReporVALOR_PARAMETRO.Value);
            QryDistribuciones_Param_Repor.Next;
          end;
        end;
        QryDistribuciones_Param_Repor.Close;

        { Carga de reemplazos para el Reporte}
        QryDistribuciones_Reemp_Repor.Close;
        QryDistribuciones_Reemp_Repor.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
        QryDistribuciones_Reemp_Repor.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
        QryDistribuciones_Reemp_Repor.Parameters.ParamByName('pTipo_Archivo').Value := QryDistribuciones_DetalleCOD_TIPO_ARCHIVO.Value;
        QryDistribuciones_Reemp_Repor.Parameters.ParamByName('pDiseno').Value := QryDistribuciones_DetalleCOD_DISENO.Value;
        QryDistribuciones_Reemp_Repor.Parameters.ParamByName('pNro_Orden').Value := QryDistribuciones_DetalleNRO_ORDEN.Value;
        QryDistribuciones_Reemp_Repor.Open;
        if QryDistribuciones_Reemp_Repor.RecordCount > 0 then
        begin
          SetLength(pReemplazos, QryDistribuciones_Reemp_Repor.RecordCount);
          while not QryDistribuciones_Reemp_Repor.Eof do
          begin
            pReemplazos[QryDistribuciones_Reemp_ReporNRO_REEMPLAZO.AsInteger - 1] := QryDistribuciones_Reemp_ReporVALOR_REEMPLAZO.Value;
            QryDistribuciones_Reemp_Repor.Next;
          end;
        end;
        QryDistribuciones_Reemp_Repor.Close;

        Generar_Reporte(QryDistribuciones_DetalleCONDICION_CORTE_ARCHIVO.AsInteger, cNomArch, pParametros, pReemplazos,QryDistribuciones_DetalleCOD_DISENO.Value);
      end
      else
      begin

    { Para evitar escribir líneas nulas en el archivo de salida }
        if QryDistribuciones_DetalleNULO.AsInteger = 1 then
          AdoGeneraArchivoGema.OnAntesDeApendearDetalle := AntesDeApendearDetalle
        else
          AdoGeneraArchivoGema.OnAntesDeApendearDetalle := nil;

    { Para no realizar fin de linea entre cada parte del archivo }
        if QryDistribuciones_Detalle.FieldByName('ADMINISTRA_FINDELINEA').Value = 1 then
          AdoGeneraArchivoGema.FinDeLinea := False;

        AdoGeneraArchivoGema.LimpioParametrosValores;

       {Inicializo números de secuencia}
        if QryDistribuciones_Detalle.FieldByName('LLEVA_SECUENCIA').Value = 1 then
          Inicializar_Secuencias
        else
          Inicializar_Variables_Secuencias;

       {Cargo los parámetros del nombre de archivo}
        AdoGeneraArchivoGema.AddParametrosValores(['FANO', PATH_WORK, MASCARA_ARCHIVO, FH_PROCESO, CODIGO_CIA]);

       { Busca en al tabla DISTRIBUCIONES_PARAMETRO }
        QryDistParCantidad.Close;
        QryDistParCantidad.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
        QryDistParCantidad.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
        QryDistParCantidad.Parameters.ParamByName('pTipo_Archivo').Value := QryDistribuciones_DetalleCOD_TIPO_ARCHIVO.Value;
        QryDistParCantidad.Parameters.ParamByName('pDiseno').Value := QryDistribuciones_DetalleCOD_DISENO.Value;
        QryDistParCantidad.Parameters.ParamByName('pNro_Orden').Value := QryDistribuciones_DetalleNRO_ORDEN.Value;
        QryDistParCantidad.Open;

        while not QryDistParCantidad.Eof do
        begin
          pParametros := VarArrayCreate([0, QryDistParCantidadCANTIDAD.AsInteger], varVariant);
          pParametros[0] := QryDistParCantidadCOD_SQL.Value;

          QryDistribuciones_Parametro.Close;
          QryDistribuciones_Parametro.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
          QryDistribuciones_Parametro.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
          QryDistribuciones_Parametro.Parameters.ParamByName('pTipo_Archivo').Value := QryDistribuciones_DetalleCOD_TIPO_ARCHIVO.Value;
          QryDistribuciones_Parametro.Parameters.ParamByName('pDiseno').Value := QryDistribuciones_DetalleCOD_DISENO.Value;
          QryDistribuciones_Parametro.Parameters.ParamByName('pNro_Orden').Value := QryDistribuciones_DetalleNRO_ORDEN.Value;
          QryDistribuciones_Parametro.Parameters.ParamByName('pCod_Sql').Value := pParametros[0];
          QryDistribuciones_Parametro.Open;
          while not QryDistribuciones_Parametro.Eof do
          begin
            pParametros[QryDistribuciones_ParametroNRO_PARAMETRO.AsInteger] := MacroEvalGema.EvalString(QryDistribuciones_ParametroVALOR_PARAMETRO.Value);
            QryDistribuciones_Parametro.Next;
          end;

          AdoGeneraArchivoGema.AddParametrosValores(pParametros);
          QryDistParCantidad.Next;
        end;

       { Busca en al tabla DISTRIBUCIONES_REEMPLAZOS }
        QryDistribuciones_Reemplazo.Close;
        QryDistribuciones_Reemplazo.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
        QryDistribuciones_Reemplazo.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
        QryDistribuciones_Reemplazo.Parameters.ParamByName('pTipo_Archivo').Value := QryDistribuciones_DetalleCOD_TIPO_ARCHIVO.Value;
        QryDistribuciones_Reemplazo.Parameters.ParamByName('pDiseno').Value := QryDistribuciones_DetalleCOD_DISENO.Value;
        QryDistribuciones_Reemplazo.Parameters.ParamByName('pNro_Orden').Value := QryDistribuciones_DetalleNRO_ORDEN.Value;
        QryDistribuciones_Reemplazo.Open;
        if not QryDistribuciones_Reemplazo.Eof then
        begin
          pReemplazos := nil;
          SetLength(pReemplazos, QryDistribuciones_Reemplazo.Recordcount);
          while not QryDistribuciones_Reemplazo.Eof do
          begin
            pReemplazos[QryDistribuciones_ReemplazoNRO_REEMPLAZO.AsInteger - 1] := QryDistribuciones_ReemplazoVALOR_REEMPLAZO.Value;
            QryDistribuciones_Reemplazo.Next;
          end;
          AdoGeneraArchivoGema.ParametrosCadenas(pReemplazos);
        end;
       {Cargo el directorio temporal para hacer el archivo auxiliar del componente que hace el archivo}
        AdoGeneraArchivoGema.PathTemporal := PATH_WORK;
        {Cargo el directorio temporal para hacer el archivo auxiliar del componente que hace el archivo}
        AdoGeneraArchivoGema.PathTemporal := PATH_WORK;


        SetMensajeProgreso('Ejecutando diseño ' + AdoGeneraArchivoGema.CodigoDiseno + '-' + QryDistribuciones_DetalleDESCRIPCION.Value);
        AdoGeneraArchivoGema.Ejecutar;

        AdoGeneraArchivoGema.FinDeLinea := True;

       { Grabacion de totales en RESUMENES. Ver de pasar parametros para usar
          el mismo procedimiento para los reportes }
        Tratar_Totales;
      end;

      QryDistribuciones_Detalle.Next;
    end;

    { Cierre de Qrys }
    QryXBase.Close;
    QryDistParCantidad.Close;
    QryDistribuciones_Parametro.Close;

    QryDistribuciones_Diseno.Next;
  end;

end;

procedure TDMGeneraArchivos.Autorizar_Procesos;
var
  i, j: integer;
  cNombreTablaOra: string;
begin
  try
    { Obtengo las Tablas de Servicios ORA que posee la Empresa }
    QryTablas_Oracle.Close;
    QryTablas_Oracle.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
    QryTablas_Oracle.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
    QryTablas_Oracle.Open;

    { Obtengo las distintas Fechas de Proceso de las tablas Oracle de la Empresa
      Las agrego al mismo vector donde tengo las fechas de proceso del GireCtrl.dbf }
    if QryTablas_Oracle.RecordCount > 0 then
    begin
      QryFh_Proceso_Ora.SQL.Add('select distinct fh_proceso from(');
      for i := 1 to QryTablas_Oracle.RecordCount - 1 do
      begin
        cNombreTablaOra := StrTran(QryTablas_OracleNOMBRE_TABLA_ORA.Value, 'eeeee', StrZero(FRegistroDistribucion.Cod_Cia, 5, 0));
        QryFh_Proceso_Ora.SQL.Add(' select distinct fh_proceso from GEMA.' + cNombreTablaOra);
        QryFh_Proceso_Ora.SQL.Add(' where FH_PROCESO <= To_Date(''' + DateToStr(FRegistroDistribucion.Fh_Proceso) + ''',''dd/mm/yyyy'')');
        if Existe_Columna_EnTabla('NRO_PROCESO',cNombreTablaOra) then
          QryFh_Proceso_Ora.SQL.Add('       and NRO_PROCESO = ' + IntToStr(FRegistroDistribucion.Nro_Proceso) )
        else
          QryFh_Proceso_Ora.SQL.Add('       and NRO_PROCESO_GEMA = ' + IntToStr(FRegistroDistribucion.Nro_Proceso) )  ;
        QryFh_Proceso_Ora.SQL.Add(' union all ');
        QryTablas_Oracle.Next
      end;
      cNombreTablaOra := StrTran(QryTablas_OracleNOMBRE_TABLA_ORA.Value, 'eeeee', StrZero(FRegistroDistribucion.Cod_Cia, 5, 0));
      QryFh_Proceso_Ora.SQL.Add(' select distinct fh_proceso from GEMA.' + cNombreTablaOra );
      QryFh_Proceso_Ora.SQL.Add(' where FH_PROCESO <= To_Date(''' + DateToStr(FRegistroDistribucion.Fh_Proceso) + ''',''dd/mm/yyyy'')');
      if Existe_Columna_EnTabla('NRO_PROCESO',cNombreTablaOra) then
        QryFh_Proceso_Ora.SQL.Add('       and NRO_PROCESO = ' + IntToStr(FRegistroDistribucion.Nro_Proceso)+ ')' )
      else
        QryFh_Proceso_Ora.SQL.Add('       and NRO_PROCESO_GEMA = ' + IntToStr(FRegistroDistribucion.Nro_Proceso)+ ')' );
      QryFh_Proceso_Ora.Open;
      while not QryFh_Proceso_Ora.Eof do
      begin
        j := 0;
        while (j < Length(AFechasProceso)) and (AFechasProceso[j] <> QryFh_Proceso_Ora.FieldByName('fh_proceso').Value) do
          j := j + 1;
        if j = Length(AFechasProceso) then
        begin
          SetLength(AFechasProceso, Length(AFechasProceso) + 1);
          AFechasProceso[Length(AFechasProceso) - 1] := QryFh_Proceso_Ora.FieldByName('fh_proceso').value;
        end;
        QryFh_Proceso_Ora.Next;
      end;
    end
    else
      raise Exception.Create('Debe existir al menos una tabla de servicios para la empresa en GEMA. (Ej: COBRANZAS_eeeee)');

  { Control de fechas para la generación de archivos vacíos diarios}
    SortArray(AFechasProceso);
    if ((QryCiasGema.FieldByName('COD_MODO').Value = 1) or (FRegistroDistribucion.Cod_Modo = 1)) then
      MacroEvalGema.EvalString(QryCiasGemaCALCULO_DIA_HABIL.Value)
    else
      if Length(AFechasProceso) = 0 then
        raise Exception.Create('( NO EXISTEN MOVIMIENTOS PARA PROCESAR )');

    { Ejecuto el Control de Procesos para cada fecha de proceso distinta del vector }
    SortArray(AFechasProceso);
    FRegistroDistribucion.FMaxFh_Proceso_Actual := AFechasProceso[Length(AFechasProceso) - 1];

    for i := 0 to Length(AFechasProceso) - 1 do
    begin
      ADOControlProcesoGema.Empresa := FRegistroDistribucion.Cod_Cia;
      ADOControlProcesoGema.CodProceso := 100;
      ADOControlProcesoGema.NroProceso := FRegistroDistribucion.Nro_Proceso;
      ADOControlProcesoGema.FH_Proceso := AFechasProceso[i];
      ADOControlProcesoGema.FH_Proceso_Anterior := FFh_Proceso_Anterior;
      ADOControlProcesoGema.ProcesosRelacionados :=  FRegistroDistribucion.Procesos_Relacionados;
      if not FRegistroDistribucion.Es_AU then
       begin
        if not ADOControlProcesoGema.Autorizado then
          Abort;
       end;
    end;
  except
    on E: Exception do
    begin
      QryTablas_Oracle.Close;
      QryFh_Proceso_Ora.Close;
      SetMensajeProgreso('Control de Procesos ----> ERROR!!. ');
      raise Exception.Create('EL CONTROL DE PROCESOS NO PERMITE CONTINUAR: ' + E.Message);
    end;
  end;

  SetMensajeProgreso('Actualización de Tablas de Control de Totales  -->> OK. ')

end;

destructor TDMGeneraArchivos.destroy;
var
  NombreIndice: string;
begin
  QryCiasGema.Close;
  NombreIndice := TblGireCtrl.IndexName;
  if NombreIndice <> '' then
  begin
    TblGireCtrl.IndexClose;
    BorrarArchivo(NombreIndice);
  end;
  inherited;
end;

procedure TDMGeneraArchivos.SetMensajeProgreso(AMensaje: string);
begin
  FrmProgreso.REProgreso.Lines.Add(AMensaje);
  Application.ProcessMessages;
end;

procedure TDMGeneraArchivos.Convertir_Tablas_DBF;
var
  FDMConversionInicial: TDMConversionInicial;
begin
	try
   { QryExisteConversion.Close;
    QryExisteConversion.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
    QryExisteConversion.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
    QryExisteConversion.Open;
    if	QryExisteConversion.RecordCount > 0 then}
    if	FRegistroDistribucion.Existe_Conversion then
    begin
		  FDMConversionInicial := TDMConversionInicial.Create(Self, FRegistroDistribucion, 'Progreso de la Conversión Inicial');
		  try
		    SetMensajeProgreso('Realizando la Conversión Inicial......');
		    FDMConversionInicial.Iniciar_Conversion;
		    SetMensajeProgreso('Conversión Inicial -->> OK.')
		  except
		    on E: Exception do
		    begin
		      SetMensajeProgreso('Conversión Inicial -->> ERROR!.');
		      FDMConversionInicial.DesHacer_Conversion;
    		  FDMConversionInicial.Free;
		      raise Exception.Create('Problema para Convertir Tablas DBF ' + E.Message);
    		end;
		  end;
		  FDMConversionInicial.Free;
    end
    else
	    SetMensajeProgreso('Distribución sin Conversion Inicial......');
  except
    on E: Exception do
	    raise Exception.Create('Error en averiguación de conversión inicial -  ' + E.Message);
  end;
end;

procedure TDMGeneraArchivos.Importar_GireCtrl;
var
  i: Integer;
  lActualizo: Boolean;
  wCod_Cia, wCod_Proceso, wNro_Proceso: Integer;
  wFh_Proceso: TDate;
begin
  try
    GemaConexion.ADOConec.BeginTrans;
    SPRBSGrande.ExecProc;

    SetMensajeProgreso('Actualizando Tablas de Control de Totales........');

    if FRegistroDistribucion.Existe_Conversion then
     begin
      { Obtengo la ultima fecha de proceso de Gema para la Empresa-Proceso Seleccionada}
      QryFh_Proceso_Anterior.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
      QryFh_Proceso_Anterior.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
      QryFh_Proceso_Anterior.Open;
      FFh_Proceso_Anterior := QryFh_Proceso_AnteriorFH_PROCESO_ANTERIOR.Value;
      QryFh_Proceso_Anterior.Close;

      TblGireCtrl.TableName := ObtenerPathCiaDBF(FRegistroDistribucion.Cod_Cia) + 'GireCtrl.DBF';
      if not FileExists(TblGireCtrl.TableName) then
        raise Exception.Create(' Tabla GIRECTRL inexistente - Avise a Sistemas ');

      { Respaldo de GIRECTRL.DBF como '.BCK' }
      Respaldar_TablaDBF(TblGireCtrl.TableName);

      TblGireCtrl.Open;
      TblGireCtrl.Pack;
      Asignar_Indice_GireCtrl;

      lActualizo := False;
      i := 1;
      AFechasProceso := nil;
      TblGireCtrl.First;
      if not TblGireCtrl.Eof then
       begin
        wCod_Cia := TblGireCtrl.FieldByName('COD_CIA').Value;
        wCod_Proceso := TblGireCtrl.FieldByName('COD_PROCES').Value;
        wNro_Proceso := TblGireCtrl.FieldByName('NRO_PROCES').Value;
        wFh_Proceso := TblGireCtrl.FieldByName('FH_PROC_S').Value;
        while not TblGireCtrl.Eof do
         begin
          if (TblGireCtrl.FieldByName('COD_CIA').Value = FRegistroDistribucion.Cod_Cia) and
             (TblGireCtrl.FieldByName('NRO_PROC_S').Value = FRegistroDistribucion.Nro_Proceso) and
             (TblGireCtrl.FieldByName('FH_PROC_S').Value <= FRegistroDistribucion.Fh_Proceso) then
           begin
            { Importo registro a GIRE.TOTALES_CONTROL }
            QryInsTotales_Control.Parameters.ParamByName('COD_CIA').Value := TblGireCtrl.FieldByName('COD_CIA').Value;
            QryInsTotales_Control.Parameters.ParamByName('COD_PROCESO').Value := TblGireCtrl.FieldByName('COD_PROCES').Value;
            QryInsTotales_Control.Parameters.ParamByName('NRO_PROCESO').Value := TblGireCtrl.FieldByName('NRO_PROCES').Value;
            QryInsTotales_Control.Parameters.ParamByName('DESCRIPCION').Value := TblGireCtrl.FieldByName('DESCRIPCIO').Value;
            QryInsTotales_Control.Parameters.ParamByName('COD_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('COD_PROC_S').Value;
            QryInsTotales_Control.Parameters.ParamByName('NRO_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('NRO_PROC_S').Value;
            QryInsTotales_Control.Parameters.ParamByName('FH_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('FH_PROC_S').Value;
            QryInsTotales_Control.Parameters.ParamByName('CANTIDAD_TOTAL').Value := TblGireCtrl.FieldByName('CANTIDAD').Value;
            QryInsTotales_Control.Parameters.ParamByName('IMPORTE_TOTAL').Value := TblGireCtrl.FieldByName('IMPORTE').Value;
            QryInsTotales_Control.Parameters.ParamByName('CANTIDAD_ELIMINADOS').Value := TblGireCtrl.FieldByName('CANT_ELIM').Value;
            QryInsTotales_Control.Parameters.ParamByName('IMPORTE_ELIMINADOS').Value := TblGireCtrl.FieldByName('IMPOR_ELIM').Value;
            QryInsTotales_Control.Parameters.ParamByName('USUARIO').Value := TblGireCtrl.FieldByName('USUARIO').Value;
            QryInsTotales_Control.Parameters.ParamByName('FH_ACTUALI').Value := TblGireCtrl.FieldByName('FH_ACTUALI').Value;
            QryInsTotales_Control.ExecSQL;

            lActualizo := True;

            if (TblGireCtrl.FieldByName('COD_CIA').Value <> wCod_Cia) or
               (TblGireCtrl.FieldByName('COD_PROCES').Value <> wCod_Proceso) or
               (TblGireCtrl.FieldByName('NRO_PROCES').Value <> wNro_Proceso) or
               (TblGireCtrl.FieldByName('FH_PROC_S').Value <> wFh_Proceso) then
             begin
              QryInsEstados.Parameters.ParamByName('COD_CIA').Value := wCod_Cia;
              QryInsEstados.Parameters.ParamByName('COD_PROCESO').Value := wCod_Proceso;
              QryInsEstados.Parameters.ParamByName('NRO_PROCESO').Value := wNro_Proceso;
              QryInsEstados.Parameters.ParamByName('FH_PROCESO').Value := wFh_Proceso;
              QryInsEstados.ExecSQL;

              wCod_Cia := TblGireCtrl.FieldByName('COD_CIA').Value;
              wCod_Proceso := TblGireCtrl.FieldByName('COD_PROCES').Value;
              wNro_Proceso := TblGireCtrl.FieldByName('NRO_PROCES').Value;
              wFh_Proceso := TblGireCtrl.FieldByName('FH_PROC_S').Value;
              lActualizo := False;
             end;

            Almacenar_Fecha_GireCtrl(i);

            TblGireCtrl.Delete;
           end;
          TblGireCtrl.Next;
         end;
        if lActualizo then
         begin
          QryInsEstados.Parameters.ParamByName('COD_CIA').Value := wCod_Cia;
          QryInsEstados.Parameters.ParamByName('COD_PROCESO').Value := wCod_Proceso;
          QryInsEstados.Parameters.ParamByName('NRO_PROCESO').Value := wNro_Proceso;
          QryInsEstados.Parameters.ParamByName('FH_PROCESO').Value := wFh_Proceso;
          QryInsEstados.ExecSQL;
        end;
      end;
     end;
    GemaConexion.ADOConec.CommitTrans;
  except
    on E: Exception do
    begin
      GemaConexion.ADOConec.RollbackTrans;
      SetMensajeProgreso('Actualización de Tablas de Control de Totales  -->> ERROR!!. ');
      raise Exception.Create('Error en la Actualizacion de Control de Totales: ' + E.Message);
    end;
  end;

end;

procedure TDMGeneraArchivos.Limpia_GireCtrl;
begin
  if FRegistroDistribucion.Existe_Conversion then
    TblGireCtrl.Pack;
end;


procedure TDMGeneraArchivos.RollBack_Estados_Y_Totales;
var
  lActualizo: Boolean;
  wCod_Cia, wCod_Proceso, wNro_Proceso: Integer;
  wFh_Proceso: TDate;
begin
  lActualizo := False;
  TblGireCtrl.First;
  if not TblGireCtrl.Eof then
  begin
    wCod_Cia := TblGireCtrl.FieldByName('COD_CIA').Value;
    wCod_Proceso := TblGireCtrl.FieldByName('COD_PROCES').Value;
    wNro_Proceso := TblGireCtrl.FieldByName('NRO_PROCES').Value;
    wFh_Proceso := TblGireCtrl.FieldByName('FH_PROC_S').Value;
    while not TblGireCtrl.Eof do
    begin
      if (TblGireCtrl.FieldByName('COD_CIA').Value = FRegistroDistribucion.Cod_Cia) and
        (TblGireCtrl.FieldByName('NRO_PROC_S').Value = FRegistroDistribucion.Nro_Proceso) and
        (TblGireCtrl.FieldByName('FH_PROC_S').Value <= FRegistroDistribucion.Fh_Proceso) then
      begin
        { Elimino registro de GIRE.TOTALES_CONTROL }
        QryDelTotales_Control.Parameters.ParamByName('COD_CIA').Value := TblGireCtrl.FieldByName('COD_CIA').Value;
        QryDelTotales_Control.Parameters.ParamByName('COD_PROCESO').Value := TblGireCtrl.FieldByName('COD_PROCES').Value;
        QryDelTotales_Control.Parameters.ParamByName('NRO_PROCESO').Value := TblGireCtrl.FieldByName('NRO_PROCES').Value;
        QryDelTotales_Control.Parameters.ParamByName('COD_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('COD_PROC_S').Value;
        QryDelTotales_Control.Parameters.ParamByName('NRO_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('NRO_PROC_S').Value;
        QryDelTotales_Control.Parameters.ParamByName('FH_PROCESO_SALIDA').Value := TblGireCtrl.FieldByName('FH_PROC_S').Value;
        QryDelTotales_Control.ExecSQL;

        lActualizo := True;

        if (TblGireCtrl.FieldByName('COD_CIA').Value <> wCod_Cia) or
          (TblGireCtrl.FieldByName('COD_PROCES').Value <> wCod_Proceso) or
          (TblGireCtrl.FieldByName('NRO_PROCES').Value <> wNro_Proceso) or
          (TblGireCtrl.FieldByName('FH_PROC_S').Value <> wFh_Proceso) then
        begin
          QryDelEstados.Parameters.ParamByName('COD_CIA').Value := wCod_Cia;
          QryDelEstados.Parameters.ParamByName('COD_PROCESO').Value := wCod_Proceso;
          QryDelEstados.Parameters.ParamByName('NRO_PROCESO').Value := wNro_Proceso;
          QryDelEstados.Parameters.ParamByName('FH_PROCESO').Value := wFh_Proceso;
          QryDelEstados.ExecSQL;

          wCod_Cia := TblGireCtrl.FieldByName('COD_CIA').Value;
          wCod_Proceso := TblGireCtrl.FieldByName('COD_PROCES').Value;
          wNro_Proceso := TblGireCtrl.FieldByName('NRO_PROCES').Value;
          wFh_Proceso := TblGireCtrl.FieldByName('FH_PROC_S').Value;
          lActualizo := False;
        end;
      end;
      TblGireCtrl.Next;
    end;
    if lActualizo then
    begin
      QryDelEstados.Parameters.ParamByName('COD_CIA').Value := wCod_Cia;
      QryDelEstados.Parameters.ParamByName('COD_PROCESO').Value := wCod_Proceso;
      QryDelEstados.Parameters.ParamByName('NRO_PROCESO').Value := wNro_Proceso;
      QryDelEstados.Parameters.ParamByName('FH_PROCESO').Value := wFh_Proceso;
      QryDelEstados.ExecSQL;
    end;
  end;

end;

procedure TDMGeneraArchivos.Controlar_Totales;
var
  FrmControlTotalManual: TFrmCtrlTotalesManual;
begin
  FrmControlTotalManual := TFrmCtrlTotalesManual.create(Self, FRegistroDistribucion, ATablasMovimientos);
  try
    if FRegistroDistribucion.Es_AU then
      FrmControlTotalManual.AceptarExecute(Self)
    else
      if FrmControlTotalManual.ShowModal = mrCancel then
        raise Exception.Create('El sistema realizó una " Vuelta Atrás "' + #13#10 +
          'Controle los totales y ejecute nuevamente la Distribución');
  finally
    FrmControlTotalManual.Free;
  end;

end;

procedure TDMGeneraArchivos.Controlar_Fh_Procesos;
var
  cFh_Proceso: string;
begin
  QryFh_Proceso_Ora.Close;
  QryFh_Proceso_Ora.Open;

  { Evaluar si puedo juntar distintas fechas de proceso bajo la mayor de todas}
  if (QryFh_Proceso_Ora.RecordCount > 1) and (QryCiasGema.FieldByName('COD_MODO').Value <> 3) then
  begin
    while not QryFh_Proceso_Ora.Eof do
    begin
      cFh_Proceso := cFh_Proceso + DateToStr(QryFh_Proceso_Ora.FieldByName('FH_PROCESO').Value) + #13#10;
      QryFh_Proceso_Ora.Next;
    end;
    raise Exception.Create('Existe mas de una FECHA de PROCESO para distribuir y son:' + #13#10 +
      cFh_Proceso + #13#10 +
      'Elija la menor y vuelva a ejecutar la distribución para la empresa');
  end;
end;

procedure TDMGeneraArchivos.Ini_Vector_Tablas_Movimientos;
var
  cTabla: string;
begin

  try
    QrySelecciona_Tablas.Close;
    QrySelecciona_Tablas.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
    QrySelecciona_Tablas.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
    QrySelecciona_Tablas.Open;
    while (not QrySelecciona_Tablas.Eof) do
    begin
      cTabla := Trim(QrySelecciona_TablasTABLA.Value);
      cTabla := StrTran(cTabla, 'eeeee', strzero(FRegistroDistribucion.Cod_Cia, 5, 0));
      SetLength(ATablasMovimientos, Length(ATablasMovimientos) + 1);
      ATablasMovimientos[Length(ATablasMovimientos) - 1] := cTabla;
      QrySelecciona_Tablas.Next;
    end

  except
    raise Exception.Create(' ERROR EN LA CARGA DE TABLAS DE LA EMPRESA ');
  end;

end;

procedure TDMGeneraArchivos.Copiar_A_Transmision;
var
  FDMCopia_A_Trx: TDMCopiaATrx;
begin
  { Copio a transmision o a salida desde WORK }
  FDMCopia_A_Trx := TDMCopiaATrx.Create(Self, FRegistroDistribucion, FRuta_Salida, FRuta_Trx);
  try
    try
      FDMCopia_A_Trx.Copiar_A_Trx('GA');
    except
      on e:exception do
        raise exception.Create('Error al intentar copiar el archivo a '+FRuta_Trx + #13#10 +e.message);
    end;
  finally
    FDMCopia_A_Trx.Free;
  end;
end;

procedure TDMGeneraArchivos.DesHacer_Convertir_Tablas_DBF;
var
  FDMConversionInicial: TDMConversionInicial;
begin
  if FRegistroDistribucion.Existe_Conversion then
   begin
    FDMConversionInicial := TDMConversionInicial.Create(Self, FRegistroDistribucion, 'Progreso de la Conversión Inicial');
    try
      try
        FDMConversionInicial.DesHacer_Conversion;
      except
        on E: Exception do
         begin
          FDMConversionInicial.Free;
          raise Exception.Create('Problema para Deshacer la Conversión de Tablas DBF ' + E.Message);
         end;
      end;
    finally
      FDMConversionInicial.Free;
    end;
   end; 
end;

procedure TDMGeneraArchivos.Finalizar_Procesos;
var
  i: Integer;
begin
  for i := 0 to Length(AFechasProceso) - 1 do
  begin
    ADOControlProcesoGema.FH_Proceso := AFechasProceso[i];
    ADOControlProcesoGema.Finalizado;
  end;
end;

procedure TDMGeneraArchivos.Restaurar_Procesos;
var
  i: Integer;
begin
  for i := 0 to Length(AFechasProceso) - 1 do
  begin
    ADOControlProcesoGema.FH_Proceso := AFechasProceso[i];
    ADOControlProcesoGema.VueltaAtras; { Elimina el proceso de la tabla estados }
  end;

end;


procedure TDMGeneraArchivos.Imprimir_Resumen;
var
  FReporteDistribucion: TRepoResumenDistribucion;
begin
  //if not FRegistroDistribucion.Es_AU then
  if ((not FRegistroDistribucion.Es_AU) and (FRegistroDistribucion.Imprime)) then
   begin
    FReporteDistribucion := TRepoResumenDistribucion.create(Self, FRegistroDistribucion, FUltimo_Nro_Corrida, 'ORIGINAL');
    try
      if FReporteDistribucion.QryBaseReporte.RecordCount > 0 then
      //FReporteDistribucion.Preview;
        FReporteDistribucion.Print;
    finally
      FReporteDistribucion.Free;
    end;
   end;
end;

procedure TDMGeneraArchivos.Depura_Tablas;
var
  FDMDepuracion: TDMDepuracion;
begin
  try
    SetMensajeProgreso('Depurando Tablas Históricas de GEMA........');
    FDMDepuracion := TDMDepuracion.create(Self, FRegistroDistribucion);
    FDMDepuracion.Free;
  except
    Application.MessageBox(PChar('PROBLEMAS PARA REALIZAR LA DEPURACION DE HISTORICOS DE GEMA.'
      + #10 + #13 + 'DE TODAS FORMAS LOS ARCHIVOS HAN SIDO GENERADOS NORMALMENTE'),
      PChar('Gema - Generación de Archivos'),
      MB_ICONINFORMATION);
  end;

end;

procedure TDMGeneraArchivos.Inicializar_Secuencias;
begin
// Inicializa nro de secuencia a partir de la clave de secuencias
  SPIniSecuencia.Parameters.Refresh;
  SPIniSecuencia.Parameters.ParamByName('Empresa').Value := FRegistroDistribucion.Cod_Cia;
  SPIniSecuencia.Parameters.ParamByName('Nroproceso').Value := FRegistroDistribucion.Nro_Proceso;
  SPIniSecuencia.Parameters.ParamByName('ClaveSecuencia').Value := QryDistribuciones_DetalleCLAVE_SECUENCIA.Value;
  SPIniSecuencia.Parameters.ParamByName('Incrementa_Secuencia').Value := QryDistribuciones_DetalleINCREMENTA_SECUENCIA.Value;
  SPIniSecuencia.Parameters.ParamByName('FhProceso').Value := FRegistroDistribucion.FMaxFh_Proceso_Actual;  
  SPIniSecuencia.ExecProc;
end;

procedure TDMGeneraArchivos.Obtener_Estructuras_XBase;
begin
  QryXBase.Close;
  QryXBase.Parameters.ParamByName('pCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
  QryXBase.Parameters.ParamByName('pNro_Proceso').Value := FRegistroDistribucion.Nro_Proceso;
  QryXBase.Parameters.ParamByName('pTipo_Archivo').Value := QryDistribuciones_DisenoCOD_TIPO_ARCHIVO.Value;
  QryXBase.Parameters.ParamByName('pDiseno').Value := QryDistribuciones_DisenoCOD_DISENO.Value;
  QryXBase.Parameters.ParamByName('pNro_Orden').Value := QryDistribuciones_DetalleNRO_ORDEN.Value;
  QryXBase.Open;
  if QryXBase.RecordCount < 1 then
    raise Exception.Create(' FALTA DEFINIR LA ESTRUCTURA DEL ARCHIVO DBF DE SALIDA ');

end;

procedure TDMGeneraArchivos.Almacenar_Fecha_GireCtrl(var i: Integer);
var
  j: Integer;
  lAgrego: Boolean;
begin
  { Almaceno un vector TDate con las distintas Fechas de Proceso de la GireCtrl
    siempre que la fecha de proceso no exista en ESTADOS }
  if i = 1 then
  begin
    SetLength(AFechasProceso, 1);
    AFechasProceso[i - 1] := TblGireCtrl.FieldByName('FH_PROC_S').Value;
    i := i + 1
  end
  else
  begin
    lAgrego := True;
    for j := 0 to Length(AFechasProceso) - 1 do
      if AFechasProceso[j] = TblGireCtrl.FieldByName('FH_PROC_S').Value then
        lAgrego := False;
    if lAgrego then
    begin
      SetLength(AFechasProceso, i);
      AFechasProceso[i - 1] := TblGireCtrl.FieldByName('FH_PROC_S').Value;
      i := i + 1;
    end;
  end;
end;

procedure TDMGeneraArchivos.Asignar_Indice_GireCtrl;
begin
  FIndice := StrTran(TblGireCtrl.TableName, '.DBF', '.NTX');
  TblGireCtrl.Index(FIndice, 'STR(COD_CIA)+STR(COD_PROCES)+STR(NRO_PROCES)+DTOS(FH_PROC_S)', IDX_NONE, False, '');
  TblGireCtrl.IndexOpen(FIndice);

end;

procedure TDMGeneraArchivos.Distribucion_Permitida;
var
  cPathProcesta, cClave, cMensaje: string;
begin
  { Verifica en tabla PROCESTA.DBF si la distribucion puede empezar }
  if FRegistroDistribucion.Existe_Conversion then
   begin
    cPathProcesta := ObtenerPath('TBLPROCESTA');
    tblProcesta.TableName := cPathProcesta + 'PROCESTA.DBF';
    tblProcesta.IndexName := cPathProcesta + 'PROCESTA.NTX';
    tblProcesta.Open;
    tblProccont.TableName := cPathProcesta + 'PROCCONT.DBF';
    tblProccont.IndexName := cPathProcesta + 'PROCCONT.NTX';
    tblProccont.Open;

    if not tblProccont.Seek(FDISEMP) then
     begin
      tblProcesta.Close;
      tblProccont.Close;
      raise Exception.Create('PROCESO ' + FDISEMP + ' NO DEFINIDO EN TABLA PROCCONT');
     end;

    while (not tblProccont.Eof) and (tblProccont.FieldByName('SISTEMA1').Value = FDISEMP) do
     begin
      cClave := Padl(IntToStr(FRegistroDistribucion.Cod_Cia), 3, ' ') + tblProccont.FieldByName('SISTEMA2').Value;
      if tblProcesta.Seek(cClave) then
        if tblProcesta.FieldByName('CONTADOR').Value > 0 then
         begin
          cMensaje := 'Empresa : ' + FRegistroDistribucion.RazonSocial + #10 + #13 +
                      'Proceso : ' + FRegistroDistribucion.DescProceso + #10 + #13 +
                      'Acceso bloqueado!! - Se está ejecutando el proceso ' + tblProccont.FieldByName('SISTEMA2').Value + #10 + #13 +
                      'por el usuario ' + tblProcesta.FieldByName('USUARIO').Value + #10 + #13 +
                      'NO PUEDE CONTINUAR CON LA GENERACION DE ARCHIVOS';
          tblProcesta.Close;
          tblProccont.Close;
          raise Exception.Create(cMensaje);
         end;
      tblProccont.Skip(1);
    end;
  end;
 tblProccont.Close;
end;

procedure TDMGeneraArchivos.Finalizar_Procesta;
var
  cClave: string;
begin
  { Marca en 0 campo contador }
  if FRegistroDistribucion.Existe_Conversion then
   begin
    try
      cClave := Padl(IntToStr(FRegistroDistribucion.Cod_Cia), 3, ' ') + FDISEMP;
      if tblProcesta.Seek(cClave) then
       begin
        if tblProcesta.RLock(tblProcesta.RecNo) then
         begin
          tblProcesta.Edit;
          if tblProcesta.FieldByName('CONTADOR').Value = 1 then
           begin
            tblProcesta.FieldByName('USUARIO').Value := '';
            tblProcesta.FieldByName('FECHA').Value := null;
            tblProcesta.FieldByName('HORA').Value := '';
           end;
          tblProcesta.FieldByName('CONTADOR').Value := tblProcesta.FieldByName('CONTADOR').Value - 1;
          tblProcesta.Post;
          tblProcesta.Commit;
         end
        else
          Exception.Create('Problema para actualizar la tabla PROCESTA.DBF. Avise a Sistemas')
       end
      else
        Exception.Create('Problema para actualizar la tabla PROCESTA.DBF. Avise a Sistemas');
    finally
      tblProcesta.Close;
    end;
   end;
end;

procedure TDMGeneraArchivos.Inicializar_Procesta;
var
  cClave,
  cPathProcesta: string;
begin
  { Marca en 1 campo contador }

  if FRegistroDistribucion.Existe_Conversion then
   begin
    cPathProcesta := ObtenerPath('TBLPROCESTA');
    //tblProcesta.TableName := cPathProcesta + 'PROCESTA.DBF';
    //tblProcesta.IndexName := cPathProcesta + 'PROCESTA.NTX';
    //tblProcesta.Open;
    cClave := Padl(IntToStr(FRegistroDistribucion.Cod_Cia), 3, ' ') + FDISEMP;
    if tblProcesta.Seek(cClave) then
     begin
      tblProcesta.Edit;
      if tblProcesta.FieldByName('CONTADOR').Value = 0 then
       begin
        tblProcesta.FieldByName('USUARIO').Value := GemaConexion.NombreUsuario;
        tblProcesta.FieldByName('FECHA').Value := Date;
        tblProcesta.FieldByName('HORA').Value := Time;
       end;
      tblProcesta.FieldByName('CONTADOR').Value := tblProcesta.FieldByName('CONTADOR').Value + 1;
      tblProcesta.Post;
      tblProcesta.Commit;
     end
    else
      Exception.Create('Problema para actualizar la tabla PROCESTA.DBF. Avise a Sistemas');
   end;
end;

procedure TDMGeneraArchivos.Generar_Reporte(ANroReporte: Integer; ANombre: string; AParamRepor, AReempRepor: Variant; ACodDiseno:string);
var
  i: Integer;
begin

  i := 0;
  while (i < Length(FMisFiltros)) and (FMisFiltros[i] <> QryDistribuciones_DetalleCOD_FORMATO.Value) do
    i := i + 1;
  if i = Length(FMisFiltros) then {Por default uso .DOC}
    i := 4;
  FReporteSalidas := FListaClaseRepoSalidas[ANroReporte].Create(Self, ANombre, '', FRegistroDistribucion, AParamRepor, AReempRepor);

  try


      if ((FReporteSalidas.qryBase.RecordCount > 0)) or
          (Genero_Archivo_Nulo(FRegistroDistribucion.Cod_Cia,FRegistroDistribucion.Nro_Proceso,ACodDiseno)) then
      begin
        Insertar_En_Resumenes(ANombre, FReporteSalidas.CantReg, FReporteSalidas.CantMovim, 0, FReporteSalidas.Importe);
        FExportFilter := FListaExportFilter[i].Create(ANombre);
        FReporteSalidas.ExportToFilter(FExportFilter);
        FExportFilter.Free;
      end;
  finally
//    FReporteSalidas.preview;
    FReporteSalidas.Free;
  end;
end;


procedure TDMGeneraArchivos.SetListaClaseRepoSalidas;
begin
 { Lista con todas las clases de Reportes de Salida (TRepoSalidaeeexxx....)}
  SetLength(FListaClaseRepoSalidas, 33);
  FListaClaseRepoSalidas[0]  := TRepoSalida073Banco;
  FListaClaseRepoSalidas[1]  := TRepoSalida073BancoSucursal;
  FListaClaseRepoSalidas[2]  := TRepoSalida064BancoSucursal;
  { La clase TRepoMailAEmpresa se debe utilizar para cada archivo adjunto
    del mail que el umbral-out envia a la empresa }
  FListaClaseRepoSalidas[3]  := TRepoMailAEmpresa;
  FListaClaseRepoSalidas[4]  := TRepoSalida017Reversiones;
  FListaClaseRepoSalidas[5]  := TRepoSalida064BcoSuc;
  FListaClaseRepoSalidas[6]  := TRepoSalida064SucCableBco;
  FListaClaseRepoSalidas[7]  := TRepoSalida508Cobranzas;
  FListaClaseRepoSalidas[8]  := TReposalida003ATISxMoneda;
  FListaClaseRepoSalidas[9]  := TRepoSalida056Contracargos;
  FListaClaseRepoSalidas[10] := TRepoSalida017Contracargos;
  FListaClaseRepoSalidas[11] := TRepoSalida008AltasBajas;
  FListaClaseRepoSalidas[12] := TRepoSalida003TasaPorEntidad;
  FListaClaseRepoSalidas[13] := TRepoSalida018EntSucCable;
  FListaClaseRepoSalidas[14] := TRepoSalida018EntSucCableDebito;
  FListaClaseRepoSalidas[15] := TRepoSalida017Cobranzas;
  FListaClaseRepoSalidas[16] := TRepoSalida544Cobranzas;
  FListaClaseRepoSalidas[17] := TRepoSalida041Cobranzas;
  FListaClaseRepoSalidas[18] := TRepoSalida008SAP;
  FListaClaseRepoSalidas[19] := TRepoMailAEmpresaXArchivoSur;
  FListaClaseRepoSalidas[20] := TRepoMailAEmpresaXArchivoSurT;
  FListaClaseRepoSalidas[21] := TRepoMailAEmpresaXArchivoSurD;
  FListaClaseRepoSalidas[22] := TRepoSalida057Cobranzas;
  FListaClaseRepoSalidas[23] := TRepoSalida057ContabilizacionPagos;
  FListaClaseRepoSalidas[24] := TRepoResumenPagos603;
  FListaClaseRepoSalidas[25] := TRepoResumenPagos603Edenor;
  FListaClaseRepoSalidas[26] := TRepoSalida1379Cobranzas;
  FListaClaseRepoSalidas[27] := TRepoSalida1379ContabilizacionPagos;
  FListaClaseRepoSalidas[28] := TRepoSalida102SAP;
  FListaClaseRepoSalidas[29] := TRepoSalidaControl;
  FListaClaseRepoSalidas[30] := TRepoSalida011Cobranzas;
  FListaClaseRepoSalidas[31] := TRepoSalida102NovRech;
  //LABL GEMA-266
  FListaClaseRepoSalidas[32] := TRepoSalida244CcgCupones;
end;

procedure TDMGeneraArchivos.SetListaAbstractExportFilter;
begin
  SetLength(FListaExportFilter, 6);
  FListaExportFilter[0] := TQRAsciiExportFilter;
  FListaExportFilter[1] := TQRCommaSeparatedFilter;
  FListaExportFilter[2] := TQRHTMLDocumentFilter;
  FListaExportFilter[3] := TQRXLSFilter;
  FListaExportFilter[4] := TQRRTFExportFilter;
  FListaExportFilter[5] := TQRPDFDocumentFilter;
end;

procedure TDMGeneraArchivos.SetMisFiltros;
begin
  FMisFiltros[0] := 'TXT';
  FMisFiltros[1] := 'CSV';
  FMisFiltros[2] := 'HTM';
  FMisFiltros[3] := 'XLS';
  FMisFiltros[4] := 'DOC';
  FMisFiltros[5] := 'PDF';
end;

procedure TDMGeneraArchivos.Insertar_En_Resumenes(ANombre_Archivo: string;
  ARegis, AMovim, ALotes: Integer; AImporte: Double);
begin

  while Pos('\', ANombre_Archivo) > 0 do
    ANombre_Archivo := SubStr(ANombre_Archivo, Pos('\', ANombre_Archivo) + 1);

  QryIns_Resumenes.Close;
  QryIns_Resumenes.Parameters.ParamByName('pCod_Cia').Value
    := FRegistroDistribucion.Cod_Cia;
  QryIns_Resumenes.Parameters.ParamByName('pNro_Proceso').Value
    := FRegistroDistribucion.Nro_Proceso;
  QryIns_Resumenes.Parameters.ParamByName('pTipo_Archivo').Value
    := QryDistribuciones_DetalleCOD_TIPO_ARCHIVO.Value;
  QryIns_Resumenes.Parameters.ParamByName('pDiseno').Value
    := QryDistribuciones_DetalleCOD_DISENO.Value;
  QryIns_Resumenes.Parameters.ParamByName('pNro_Orden').Value
    := QryDistribuciones_DetalleNRO_ORDEN.Value;
  QryIns_Resumenes.Parameters.ParamByName('pFh_Distribucion').Value
    := FRegistroDistribucion.Fh_Distribucion;
  QryIns_Resumenes.Parameters.ParamByName('pNro_Corrida').Value
    := FUltimo_Nro_Corrida;
  QryIns_Resumenes.Parameters.ParamByName('pNombre_Archivo').Value
    := ANombre_Archivo;
  QryIns_Resumenes.Parameters.ParamByName('pCantidad_Registros').Value
    := ARegis;
  QryIns_Resumenes.Parameters.ParamByName('pCantidad_Movimientos').Value
    := AMovim;
  QryIns_Resumenes.Parameters.ParamByName('pCantidad_Lotes').Value
    := ALotes;
  QryIns_Resumenes.Parameters.ParamByName('pImporte').Value
      := AImporte;
  QryIns_Resumenes.Parameters.ParamByName('pFh_Proceso').Value
    := FRegistroDistribucion.FMaxFh_Proceso_Actual;
  QryIns_Resumenes.Parameters.ParamByName('pNro_Proceso_GEMA').Value
    := FRegistroDistribucion.Nro_Proceso_AU;
  QryIns_Resumenes.ExecSQL;

end;

procedure TDMGeneraArchivos.Actualizar_Secuencias;
begin
// Actualiza nro de secuencia
  SPActSecuencia.Parameters.Refresh;
  SPActSecuencia.Parameters.ParamByName('Empresa').Value := FRegistroDistribucion.Cod_Cia;
  SPActSecuencia.Parameters.ParamByName('Nroproceso').Value := FRegistroDistribucion.Nro_Proceso;
  SPActSecuencia.Parameters.ParamByName('ClaveSecuencia').Value := QryDistribuciones_DetalleCLAVE_SECUENCIA.Value;
  SPActSecuencia.ExecProc;
end;

procedure TDMGeneraArchivos.Inicializar_Variables_Secuencias;
begin
// Inicializa nro de secuencia de variables de paquete
  SPIniVbleSecuencia.ExecProc;

end;

procedure TDMGeneraArchivos.AdoGeneraArchivoGemaInformaTotales(
  Valor: Integer);
begin
  inherited;
  FrmProgreso.PBGeneraFiles.MaxValue := Valor;
end;

procedure TDMGeneraArchivos.AdoGeneraArchivoGemaInformaRegistro(
  Valor: Integer);
begin
  inherited;
  FrmProgreso.PBGeneraFiles.Progress := Valor;
  if Valor mod 1000 = 0 then
    Application.ProcessMessages;
end;


function TDMGeneraArchivos.FH_PROCESO: Variant;
begin
  Result := DateToStr(FRegistroDistribucion.FMaxFh_Proceso_Actual);
end;

function TDMGeneraArchivos.PARAMETRO_INTERNO: Variant;
begin
  Result := AdoGeneraArchivoGema.PARAMETRO_INTERNO;
end;

procedure TDMGeneraArchivos.Crear_Tabla_XBase(cNombre: string);
var
  TblSalidaDBF: TApolloTable;
begin
  TblSalidaDBF := TApolloTable.Create(Self);
  try
    TblSalidaDBF.CreateNew(FRegistroDistribucion.Path_Work + 'tbltempo.dbf', SDENTX, QryXBase.RecordCount);
    while not QryXBase.Eof do
    begin
      TblSalidaDBF.CreateField(QryXBase.FieldByName('NOMBRE_CAMPO').Value,
        QryXBase.FieldByName('CAMPO_TIPO').Value,
        QryXBase.FieldByName('LONGITUD_CAMPO').Value,
        QryXBase.FieldByName('DECIMALES_CAMPO').Value);
      QryXBase.Next;
    end;
    if not TblSalidaDBF.CreateExec then
      raise Exception.Create('Problema para crear la tabla de salida. Avise a Sistemas');
    TblSalidaDBF.TableName := FRegistroDistribucion.Path_Work + 'tbltempo.dbf';
    TblSalidaDBF.Exclusive := True;
    TblSalidaDBF.Open;
    TblSalidaDBF.CloseIndexes;
    if not TblSalidaDBF.AppendFrom(FRegistroDistribucion.Path_Work + '\' + cNombre, COMMA_DELIM, '') then
      raise Exception.Create('Problema para agregar registros a la tabla de salida. Avise a Sistemas');
    TblSalidaDBF.Commit;
    TblSalidaDBF.Close;
    BorrarArchivo(FRegistroDistribucion.Path_Work + cNombre);
    RenameFile(FRegistroDistribucion.Path_Work + 'tbltempo.dbf', FRegistroDistribucion.Path_Work + cNombre);
  finally
    TblSalidaDBF.Free;
  end;
end;

procedure TDMGeneraArchivos.AntesDeApendearDetalle(var Registro: string;
  var Appendea: Boolean);
begin
  if (AdoGeneraArchivoGema.FinDeLinea) and (Length(Registro) > 2) then
    Appendea := True
  else
    if (not AdoGeneraArchivoGema.FinDeLinea) and (Length(Registro) > 0) then
      Appendea := True
    else
      Appendea := False;

end;

function TDMGeneraArchivos.CODIGO_CIA: Variant;
begin
  Result := FRegistroDistribucion.Cod_Cia;
end;

function TDMGeneraArchivos.MASCARA_ARCHIVO: Variant;
begin
  Result := Trim(QryDistribuciones_Detalle.FieldByName('NOMBRE_ARCHIVO').Value);
end;

function TDMGeneraArchivos.PATH_WORK: Variant;
begin
  Result := FRegistroDistribucion.Path_Work;
end;

function TDMGeneraArchivos.FH_DISTRI: Variant;
begin
  Result := DateToStr(FRegistroDistribucion.Fh_Distribucion);
end;

function TDMGeneraArchivos.NRO_CORRIDA: Variant;
begin
  Result := FRegistroDistribucion.Nro_Corrida;
end;

function TDMGeneraArchivos.NRO_PROCESO: Variant;
begin
  Result := IfThen(FRegistroDistribucion.Nro_Proceso_AU <> 0, FRegistroDistribucion.Nro_Proceso_AU, FRegistroDistribucion.Nro_Proceso);
end;

function TDMGeneraArchivos.NRO_LOTE: Variant;
begin
  Result := IfThen( FRegistroDistribucion.Lote_AU <> '0', FRegistroDistribucion.Lote_AU, '0' );
end;

function TDMGeneraArchivos.DIA_HABIL: Variant;
begin
 {Próximo día hábil}
  try
    if Length(AFechasProceso) = 0 then
    begin
      SetLength(AFechasProceso, 1);
      SPDiaHabil.Parameters.ParamByName('dFecha_original').Value := FRegistroDistribucion.Fh_Proceso_Ultima;
      SPDiaHabil.Parameters.ParamByName('nCantidad_Dias').Value := 1;
      SPDiaHabil.ExecProc;
      AFechasProceso[0] := SPDiaHabil.Parameters.ParamByName('RETURN_VALUE').Value;

      if AFechasProceso[0] > FRegistroDistribucion.Fh_Proceso then
        raise Exception.Create('( ESTA INTENTANDO GENERAR ARCHIVOS NULOS POSTERIORES A LA FECHA SOLICITADA )');
    end
    else
    begin
      SPDiaHabil.Parameters.ParamByName('dFecha_original').Value := FRegistroDistribucion.Fh_Proceso_Ultima;
      SPDiaHabil.Parameters.ParamByName('nCantidad_Dias').Value := 1;
      SPDiaHabil.ExecProc;
      Fh_proceso_Ctrl := SPDiaHabil.Parameters.ParamByName('RETURN_VALUE').Value;

      if Fh_proceso_Ctrl < AFechasProceso[0] then
        raise Exception.Create('( EJECUTE EL PROCESO CON FECHA ' + DateToStr(Fh_proceso_Ctrl) + '. EXISTEN FECHAS DE PROCESO FALTANTES');
      if ((FRegistroDistribucion.Fh_Proceso_Ultima >= AFechasProceso[0]) and (FRegistroDistribucion.Cod_Modo <> 1)) then
        raise Exception.Create('( FECHA DE PROCESO ACTUAL (' + DateToStr(AFechasProceso[0]) + ')' + ' MENOR O IGUAL A LA DE LA ULTIMA DISTRIBUCION (' + DateToStr(FRegistroDistribucion.Fh_Proceso_Ultima) + '))');
    end;

    Result := '';
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TDMGeneraArchivos.DIA_HABIL_CIA: Variant;
begin
 {Próximo día hábil por empresa}
  try
    if Length(AFechasProceso) = 0 then
    begin
      SetLength(AFechasProceso, 1);
      SPDiaHabilCia.Parameters.ParamByName('dFecha_original').Value := FRegistroDistribucion.Fh_Proceso_Ultima;
      SPDiaHabilCia.Parameters.ParamByName('nCantidad_Dias').Value := 1;
      SPDiaHabilCia.Parameters.ParamByName('nCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
      SPDiaHabilCia.Parameters.ParamByName('nDiaDeSemana').Value := FRegistroDistribucion.Parametro_Dia_habil;
      SPDiaHabilCia.ExecProc;
      AFechasProceso[0] := SPDiaHabilCia.Parameters.ParamByName('RETURN_VALUE').Value;

      if AFechasProceso[0] > FRegistroDistribucion.Fh_Proceso then
        raise Exception.Create('( ESTA INTENTANDO GENERAR ARCHIVOS NULOS POSTERIORES A LA FECHA SOLICITADA )');
    end
    else
    begin
      SPDiaHabilCia.Parameters.ParamByName('dFecha_original').Value := FRegistroDistribucion.Fh_Proceso_Ultima;
      SPDiaHabilCia.Parameters.ParamByName('nCantidad_Dias').Value := 1;
      SPDiaHabilCia.Parameters.ParamByName('nCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
      SPDiaHabilCia.Parameters.ParamByName('nDiaDeSemana').Value := FRegistroDistribucion.Parametro_Dia_habil;
      SPDiaHabilCia.ExecProc;
      Fh_proceso_Ctrl := SPDiaHabilCia.Parameters.ParamByName('RETURN_VALUE').Value;

      if Fh_proceso_Ctrl < AFechasProceso[0] then
        raise Exception.Create('( EJECUTE EL PROCESO CON FECHA ' + DateToStr(Fh_proceso_Ctrl) + '. EXISTEN FECHAS DE PROCESO FALTANTES');
      if FRegistroDistribucion.Fh_Proceso_Ultima >= AFechasProceso[0] then
        raise Exception.Create('( FECHA DE PROCESO ACTUAL (' + DateToStr(AFechasProceso[0]) + ')' + ' MENOR O IGUAL A LA DE LA ULTIMA DISTRIBUCION (' + DateToStr(FRegistroDistribucion.Fh_Proceso_Ultima) + '))');
    end;

    Result := '';
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TDMGeneraArchivos.SIEMPRE_DIA_HABIL: Variant;
begin
 {Próximo día hábil por empresa}
  try
    if Length(AFechasProceso) = 0 then
      begin
        SetLength(AFechasProceso, 1);
        SPSiempreDiaHabil.Parameters.ParamByName('dFecha_original').Value := FRegistroDistribucion.Fh_Proceso_Ultima;
        SPSiempreDiaHabil.Parameters.ParamByName('nCantidad_Dias').Value := 1;
        SPSiempreDiaHabil.Parameters.ParamByName('nCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
        SPSiempreDiaHabil.Parameters.ParamByName('nDiaDeSemana').Value := FRegistroDistribucion.Parametro_Dia_habil;
        SPSiempreDiaHabil.ExecProc;
       
        AFechasProceso[0] := SPSiempreDiaHabil.Parameters.ParamByName('RETURN_VALUE').Value;
   
        if AFechasProceso[0] > FRegistroDistribucion.Fh_Proceso then
          raise Exception.Create('( ESTA INTENTANDO GENERAR ARCHIVOS NULOS POSTERIORES A LA FECHA SOLICITADA )');

        if (FRegistroDistribucion.Parametro_Dia_habil = 3) then
        begin
          if (AFechasProceso[0] <> FRegistroDistribucion.Fh_Proceso) then
            raise Exception.Create('( ESTA INTENTANDO GENERAR ARCHIVOS EN UNA FECHA INCORRECTA )');
        end;
      end
    else
      begin
        SPSiempreDiaHabil.Parameters.ParamByName('dFecha_original').Value := FRegistroDistribucion.Fh_Proceso_Ultima;
        SPSiempreDiaHabil.Parameters.ParamByName('nCantidad_Dias').Value := 1;
        SPSiempreDiaHabil.Parameters.ParamByName('nCod_Cia').Value := FRegistroDistribucion.Cod_Cia;
        SPSiempreDiaHabil.Parameters.ParamByName('nDiaDeSemana').Value := FRegistroDistribucion.Parametro_Dia_habil;
        SPSiempreDiaHabil.ExecProc;

        Fh_proceso_Ctrl := SPSiempreDiaHabil.Parameters.ParamByName('RETURN_VALUE').Value;

        if Fh_proceso_Ctrl < AFechasProceso[0] then
          raise Exception.Create('( EJECUTE EL PROCESO CON FECHA ' + DateToStr(Fh_proceso_Ctrl) + '. EXISTEN FECHAS DE PROCESO FALTANTES');

        if FRegistroDistribucion.Fh_Proceso_Ultima >= AFechasProceso[0] then
          raise Exception.Create('( FECHA DE PROCESO ACTUAL (' + DateToStr(AFechasProceso[0]) + ')' + ' MENOR O IGUAL A LA DE LA ULTIMA DISTRIBUCION (' + DateToStr(FRegistroDistribucion.Fh_Proceso_Ultima) + '))');
  
        if (FRegistroDistribucion.Parametro_Dia_habil = 3) then
        begin
          if (Fh_proceso_Ctrl <> FRegistroDistribucion.Fh_Proceso) then
            raise Exception.Create('( ESTA INTENTANDO GENERAR ARCHIVOS EN UNA FECHA INCORRECTA )');
        end;

      end;

    Result := '';
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TDMGeneraArchivos.ProcArchivosProcesarArchivo(ANombreArchivo: TFileName);
var
 Archivo : TextFile;
 Linea   : String;
begin
  AssignFile(Archivo, ProcArchivos.Path + ANombreArchivo);
  Reset(Archivo);
  Readln(Archivo, Linea);
  Readln(Archivo, Linea);
  CloseFile(Archivo);
  Tabla_Reporte.Append;
  Tabla_Reporte.FieldByName('Nombre_Archivo').AsString := ANombreArchivo;
  Tabla_Reporte.FieldByName('Cantidad_Aceptados').AsInteger   := StrToInt(getDato(Linea,'pagosCantidad'));
  Tabla_Reporte.FieldByName('Cantidad_Rechazados').AsInteger  := StrToInt(getDato(Linea,'rechazosDebDirCantidad'));
  Tabla_Reporte.FieldByName('Cantidad_Reversiones').AsInteger := StrToInt(getDato(Linea,'anulacionesCantidad'));
  Tabla_Reporte.FieldByName('Importe_Aceptados').AsFloat      := StrToFloat(getDato(Linea,'pagosImporte'));
  Tabla_Reporte.FieldByName('Importe_Rechazados').AsFloat     := StrToFloat(getDato(Linea,'rechazosDebDirImporte'));
  Tabla_Reporte.FieldByName('Importe_Reversiones').AsFloat    := StrToFloat(getDato(Linea,'anulacionesImporte'));
  Tabla_Reporte.Post;
end;

function TDMGeneraArchivos.getDato(ARegistro, ACampo: String) :String;
Var
Cadena, Dato : String;
Posicion_inicial, i : Integer;

begin
  Dato := '';
  Cadena := ACampo+'="';
  Posicion_inicial := pos(Cadena,ARegistro);
  If (Posicion_inicial > 0) then
  begin
    i:= Posicion_inicial + Length(Cadena) ;
    While ((Aregistro[i] <> '"') and (i < Length(ARegistro)))  do
    begin
     Dato := Dato + Aregistro[i];
     inc(i);
    end;
  end
  Else
     Dato := '0';
  Result := Dato;
end;

procedure TDMGeneraArchivos.Imprimir_Resumen_100;
var
  FReporteDistribucion: TRepoSalida100Cobranzas;
begin
  if not FRegistroDistribucion.Es_AU then
     try
       FReporteDistribucion := TRepoSalida100Cobranzas.Create(Self, FRegistroDistribucion, FUltimo_Nro_Corrida, 'ORIGINAL', Tabla_Reporte);
       ProcArchivos.Path := FRegistroDistribucion.Path_Work;
       ProcArchivos.Procesar;
//       FReporteDistribucion.preview;
       FReporteDistribucion.Print;
     finally
       FReporteDistribucion.Free;
     end;
end;

procedure TDMGeneraArchivos.LogProceso(Msj: string);
begin
  FRegistroDistribucion.Log_Proceso := FRegistroDistribucion.Log_Proceso +'Proc    >> ' + TimeToStr(Time) + ' - '+ Msj +  #13#10;
end;

procedure TDMGeneraArchivos.MarcoInicioFinProceso(sEstado: String);
begin
  try
    with SPMarcarTiempoProceso do
    begin
      Parameters[0].value := FRegistroDistribucion.Cod_Cia;;
      Parameters[1].value := FRegistroDistribucion.Nro_Proceso;
      Parameters[2].value := sEstado;
      ExecProc;
    end;
  except
  end;
end;

function TDMGeneraArchivos.Genero_Archivo_Nulo(pCodCia, pNroProc :integer; pCodDiseno:string): Boolean;
begin
  qryArchivosNulos.Close;
  qryArchivosNulos.Parameters.ParamByName('pCod_Cia').Value := pCodCia;
  qryArchivosNulos.Parameters.ParamByName('pNro_Proceso').Value := pNroProc;
  qryArchivosNulos.Parameters.ParamByName('pCod_Diseno').Value := pCodDiseno;
  qryArchivosNulos.Open;

	if qryArchivosNulos.RecordCount > 0 then
		Result := (qryArchivosNulos.fieldByName('NULO').asInteger = 1)
  else
		Result := False;

end;


procedure TDMGeneraArchivos.AdoGeneraArchivoGemaCreandoTemporal;
begin
  inherited;
  if FRegistroDistribucion.Es_AU then
   begin
    FRegistroDistribucion.ValueTMP := FrmProgreso.PBGeneraFiles.MaxValue;
    FrmProgreso.PBGeneraFiles.MaxValue := 4;
    SetMensajeProgreso('Creando temporal auxiliar para el diseño...'  );
    FrmProgreso.PBGeneraFiles.Progress := 0;
    Application.ProcessMessages;
   end;
end;

procedure TDMGeneraArchivos.AdoGeneraArchivoGemaTemporalCreado;
begin
  inherited;
  if FRegistroDistribucion.Es_AU then
   begin
     FrmProgreso.PBGeneraFiles.Progress := 4;
     SetMensajeProgreso('Aplicando diseño a los datos...'  );
     Application.ProcessMessages;
     FrmProgreso.PBGeneraFiles.MaxValue :=  FRegistroDistribucion.ValueTMP ;
   end
end;

procedure TDMGeneraArchivos.AdoGeneraArchivoGemaPasoDos;
begin
  inherited;
  if FRegistroDistribucion.Es_AU then
   begin
     FrmProgreso.PBGeneraFiles.Progress := 2;
     Application.ProcessMessages;
   end;
end;

procedure TDMGeneraArchivos.AdoGeneraArchivoGemaPasoTres;
begin
  inherited;
  if FRegistroDistribucion.Es_AU then
   begin
     FrmProgreso.PBGeneraFiles.Progress := 3;
     Application.ProcessMessages;
   end;
end;

function TDMGeneraArchivos.Existe_Columna_EnTabla(pColumna,
  pTabla: String): Boolean;
var
  qryTemp: TADOQuery;
begin
  result := False;
  qryTemp:= TADOQuery.create(Self);
  try
    qryTemp.Connection := GemaConexion.ADOConec;
    qryTemp.SQL.Text := 'select  case count(*) when 0 then 0 else 1 end as EXISTE '+
                        'from  all_tab_columns '+
                        'where  table_name = :p1 '+
                        '        and column_name = :p2';
    qryTemp.Parameters.ParamByName('p1').Value := pTabla;
    qryTemp.Parameters.ParamByName('p2').Value := pColumna;
    qryTemp.open;
    result := qryTemp.FieldByName('EXISTE').AsInteger = 1 ;
  finally
    qryTemp.Free;
  end;

end;

end.

