inherited DMGeneraArchivos: TDMGeneraArchivos
  OldCreateOrder = True
  Left = 372
  Top = 102
  Height = 561
  Width = 711
  inherited QryGirePath: TADOQuery
    Left = 43
    Top = 16
  end
  inherited Entorno: TApolloEnv
    Top = 17
  end
  inherited DBDisemp: TApolloDatabase
    Top = 76
  end
  inherited TblCaminos: TApolloTable
    Top = 124
  end
  inherited TblGireCtrl: TApolloTable
    Left = 138
    Top = 172
  end
  inherited SPRBSGrande: TADOStoredProc
    Left = 583
    Top = 72
  end
  object AdoGeneraArchivoGema: TAdoGeneraArchivo
    CodigoSistema = 5
    Conexion = GemaConexion.ADOConec
    EvaluadorExpre = MacroEvalGema
    OnInformaRegistro = AdoGeneraArchivoGemaInformaRegistro
    OnInformaTotales = AdoGeneraArchivoGemaInformaTotales
    OnExisteArchivo = AdoGeneraArchivoGemaExisteArchivo
    OnCreandoTemporal = AdoGeneraArchivoGemaCreandoTemporal
    OnPasoDos = AdoGeneraArchivoGemaPasoDos
    OnPasoTres = AdoGeneraArchivoGemaPasoTres
    OnTemporalCreado = AdoGeneraArchivoGemaTemporalCreado
    Left = 43
    Top = 120
  end
  object MacroEvalGema: TClipperMacroExpr
    DecimalSep = dsPoint
    Left = 42
    Top = 72
  end
  object QryDistribuciones_Parametro: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Orden'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pCod_Sql'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'from GEMA.DISTRIBUCIONES_PARAMETRO'
      'where COD_CIA = :pCod_Cia and'
      '       NRO_PROCESO = :pNro_Proceso and'
      '        COD_TIPO_ARCHIVO = :pTipo_Archivo and'
      '         COD_DISENO = :pDiseno and'
      '          NRO_ORDEN = :pNro_Orden and'
      '           COD_SQL = :pCod_Sql'
      'order by COD_CIA,'
      '         NRO_PROCESO,'
      '         COD_TIPO_ARCHIVO,'
      '         COD_DISENO,'
      '         NRO_ORDEN,'
      '         COD_SQL,'
      '         NRO_PARAMETRO'
      ''
      ' ')
    Left = 255
    Top = 276
    object QryDistribuciones_ParametroCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryDistribuciones_ParametroNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryDistribuciones_ParametroCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryDistribuciones_ParametroCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Size = 10
    end
    object QryDistribuciones_ParametroNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object QryDistribuciones_ParametroCOD_SQL: TStringField
      FieldName = 'COD_SQL'
      Size = 4
    end
    object QryDistribuciones_ParametroNRO_PARAMETRO: TIntegerField
      FieldName = 'NRO_PARAMETRO'
    end
    object QryDistribuciones_ParametroPROCEDENCIA_PARAMETRO: TStringField
      FieldName = 'PROCEDENCIA_PARAMETRO'
      Size = 2
    end
    object QryDistribuciones_ParametroVALOR_PARAMETRO: TStringField
      FieldName = 'VALOR_PARAMETRO'
      Size = 200
    end
  end
  object QryDistribuciones_Detalle: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select A.*,'
      '          B.DESCRIPCION'
      'from GEMA.DISTRIBUCIONES_DETALLE A,'
      '       GIRE.DISENOS B'
      'where A.COD_DISENO = B.COD_DISENO and'
      '          A.COD_CIA = :pCod_Cia and'
      '          A.NRO_PROCESO = :pNro_Proceso and'
      '          A.COD_TIPO_ARCHIVO = :pTipo_Archivo and'
      '          A.COD_DISENO = :pDiseno and'
      '          A.HABILITADO = 1'
      'order by A.COD_CIA,'
      '         A.NRO_PROCESO,'
      '         A.COD_TIPO_ARCHIVO,'
      '         A.COD_DISENO,'
      '         A.NRO_ORDEN')
    Left = 231
    Top = 72
    object QryDistribuciones_DetalleCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryDistribuciones_DetalleNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryDistribuciones_DetalleCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryDistribuciones_DetalleCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Size = 10
    end
    object QryDistribuciones_DetalleNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object QryDistribuciones_DetalleHABILITADO: TIntegerField
      FieldName = 'HABILITADO'
    end
    object QryDistribuciones_DetalleNOMBRE_ARCHIVO: TStringField
      FieldName = 'NOMBRE_ARCHIVO'
      Size = 100
    end
    object QryDistribuciones_DetalleCOD_FORMATO: TStringField
      FieldName = 'COD_FORMATO'
      Size = 3
    end
    object QryDistribuciones_DetallePATH_SALIDA: TStringField
      FieldName = 'PATH_SALIDA'
      Size = 50
    end
    object QryDistribuciones_DetalleCONDICION_CORTE_ARCHIVO: TStringField
      FieldName = 'CONDICION_CORTE_ARCHIVO'
      Size = 50
    end
    object QryDistribuciones_DetalleUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object QryDistribuciones_DetalleFH_ACTUALIZACION: TDateTimeField
      FieldName = 'FH_ACTUALIZACION'
    end
    object QryDistribuciones_DetalleNULO: TIntegerField
      FieldName = 'NULO'
    end
    object QryDistribuciones_DetalleCOD_TIPO_ARCHIVO_DBF: TStringField
      FieldName = 'COD_TIPO_ARCHIVO_DBF'
      Size = 2
    end
    object QryDistribuciones_DetalleINCLUIR_EN_FACTURA: TIntegerField
      FieldName = 'INCLUIR_EN_FACTURA'
    end
    object QryDistribuciones_DetalleLLEVA_SECUENCIA: TIntegerField
      FieldName = 'LLEVA_SECUENCIA'
    end
    object QryDistribuciones_DetalleCLAVE_SECUENCIA: TStringField
      FieldName = 'CLAVE_SECUENCIA'
      Size = 30
    end
    object QryDistribuciones_DetalleINCREMENTA_SECUENCIA: TIntegerField
      FieldName = 'INCREMENTA_SECUENCIA'
    end
    object QryDistribuciones_DetalleDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object QryDistribuciones_DetalleINFORME_MAIL: TIntegerField
      FieldName = 'INFORME_MAIL'
    end
    object QryDistribuciones_DetalleDESCRIPCION_MAIL: TStringField
      FieldName = 'DESCRIPCION_MAIL'
      Size = 50
    end
    object QryDistribuciones_DetalleADMINISTRA_FINDELINEA: TIntegerField
      FieldName = 'ADMINISTRA_FINDELINEA'
    end
  end
  object QryDistribuciones_Diseno: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select COD_CIA,'
      '       NRO_PROCESO,'
      '       COD_TIPO_ARCHIVO,'
      '       COD_DISENO,'
      '       COD_MODO'
      'from GEMA.DISTRIBUCIONES_DISENO'
      'where COD_CIA = :pCod_Cia and'
      '      NRO_PROCESO = :pNro_Proceso'
      'order by COD_CIA,'
      '         NRO_PROCESO,'
      '         COD_TIPO_ARCHIVO,'
      '         COD_DISENO')
    Left = 231
    Top = 16
    object QryDistribuciones_DisenoCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryDistribuciones_DisenoNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryDistribuciones_DisenoCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryDistribuciones_DisenoCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Size = 10
    end
    object QryDistribuciones_DisenoCOD_MODO: TIntegerField
      FieldName = 'COD_MODO'
    end
  end
  object QryIns_Resumenes: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Orden'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pFh_Distribucion'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Corrida'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNombre_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pCantidad_Registros'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pCantidad_Movimientos'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pCantidad_Lotes'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pImporte'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso_GEMA'
        DataType = ftLargeint
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'INSERT INTO GEMA.RESUMENES '
      '              (COD_CIA,'
      '               NRO_PROCESO,'
      '               COD_TIPO_ARCHIVO,'
      '               COD_DISENO,'
      '               NRO_ORDEN,'
      '               FH_DISTRIBUCION,'
      '               NRO_CORRIDA,'
      '               NOMBRE_ARCHIVO,'
      '               CANTIDAD_REGISTROS,'
      '               CANTIDAD_MOVIMIENTOS,'
      '               CANTIDAD_LOTES,'
      '               IMPORTE,'
      '               FH_PROCESO,'
      '               NRO_PROCESO_GEMA)'
      'VALUES'
      '              (:pCod_Cia, '
      '               :pNro_Proceso,'
      '               :pTipo_Archivo,'
      '               :pDiseno,'
      '               :pNro_Orden,'
      '               :pFh_Distribucion,'
      '               :pNro_Corrida,'
      '               :pNombre_Archivo,'
      '               :pCantidad_Registros,'
      '               :pCantidad_Movimientos,'
      '               :pCantidad_Lotes,'
      '               :pImporte,'
      '               :pFh_Proceso,'
      '               :pNro_Proceso_GEMA)'
      '  ')
    Left = 481
    Top = 137
  end
  object QryUlt_Nro_Corrida: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pFh_Distribucion'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_proceso_gema'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT NVL(NRO_CORRIDA,0) as ULTIMO_NRO_CORRIDA'
      'FROM GEMA.DISTRIBUCIONES_PROCESO'
      'WHERE COD_CIA = :pCod_Cia and'
      '               NRO_PROCESO = :pNro_Proceso and'
      '               FH_DISTRIBUCION = :pFh_Distribucion and'
      '               NRO_PROCESO_GEMA = :pNro_proceso_gema'
      'ORDER BY NRO_CORRIDA DESC'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 37
    Top = 220
    object QryUlt_Nro_CorridaULTIMO_NRO_CORRIDA: TBCDField
      FieldName = 'ULTIMO_NRO_CORRIDA'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
  end
  object QryAct_Fh_Proceso: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update GEMA.DISTRIBUCIONES'
      'set FH_PROCESO_ANTERIOR = FH_PROCESO,'
      '      FH_PROCESO = :pFh_Proceso'
      'where COD_CIA = :pCod_Cia and'
      '             NRO_PROCESO = :pNro_Proceso')
    Left = 231
    Top = 164
  end
  object QrySelecciona_Tablas: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select distinct B.NOMBRE_TABLA_ORA AS TABLA,'
      '                      A.COD_TIPO_ARCHIVO,'
      #9'      A.COD_DISENO'
      'from GEMA.DISTRIBUCIONES_DISENO A,'
      '       GEMA.TIPOS_DE_ARCHIVO B'
      'where A.COD_CIA = :pCod_Cia and'
      '           A.NRO_PROCESO = :pNro_Proceso and'
      '            A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO and'
      
        '            (B.COD_TIPO_ARCHIVO <> '#39'LS'#39' and B.COD_TIPO_ARCHIVO <' +
        '> '#39'ZZ'#39')'#9' ')
    Left = 49
    Top = 276
    object QrySelecciona_TablasTABLA: TStringField
      FieldName = 'TABLA'
      ReadOnly = True
      Size = 30
    end
  end
  object ADOControlProcesoGema: TADOCtrlProcesos
    Conexion = GemaConexion.ADOConec
    ShowErrorMsg = False
    Left = 38
    Top = 169
  end
  object QryInsTotales_Control: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'COD_CIA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'COD_PROCESO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'NRO_PROCESO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'COD_PROCESO_SALIDA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'NRO_PROCESO_SALIDA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FH_PROCESO_SALIDA'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'CANTIDAD_TOTAL'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IMPORTE_TOTAL'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'CANTIDAD_ELIMINADOS'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'IMPORTE_ELIMINADOS'
        DataType = ftFloat
        Size = -1
        Value = Null
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'FH_ACTUALI'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Insert into GIRE.TOTALES_CONTROL('
      '  COD_CIA,'
      '  COD_PROCESO,'
      '  NRO_PROCESO,'
      '  DESCRIPCION,'
      '  COD_PROCESO_SALIDA,'
      '  NRO_PROCESO_SALIDA,'
      '  FH_PROCESO_SALIDA,'
      '  CANTIDAD_TOTAL,'
      '  IMPORTE_TOTAL,'
      '  CANTIDAD_ELIMINADOS,'
      '  IMPORTE_ELIMINADOS,'
      '  USUARIO,'
      '  FH_ACTUALIZACION)'
      'Values('
      '  :COD_CIA,'
      '  :COD_PROCESO,'
      '  :NRO_PROCESO,'
      '  :DESCRIPCION,'
      '  :COD_PROCESO_SALIDA,'
      '  :NRO_PROCESO_SALIDA,'
      '  :FH_PROCESO_SALIDA,'
      '  :CANTIDAD_TOTAL,'
      '  :IMPORTE_TOTAL,'
      '  :CANTIDAD_ELIMINADOS,'
      '  :IMPORTE_ELIMINADOS,'
      '  :USUARIO,'
      '  :FH_ACTUALI)'
      '')
    Left = 481
    Top = 16
  end
  object QryInsEstados: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'COD_CIA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'FH_PROCESO'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'COD_PROCESO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'NRO_PROCESO'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Insert into GIRE.ESTADOS('
      '  EMPRESA,'
      '  FH_PROCESO,'
      '  ESTADO,'
      '  COD_PROCESO,'
      '  NRO_PROCESO)'
      'Values('
      '  :COD_CIA,'
      '  :FH_PROCESO,'
      '  1,'
      '  :COD_PROCESO,'
      '  :NRO_PROCESO)'
      ''
      ' ')
    Left = 481
    Top = 208
  end
  object QryFh_Proceso_Anterior: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select Max(FH_PROCESO) as FH_PROCESO_ANTERIOR'
      'from (Select FH_PROCESO'
      '      from GIRE.ESTADOS'
      '      where EMPRESA = :pCod_Cia and'
      '             COD_PROCESO = 100 and'
      '              NRO_PROCESO = :pNro_Proceso)'
      ''
      ' '
      ' ')
    Left = 231
    Top = 116
    object QryFh_Proceso_AnteriorFH_PROCESO_ANTERIOR: TDateTimeField
      FieldName = 'FH_PROCESO_ANTERIOR'
    end
  end
  object QryTablas_Oracle: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select distinct NOMBRE_TABLA_ORA'
      'from GEMA.DISTRIBUCIONES_DISENO A, '
      '        GEMA.TIPOS_DE_ARCHIVO B'
      'where A.COD_CIA = :pCod_Cia and'
      '           A.NRO_PROCESO  = :pNro_Proceso and'
      '            A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO and'
      
        '             (B.COD_TIPO_ARCHIVO <> '#39'LS'#39' and B.COD_TIPO_ARCHIVO ' +
        '<> '#39'ZZ'#39')'
      '           '
      ' ')
    Left = 371
    Top = 212
    object QryTablas_OracleNOMBRE_TABLA_ORA: TStringField
      FieldName = 'NOMBRE_TABLA_ORA'
      Size = 30
    end
  end
  object QryFh_Proceso_Ora: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <>
    Left = 371
    Top = 164
  end
  object QryDelTotales_Control: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'Cod_Cia'
        Size = -1
        Value = Null
      end
      item
        Name = 'Cod_Proceso'
        Size = -1
        Value = Null
      end
      item
        Name = 'Nro_Proceso'
        Size = -1
        Value = Null
      end
      item
        Name = 'Cod_Proceso_Salida'
        Size = -1
        Value = Null
      end
      item
        Name = 'Nro_Proceso_Salida'
        Size = -1
        Value = Null
      end
      item
        Name = 'Fh_Proceso_Salida'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Delete from GIRE.TOTALES_CONTROL'
      'where COD_CIA = :Cod_Cia and'
      '        COD_PROCESO = :Cod_Proceso and'
      '          NRO_PROCESO = :Nro_Proceso and'
      '            COD_PROCESO_SALIDA = :Cod_Proceso_Salida and'
      '              NRO_PROCESO_SALIDA = :Nro_Proceso_Salida and'
      '                FH_PROCESO_SALIDA = :Fh_Proceso_Salida'
      ''
      ' ')
    Left = 481
    Top = 72
  end
  object QryDelEstados: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'Cod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Cod_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Nro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Fh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Delete from GIRE.ESTADOS'
      'where EMPRESA = :Cod_Cia and'
      '        COD_PROCESO = :Cod_Proceso and'
      '          NRO_PROCESO = :Nro_Proceso and'
      '            FH_PROCESO = :Fh_Proceso'
      ' ')
    Left = 371
    Top = 112
  end
  object QryFh_Proceso: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <>
    Left = 371
    Top = 62
  end
  object QryCiasGema: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select  A.COD_MODO,'
      '        B.DESCRIPCION,'
      '        A.COPIA_A_TRANSMISION,'
      '        A.CALCULO_DIA_HABIL'
      'from  GEMA.CIAS A,'
      '      GEMA.MODOS B'
      'where A.COD_MODO = B.COD_MODO and'
      '        A.COD_CIA = :pCod_Cia      ')
    Left = 371
    Top = 16
    object QryCiasGemaCOD_MODO: TIntegerField
      FieldName = 'COD_MODO'
    end
    object QryCiasGemaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object QryCiasGemaCOPIA_A_TRANSMISION: TStringField
      FieldName = 'COPIA_A_TRANSMISION'
      FixedChar = True
      Size = 1
    end
    object QryCiasGemaCALCULO_DIA_HABIL: TStringField
      FieldName = 'CALCULO_DIA_HABIL'
      Size = 50
    end
  end
  object QryActDistriProcesos: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pFh_Distribucion'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Corrida'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_proceso_gema'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO GEMA.DISTRIBUCIONES_PROCESO'
      '              (COD_CIA,'
      '               NRO_PROCESO,'
      '               FH_DISTRIBUCION,'
      '               NRO_CORRIDA,'
      '               FH_PROCESO,'
      '               NRO_PROCESO_GEMA)'
      'VALUES'
      '              (:pCod_Cia, '
      '               :pNro_Proceso,'
      '               :pFh_Distribucion,'
      '               :pNro_Corrida,'
      '               :pFh_Proceso,'
      '               :pNro_proceso_gema)')
    Left = 231
    Top = 220
  end
  object QryDistribucionesProcesos: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pFh_Distribucion'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Corrida'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select FH_PROCESO'
      'from GEMA.DISTRIBUCIONES_PROCESO'
      'where COD_CIA = :pCod_Cia and'
      '            NRO_PROCESO = :pNro_Proceso and'
      '             FH_DISTRIBUCION = :pFh_Distribucion and'
      '              NRO_CORRIDA = :pNro_Corrida'
      'order by FH_PROCESO')
    Left = 395
    Top = 276
    object QryDistribucionesProcesosFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
  end
  object QryXBase: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_orden'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select  NOMBRE_CAMPO,'
      '            CAMPO_TIPO,'
      '            LONGITUD_CAMPO,'
      '            DECIMALES_CAMPO'
      'from GEMA.ESTRUCTURAS_XBASE'
      'where COD_CIA = :pCod_Cia and'
      '      NRO_PROCESO = :pNro_Proceso and'
      '      COD_TIPO_ARCHIVO = :pTipo_Archivo and'
      '      COD_DISENO = :pDiseno and'
      '      NRO_ORDEN = :pNro_orden')
    Left = 513
    Top = 276
  end
  object QryDistParCantidad: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Orden'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select COD_SQL, COUNT(COD_SQL) AS CANTIDAD'
      'FROM ('
      '  Select  COD_SQL'
      '  from GEMA.DISTRIBUCIONES_PARAMETRO'
      '  where COD_CIA = :pCod_Cia and'
      '         NRO_PROCESO = :pNro_Proceso and'
      '          COD_TIPO_ARCHIVO = :pTipo_Archivo and'
      '           COD_DISENO = :pDiseno and'
      '            NRO_ORDEN = :pNro_Orden)'
      'group by COD_SQL')
    Left = 145
    Top = 336
    object QryDistParCantidadCOD_SQL: TStringField
      FieldName = 'COD_SQL'
      Size = 4
    end
    object QryDistParCantidadCANTIDAD: TBCDField
      FieldName = 'CANTIDAD'
      Precision = 32
      Size = 0
    end
  end
  object QryDistribuciones_Reemplazo: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Orden'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select  *'
      'from GEMA.DISTRIBUCIONES_REEMPLAZO'
      'where COD_CIA = :pCod_Cia and'
      '           NRO_PROCESO = :pNro_Proceso and'
      '           COD_TIPO_ARCHIVO = :pTipo_Archivo and'
      '           COD_DISENO = :pDiseno and'
      '           NRO_ORDEN = :pNro_Orden')
    Left = 273
    Top = 336
    object QryDistribuciones_ReemplazoNRO_REEMPLAZO: TIntegerField
      FieldName = 'NRO_REEMPLAZO'
    end
    object QryDistribuciones_ReemplazoVALOR_REEMPLAZO: TStringField
      FieldName = 'VALOR_REEMPLAZO'
      Size = 2000
    end
  end
  object SPActBackup: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_GENERICAS.PASAJE_A_BACKUP'
    Parameters = <
      item
        Name = 'TABLA_ORIGEN'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'TABLA_BACKUP'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'FH_PROCESO'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 19
        Value = Null
      end
      item
        Name = 'NRO_CORRIDA'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 2
        Value = Null
      end
      item
        Name = 'NRO_PROCESO_GEMA'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 2
        Value = Null
      end>
    Prepared = True
    Left = 50
    Top = 336
  end
  object tblProcesta: TApolloTable
    DatabaseName = 'DBDisemp'
    FetchCount = 5
    FieldDefs = <>
    IndexDefs = <>
    Sequenced = False
    TableName = 'PROCESTA.DBF'
    OEMTranslate = False
    TableType = ttSXNTX
    Left = 138
    Top = 224
  end
  object tblProccont: TApolloTable
    DatabaseName = 'DBDisemp'
    FetchCount = 5
    FieldDefs = <>
    IndexDefs = <>
    Sequenced = False
    TableName = 'PROCCONT.DBF'
    OEMTranslate = False
    TableType = ttSXNTX
    Left = 146
    Top = 276
  end
  object QryNombreArchivo: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCamino'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pMascara'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pFecha'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pEmpresa'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'Select GEMA.PKG_GEMA_GENERICAS.NOMBRE_ARCHIVO(:pCamino,:pMascara' +
        ',:pFecha,:pEmpresa) as NOMARCH'
      'from Dual')
    Left = 583
    Top = 16
  end
  object SPActSecuencia: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_SECUENCIAS.ACTUALIZA_SECUENCIA'
    Parameters = <
      item
        Name = 'EMPRESA'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
        Value = Null
      end
      item
        Name = 'NRO_PROCESO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
        Value = Null
      end
      item
        Name = 'CLAVE_SECUENCIA'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 591
    Top = 184
  end
  object SPIniSecuencia: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_SECUENCIAS.INICIALIZA_SECUENCIA'
    Parameters = <
      item
        Name = 'EMPRESA'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
        Value = Null
      end
      item
        Name = 'NRO_PROCESO'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
        Value = Null
      end
      item
        Name = 'CLAVE_SECUENCIA'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'INCREMENTA_SECUENCIA'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 15
        Value = Null
      end
      item
        Name = 'FH_PROCESO'
        DataType = ftDateTime
        Value = Null
      end>
    Prepared = True
    Left = 586
    Top = 128
  end
  object SPEliminaOrigen: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_GENERICAS.ROLLBACK_CONVERSION_INICIAL'
    Parameters = <
      item
        Name = 'TABLA_ORIGEN'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'FH_PROCESO'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 592
    Top = 240
  end
  object SPIniVbleSecuencia: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_SECUENCIAS.INICIALIZA_VARIABLE_SECUENCIA'
    Parameters = <>
    Prepared = True
    Left = 594
    Top = 304
  end
  object QryCantRegDetDBF: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <>
    SQL.Strings = (
      'Select Count(TIPO_COBRANZA) as CANTIDAD'
      'from GEMA.COBRANZAS_00070')
    Left = 520
    Top = 336
    object QryCantRegDetDBFCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      ReadOnly = True
    end
  end
  object QryDistribuciones_Param_Repor: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Orden'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'from GEMA.DISTRIBUCIONES_PARAM_REPOR'
      'where COD_CIA = :pCod_Cia and'
      '       NRO_PROCESO = :pNro_Proceso and'
      '        COD_TIPO_ARCHIVO = :pTipo_Archivo and'
      '         COD_DISENO = :pDiseno and'
      '          NRO_ORDEN = :pNro_Orden'
      'order by COD_CIA,'
      '         NRO_PROCESO,'
      '         COD_TIPO_ARCHIVO,'
      '         COD_DISENO,'
      '         NRO_ORDEN,'
      '         NRO_PARAMETRO'
      ''
      ' ')
    Left = 318
    Top = 385
    object QryDistribuciones_Param_ReporCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryDistribuciones_Param_ReporNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryDistribuciones_Param_ReporCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryDistribuciones_Param_ReporCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Size = 10
    end
    object QryDistribuciones_Param_ReporNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object QryDistribuciones_Param_ReporNRO_PARAMETRO: TIntegerField
      FieldName = 'NRO_PARAMETRO'
    end
    object QryDistribuciones_Param_ReporVALOR_PARAMETRO: TStringField
      FieldName = 'VALOR_PARAMETRO'
      Size = 200
    end
  end
  object QryDistribuciones_Reemp_Repor: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_Archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pDiseno'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Orden'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'from GEMA.DISTRIBUCIONES_REEMP_REPOR'
      'where COD_CIA = :pCod_Cia and'
      '       NRO_PROCESO = :pNro_Proceso and'
      '        COD_TIPO_ARCHIVO = :pTipo_Archivo and'
      '         COD_DISENO = :pDiseno and'
      '          NRO_ORDEN = :pNro_Orden'
      'order by COD_CIA,'
      '         NRO_PROCESO,'
      '         COD_TIPO_ARCHIVO,'
      '         COD_DISENO,'
      '         NRO_ORDEN,'
      '         NRO_REEMPLAZO'
      ''
      ' ')
    Left = 502
    Top = 385
    object QryDistribuciones_Reemp_ReporCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryDistribuciones_Reemp_ReporNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryDistribuciones_Reemp_ReporCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryDistribuciones_Reemp_ReporCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Size = 10
    end
    object QryDistribuciones_Reemp_ReporNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object QryDistribuciones_Reemp_ReporNRO_REEMPLAZO: TIntegerField
      FieldName = 'NRO_REEMPLAZO'
    end
    object QryDistribuciones_Reemp_ReporVALOR_REEMPLAZO: TStringField
      FieldName = 'VALOR_REEMPLAZO'
      Size = 200
    end
  end
  object SPDiaHabilCia: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_GENERICAS.DIA_HABIL_CIA'
    Parameters = <
      item
        Name = 'RETURN_VALUE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Direction = pdReturnValue
        Precision = 19
        Value = Null
      end
      item
        Name = 'DFECHA_ORIGINAL'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 19
        Value = Null
      end
      item
        Name = 'NCANTIDAD_DIAS'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'NCOD_CIA'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'NDIADESEMANA'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end>
    Prepared = True
    Left = 42
    Top = 384
  end
  object SPDiaHabil: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GIRE.DIA_HABIL'
    Parameters = <
      item
        Name = 'RETURN_VALUE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Direction = pdReturnValue
        Precision = 19
        Value = Null
      end
      item
        Name = 'DFECHA_ORIGINAL'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 19
        Value = Null
      end
      item
        Name = 'NCANTIDAD_DIAS'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end>
    Prepared = True
    Left = 146
    Top = 384
  end
  object QryExisteConversion: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select '#39'SI'#39
      'from GEMA.DISTRIBUCIONES_CONVERSION Z'
      'where Z.COD_CIA = :pCod_Cia and'
      '      Z.NRO_PROCESO = :pNro_Proceso and'
      '      Z.EJECUTA = 1'
      'having Count(8) > 0')
    Left = 408
    Top = 336
  end
  object ProcArchivos: TProcArchivos
    Mascara = '*.*'
    Atributos = [fatReadOnly, fatArchive, fatAnyFile]
    Ordenado = ordNo
    Clasificacion = ordAscendente
    OnProcesarArchivo = ProcArchivosProcesarArchivo
    Left = 424
    Top = 440
  end
  object Tabla_Reporte: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nombre_Archivo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Importe_Aceptados'
        DataType = ftFloat
      end
      item
        Name = 'Importe_Rechazados'
        DataType = ftFloat
      end
      item
        Name = 'Importe_Reversiones'
        DataType = ftFloat
      end
      item
        Name = 'Cantidad_Aceptados'
        DataType = ftInteger
      end
      item
        Name = 'Cantidad_Rechazados'
        DataType = ftInteger
      end
      item
        Name = 'Cantidad_Reversiones'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 448
  end
  object SPMarcarTiempoProceso: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.MARCAR_TIEMPO_PROCESO'
    Parameters = <
      item
        Name = 'pCia'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'pProc'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'pEstado'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Prepared = True
    Left = 303
    Top = 448
  end
  object qryArchivosNulos: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pCod_Diseno'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select NULO'
      'from GEMA.DISTRIBUCIONES_DETALLE'
      'where COD_CIA = :pCod_Cia and'
      '      NRO_PROCESO = :pNro_Proceso and'
      '      COD_DISENO = :pCod_Diseno'
      '      ')
    Left = 504
    Top = 456
  end
  object SPSiempreDiaHabil: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_GENERICAS.SIEMPRE_DIA_HABIL'
    Parameters = <
      item
        Name = 'RETURN_VALUE'
        Attributes = [paNullable]
        DataType = ftDateTime
        Direction = pdReturnValue
        Precision = 19
        Value = Null
      end
      item
        Name = 'DFECHA_ORIGINAL'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 19
        Value = Null
      end
      item
        Name = 'NCANTIDAD_DIAS'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'NCOD_CIA'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'NDIADESEMANA'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end>
    Prepared = True
    Left = 42
    Top = 440
  end
end
