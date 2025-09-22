object DMConsultadistribucion: TDMConsultadistribucion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 335
  Top = 149
  Height = 375
  Width = 544
  object QryResumenes: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
    AfterOpen = QryResumenesAfterOpen
    AfterClose = QryResumenesAfterClose
    Parameters = <
      item
        Name = 'pDesde'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pHasta'
        DataType = ftString
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
      'Select A.*,'
      '       B.DESCRIPCION,'
      #9'   C.COD_FORMATO'
      'from GEMA.RESUMENES A,'
      '     GEMA.TIPOS_DE_ARCHIVO B,'
      #9' GEMA.DISTRIBUCIONES_DETALLE C'
      
        'where To_Char(A.FH_DISTRIBUCION,'#39'yyyymmdd'#39')||lPad(A.NRO_CORRIDA,' +
        '2,'#39'0'#39') >= :pDesde and'
      
        '       To_Char(A.FH_DISTRIBUCION,'#39'yyyymmdd'#39')||lPad(A.NRO_CORRIDA' +
        ',2,'#39'0'#39') <= :pHasta and'
      
        '        A.COD_CIA = :pCod_Cia and A.NRO_PROCESO = :pNro_Proceso ' +
        'and'
      '         A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO and '
      #9#9' A.COD_CIA = C.COD_CIA and A.NRO_PROCESO = C.NRO_PROCESO and'
      
        #9#9'  A.COD_TIPO_ARCHIVO = C.COD_TIPO_ARCHIVO and A.COD_DISENO = C' +
        '.COD_DISENO and '
      #9#9'   A.NRO_ORDEN = C.NRO_ORDEN'
      
        'order by To_Char(A.FH_DISTRIBUCION,'#39'yyyymmdd'#39')||lPad(A.NRO_CORRI' +
        'DA,2,'#39'0'#39') ')
    Left = 40
    Top = 32
    object QryResumenesNOMBRE_ARCHIVO: TStringField
      DisplayLabel = 'Archivo'
      FieldName = 'NOMBRE_ARCHIVO'
      Size = 30
    end
    object QryResumenesDESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object QryResumenesCANTIDAD_REGISTROS: TIntegerField
      DisplayLabel = 'Registros'
      FieldName = 'CANTIDAD_REGISTROS'
    end
    object QryResumenesCANTIDAD_MOVIMIENTOS: TIntegerField
      DisplayLabel = 'Movimientos'
      FieldName = 'CANTIDAD_MOVIMIENTOS'
    end
    object QryResumenesIMPORTE: TBCDField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      DisplayFormat = '########0.00'
      EditFormat = '########0.00'
      Precision = 14
      Size = 2
    end
    object QryResumenesFH_ACTUALIZACION: TDateTimeField
      FieldName = 'FH_ACTUALIZACION'
    end
    object QryResumenesNRO_CORRIDA: TIntegerField
      DisplayLabel = 'N'#186' Corrida'
      FieldName = 'NRO_CORRIDA'
    end
    object QryResumenesCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
      Visible = False
    end
    object QryResumenesNRO_PROCESO: TIntegerField
      DisplayLabel = 'Proceso'
      FieldName = 'NRO_PROCESO'
    end
    object QryResumenesCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Visible = False
      Size = 2
    end
    object QryResumenesCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Visible = False
      Size = 10
    end
    object QryResumenesNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
      Visible = False
    end
    object QryResumenesFH_DISTRIBUCION: TDateTimeField
      FieldName = 'FH_DISTRIBUCION'
      Visible = False
    end
    object QryResumenesUSUARIO: TStringField
      FieldName = 'USUARIO'
      Visible = False
      Size = 15
    end
    object QryResumenesCOD_FORMATO: TStringField
      FieldName = 'COD_FORMATO'
      Size = 3
    end
  end
  object QryNrosCorridaDesde: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
    Parameters = <
      item
        Name = 'pFh_Distribucion'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select Distinct NRO_CORRIDA'
      'from GEMA.RESUMENES'
      'where FH_DISTRIBUCION = :pFh_Distribucion'
      'order by NRO_CORRIDA  '
      ' ')
    Left = 160
    Top = 32
    object QryNrosCorridaDesdeNRO_CORRIDA: TIntegerField
      FieldName = 'NRO_CORRIDA'
    end
  end
  object QryNrosCorridaHasta: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
    Parameters = <
      item
        Name = 'pFh_Distribucion'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select Distinct NRO_CORRIDA'
      'from GEMA.RESUMENES'
      'where FH_DISTRIBUCION = :pFh_Distribucion'
      'order by NRO_CORRIDA  '
      ' ')
    Left = 164
    Top = 104
    object BCDField1: TIntegerField
      FieldName = 'NRO_CORRIDA'
    end
  end
  object MDResumenes: TRxMemoryData
    FieldDefs = <
      item
        Name = 'NOMBRE_ARCHIVO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD_MOVIMIENTOS'
        DataType = ftInteger
      end
      item
        Name = 'CANTIDAD_REGISTROS'
        DataType = ftInteger
      end
      item
        Name = 'IMPORTE'
        DataType = ftFloat
      end
      item
        Name = 'FH_DISTRIBUCION'
        DataType = ftDateTime
      end
      item
        Name = 'NRO_CORRIDA'
        DataType = ftInteger
      end
      item
        Name = 'COLOR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOGO'
        DataType = ftString
        Size = 20
      end>
    Left = 40
    Top = 104
    object MDResumenesNOMBRE_ARCHIVO: TStringField
      DisplayLabel = 'Archivo'
      DisplayWidth = 30
      FieldName = 'NOMBRE_ARCHIVO'
      Size = 30
    end
    object MDResumenesDESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      DisplayWidth = 28
      FieldName = 'DESCRIPCION'
      Size = 28
    end
    object MDResumenesCANTIDAD_MOVIMIENTOS: TIntegerField
      DisplayLabel = 'Movimientos'
      FieldName = 'CANTIDAD_MOVIMIENTOS'
    end
    object MDResumenesCANTIDAD_REGISTROS: TIntegerField
      DisplayLabel = 'Registros'
      FieldName = 'CANTIDAD_REGISTROS'
    end
    object MDResumenesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      DisplayFormat = '########0.00'
      EditFormat = '########0.00'
    end
    object MDResumenesFH_DISTRIBUCION: TDateTimeField
      Alignment = taRightJustify
      DisplayLabel = 'Fecha y Hora'
      DisplayWidth = 22
      FieldName = 'FH_DISTRIBUCION'
    end
    object MDResumenesNRO_CORRIDA: TIntegerField
      DisplayLabel = 'N'#186'  Corrida'
      FieldName = 'NRO_CORRIDA'
    end
    object MDResumenesCOLOR: TStringField
      FieldName = 'COLOR'
      Visible = False
    end
    object MDResumenesLOGO: TStringField
      FieldName = 'LOGO'
      Visible = False
    end
  end
  object QryDistribuciones: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select A.COD_CIA as EMPRESA,'
      '           To_Char(A.COD_CIA) as SCOD_CIA,'
      '           B.ABREVIATURA,'
      '           B.DESCRIPCION as RAZONSOCIAL,'
      '           A.NRO_PROCESO as PROCESO,'
      '           nvl(A.DESCRIPCION,'#39' '#39') as DESCRIPCION,'
      '           A.FH_PROCESO as ULTFHPROCESO,'
      '           C.COPIA_A_TRANSMISION,'
      '           C.COD_MODO,'
      '           A.PATH_WORK'
      'from GEMA.DISTRIBUCIONES A,'
      '        GIRE.CIAS B,'
      '        GEMA.CIAS C'
      'where A.COD_CIA = B.COD_CIA and '
      '           A.COD_CIA = C.COD_CIA and A.HABILITADA = 1'
      'order by EMPRESA,RAZONSOCIAL,PROCESO')
    Left = 42
    Top = 176
    object QryDistribucionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QryDistribucionesRAZONSOCIAL: TStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'RAZONSOCIAL'
      Size = 40
    end
    object QryDistribucionesPROCESO: TIntegerField
      DisplayLabel = 'Proceso'
      FieldName = 'PROCESO'
    end
    object QryDistribucionesDESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object QryDistribucionesULTFHPROCESO: TDateTimeField
      DisplayLabel = 'Ultimo Proceso'
      FieldName = 'ULTFHPROCESO'
    end
    object QryDistribucionesABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Visible = False
      Size = 10
    end
    object QryDistribucionesCOPIA_A_TRANSMISION: TStringField
      FieldName = 'COPIA_A_TRANSMISION'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryDistribucionesCOD_MODO: TIntegerField
      FieldName = 'COD_MODO'
      Visible = False
    end
    object QryDistribucionesPATH_WORK: TStringField
      FieldName = 'PATH_WORK'
      Size = 50
    end
    object QryDistribucionesSCOD_CIA: TStringField
      DisplayWidth = 5
      FieldName = 'SCOD_CIA'
      ReadOnly = True
      Size = 5
    end
  end
  object QryCorridas: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
    Parameters = <
      item
        Name = 'pDesde'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pHasta'
        DataType = ftString
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
      'Select Trunc(A.FH_DISTRIBUCION),A.NRO_CORRIDA'
      'from GEMA.RESUMENES A'
      'where To_Char(A.FH_DISTRIBUCION,'#39'yyyymmdd'#39') >= :pDesde and'
      '       To_Char(A.FH_DISTRIBUCION,'#39'yyyymmdd'#39') <= :pHasta and'
      '        A.COD_CIA = :pCod_Cia and A.NRO_PROCESO = :pNro_Proceso'
      'group by Trunc(A.FH_DISTRIBUCION),A.NRO_CORRIDA')
    Left = 166
    Top = 174
  end
end
