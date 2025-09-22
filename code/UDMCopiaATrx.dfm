object DMCopiaATrx: TDMCopiaATrx
  OldCreateOrder = False
  Left = 201
  Top = 106
  Height = 375
  Width = 544
  object QryArchivos: TADOQuery
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
      'Select A.*,'
      '           B.DESCRIPCION'
      'from GEMA.RESUMENES A,'
      '        GEMA.TIPOS_DE_ARCHIVO B'
      'where A.COD_CIA = :pCod_Cia and'
      '            A.NRO_PROCESO = :pNro_Proceso and'
      '             A.FH_DISTRIBUCION = :pFh_Distribucion and'
      '              A.NRO_CORRIDA = :pNro_Corrida and'
      '               A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO'
      '              #NroProcesoGema')
    Left = 56
    Top = 96
    object QryArchivosCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
      Visible = False
    end
    object QryArchivosNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
      Visible = False
    end
    object QryArchivosCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Visible = False
      Size = 2
    end
    object QryArchivosCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Visible = False
      Size = 10
    end
    object QryArchivosNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
      Visible = False
    end
    object QryArchivosFH_DISTRIBUCION: TDateTimeField
      FieldName = 'FH_DISTRIBUCION'
      Visible = False
    end
    object QryArchivosNRO_CORRIDA: TIntegerField
      FieldName = 'NRO_CORRIDA'
      Visible = False
    end
    object QryArchivosNOMBRE_ARCHIVO: TStringField
      DisplayLabel = 'Archivo'
      FieldName = 'NOMBRE_ARCHIVO'
      Size = 200
    end
    object QryArchivosDESCRIPCION: TStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object QryArchivosCANTIDAD_REGISTROS: TIntegerField
      DisplayLabel = 'Registros'
      DisplayWidth = 10
      FieldName = 'CANTIDAD_REGISTROS'
      DisplayFormat = '##,###,###'
    end
    object QryArchivosCANTIDAD_MOVIMIENTOS: TIntegerField
      DisplayLabel = 'Movimientos'
      DisplayWidth = 10
      FieldName = 'CANTIDAD_MOVIMIENTOS'
      DisplayFormat = '##,###,###'
    end
    object QryArchivosIMPORTE: TBCDField
      DisplayLabel = 'Importe'
      DisplayWidth = 18
      FieldName = 'IMPORTE'
      DisplayFormat = '##,###,###.##'
      Precision = 14
      Size = 2
    end
    object QryArchivosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Visible = False
      Size = 15
    end
    object QryArchivosFH_ACTUALIZACION: TDateTimeField
      DisplayLabel = 'Fecha y Hora'
      DisplayWidth = 22
      FieldName = 'FH_ACTUALIZACION'
    end
    object QryArchivosPATH_SALIDA: TStringField
      FieldName = 'PATH_SALIDA'
      Size = 50
    end
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
      'select * from ( Select Distinct FH_DISTRIBUCION, NRO_CORRIDA'
      '                  from GEMA.RESUMENES'
      '                 where COD_CIA = :pCod_Cia and'
      
        '                       NRO_PROCESO = :pNro_Proceso #NroProcesoGe' +
        'ma'
      '                       group by FH_DISTRIBUCION, NRO_CORRIDA )'
      
        'order by to_char( trunc(FH_DISTRIBUCION),'#39'yyyymmdd'#39' ) || NRO_COR' +
        'RIDA'
      ''
      ' '
      '')
    Left = 208
    Top = 24
    object QryUltimaDistribucionFH_DISTRIBUCION: TDateTimeField
      FieldName = 'FH_DISTRIBUCION'
    end
    object QryUltimaDistribucionNRO_CORRIDA: TIntegerField
      FieldName = 'NRO_CORRIDA'
    end
  end
  object ADOControlProcesoGema: TADOCtrlProcesos
    Conexion = GemaConexion.ADOConec
    CodProceso = 101
    Left = 56
    Top = 24
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
    Left = 56
    Top = 176
    object QryDistribucionesProcesosFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
  end
  object QryFh_Proceso_Anterior: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select Max(FH_PROCESO) as FH_PROCESO_ANTERIOR'
      'from (Select FH_PROCESO'
      '      from GIRE.ESTADOS'
      '      where EMPRESA = :pCod_Cia and'
      '             COD_PROCESO = 101 and'
      '              NRO_PROCESO = 1)'
      ''
      ' '
      ' ')
    Left = 208
    Top = 96
    object QryFh_Proceso_AnteriorFH_PROCESO_ANTERIOR: TDateTimeField
      FieldName = 'FH_PROCESO_ANTERIOR'
    end
  end
end
