inherited DMVueltaAtras: TDMVueltaAtras
  Left = 250
  Top = 158
  Height = 473
  Width = 582
  inherited SPRBSGrande: TADOStoredProc
    ExecuteOptions = [eoAsyncExecute]
    Left = 360
    Top = 136
  end
  inherited TblDBF: TApolloTable
    Left = 138
    Top = 276
  end
  inherited QryDistConversion: TADOQuery
    Top = 216
  end
  inherited TblORA: TADOTable
    Top = 276
  end
  inherited QryTblDBFaTblOra: TADOQuery
    CursorType = ctStatic
  end
  inherited QryExisteConversion: TADOQuery
    Left = 360
    Top = 272
  end
  object QryUltimaDistribucion: TADOQuery
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
      'Select Distinct FH_DISTRIBUCION, NRO_CORRIDA, NRO_PROCESO_GEMA'
      'from GEMA.RESUMENES'
      'where COD_CIA = :pCod_Cia and'
      '       NRO_PROCESO = :pNro_Proceso'
      'group by FH_DISTRIBUCION, NRO_CORRIDA, NRO_PROCESO_GEMA'
      ''
      ''
      ' '
      ' ')
    Left = 40
    Top = 144
    object QryUltimaDistribucionFH_DISTRIBUCION: TDateTimeField
      FieldName = 'FH_DISTRIBUCION'
    end
    object QryUltimaDistribucionNRO_CORRIDA: TIntegerField
      FieldName = 'NRO_CORRIDA'
    end
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
    Left = 242
    Top = 200
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
    Left = 243
    Top = 272
  end
  object QryAct_Fh_Proceso: TADOQuery
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
      'Update GEMA.DISTRIBUCIONES'
      'set FH_PROCESO = FH_PROCESO_ANTERIOR'
      'where COD_CIA = :pCod_Cia and'
      '             NRO_PROCESO = :pNro_Proceso')
    Left = 242
    Top = 143
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
    Left = 240
    Top = 24
    object QryDistribucionesProcesosFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
  end
  object QryDelResumenes: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_proceso'
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
      'Delete from GEMA.RESUMENES'
      'where COD_CIA = :pCod_Cia and'
      '            NRO_PROCESO = :pNro_proceso and'
      '             FH_DISTRIBUCION = :pFh_Distribucion and'
      '              NRO_CORRIDA = :pNro_Corrida')
    Left = 352
    Top = 24
  end
  object SPInsertVueltaAtras: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_GENERICAS.PASAJE_A_ORIGEN'
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
        Name = 'FH_DISTRIBUCION'
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
    Left = 248
    Top = 336
  end
  object QryUltimaDistProceso: TADOQuery
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
      'Select FH_DISTRIBUCION,'
      '           NRO_CORRIDA'
      'from GEMA.DISTRIBUCIONES_PROCESO'
      'where COD_CIA = :pCod_Cia and'
      '            NRO_PROCESO = :pNro_Proceso'
      'order by FH_DISTRIBUCION,NRO_CORRIDA')
    Left = 352
    Top = 80
    object QryUltimaDistProcesoFH_DISTRIBUCION: TDateTimeField
      FieldName = 'FH_DISTRIBUCION'
    end
    object QryUltimaDistProcesoNRO_CORRIDA: TIntegerField
      FieldName = 'NRO_CORRIDA'
    end
  end
  object SPVuelveAtrasSecuencia: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_SECUENCIAS.VUELTA_ATRAS_SECUENCIA'
    Parameters = <
      item
        Name = 'EMPRESA'
        Attributes = [paNullable]
        DataType = ftBCD
        Value = Null
      end
      item
        Name = 'NRO_PROCESO'
        Attributes = [paNullable]
        DataType = ftBCD
        Value = Null
      end
      item
        Name = 'CLAVE_SECUENCIA'
        Attributes = [paNullable]
        DataType = ftString
        Size = 4000
        Value = Null
      end
      item
        Name = 'FH_DISTRIBUCION'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'NRO_CORRIDA'
        DataType = ftInteger
        Value = Null
      end>
    Prepared = True
    Left = 360
    Top = 200
  end
  object QryVueltaAtrasSecuencia: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_proceso'
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
    Prepared = True
    SQL.Strings = (
      'Select DISTINCT A.COD_CIA,'
      '                A.NRO_PROCESO,'
      '                B.CLAVE_SECUENCIA'
      'from GEMA.RESUMENES A,'
      '     GEMA.DISTRIBUCIONES_DETALLE B'
      
        'where  A.COD_CIA = B.COD_CIA and A.NRO_PROCESO = B.NRO_PROCESO a' +
        'nd'
      '        A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO and'
      
        '         A.COD_DISENO = B.COD_DISENO and A.NRO_ORDEN = B.NRO_ORD' +
        'EN and'
      '          A.COD_CIA = :pCod_Cia and'
      '            A.NRO_PROCESO = :pNro_proceso and'
      '             A.FH_DISTRIBUCION = :pFh_Distribucion and'
      
        '              A.NRO_CORRIDA = :pNro_Corrida and B.LLEVA_SECUENCI' +
        'A = 1')
    Left = 360
    Top = 336
  end
  object qryDistrubucionesAutomatico: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pCod_Archivo'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Update GEMA.DISTRIBUCIONES_AUTOMATICO'
      'set ESTADO_PROCESO = 0,'
      '      HORA_INICIO='#39#39'.'
      '      HORA_FIN='#39#39
      'where COD_CIA = :pCod_Cia and'
      '            COD_ARCHIVO = :pCod_Archivo'
      '')
    Left = 89
    Top = 335
    object DateTimeField1: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
  end
end
