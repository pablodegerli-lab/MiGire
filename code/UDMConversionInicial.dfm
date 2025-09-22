inherited DMConversionInicial: TDMConversionInicial
  OldCreateOrder = True
  Left = 277
  Top = 133
  Height = 397
  Width = 513
  inherited Entorno: TApolloEnv
    Top = 24
  end
  inherited DBDisemp: TApolloDatabase
    Top = 88
  end
  inherited TblCaminos: TApolloTable
    Top = 144
  end
  inherited TblGireCtrl: TApolloTable
    Top = 204
  end
  inherited SPRBSGrande: TADOStoredProc
    Left = 136
    Top = 264
  end
  object TblDBF: TApolloTable
    DatabaseName = 'DBDisemp'
    Exclusive = True
    FieldDefs = <>
    IndexDefs = <>
    Sequenced = False
    OEMTranslate = False
    TableType = ttSXNTX
    Left = 42
    Top = 268
  end
  object QryDistConversion: TADOQuery
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
        Name = 'pTipo_archivo'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipo_archivo_DBF'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select Z.*'
      'from GEMA.DISTRIBUCIONES_CONVERSION Z'
      'where Z.COD_CIA = :pCod_Cia and'
      '      Z.NRO_PROCESO = :pNro_Proceso and'
      '      Z.COD_TIPO_ARCHIVO = :pTipo_archivo and'
      '      Z.COD_TIPO_ARCHIVO_DBF = :pTipo_archivo_DBF and'
      '      Z.EJECUTA = 1'
      '     '
      ' ')
    Left = 40
    Top = 144
    object QryDistConversionCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryDistConversionNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryDistConversionCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryDistConversionCOD_TIPO_ARCHIVO_DBF: TStringField
      FieldName = 'COD_TIPO_ARCHIVO_DBF'
      Size = 2
    end
    object QryDistConversionCAMPO_ORIGEN: TStringField
      FieldName = 'CAMPO_ORIGEN'
    end
    object QryDistConversionCAMPO_DESTINO: TStringField
      DisplayWidth = 30
      FieldName = 'CAMPO_DESTINO'
      Size = 30
    end
    object QryDistConversionCAMPO_TIPO: TStringField
      FieldName = 'CAMPO_TIPO'
      Size = 1
    end
    object QryDistConversionEVALUADOR: TStringField
      FieldName = 'EVALUADOR'
      Size = 50
    end
    object QryDistConversionEJECUTA: TIntegerField
      FieldName = 'EJECUTA'
    end
  end
  object TblORA: TADOTable
    Connection = GemaConexion.ADOConec
    CursorType = ctStatic
    Left = 40
    Top = 204
  end
  object QryTblDBFaTblOra: TADOQuery
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
        Name = 'pCod_Cia2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Proceso2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select DISTINCT C.NOMBRE_TABLA_DBF,'
      '                C.COD_TIPO_ARCHIVO_DBF,'
      '                C.DESCRIPCION,'
      '                D.NOMBRE_TABLA_ORA,'
      #9'B.COD_TIPO_ARCHIVO,'
      '                A.TIPO_INDICE_DBF'
      'from GEMA.TIPOS_DE_ARCHIVO_DBF C,'
      '        GEMA.DISTRIBUCIONES_DETALLE E,'
      '        GEMA.TIPOS_DE_ARCHIVO_ORA_DBF B,'
      '        GEMA.TIPOS_DE_ARCHIVO D,'
      '        GEMA.DISTRIBUCIONES_DISENO A'
      
        'where  E.COD_CIA = :pCod_Cia and E.NRO_PROCESO = :pNro_Proceso a' +
        'nd'
      '        E.COD_TIPO_ARCHIVO_DBF = C.COD_TIPO_ARCHIVO_DBF and '
      '         E.COD_TIPO_ARCHIVO_DBF = B.COD_TIPO_ARCHIVO_DBF and'
      
        '          A.COD_CIA= E.COD_CIA and A.NRO_PROCESO = E.NRO_PROCESO' +
        ' and A.COD_DISENO = E.COD_DISENO and'
      '            B.COD_TIPO_ARCHIVO = D.COD_TIPO_ARCHIVO and '
      '           B.COD_TIPO_ARCHIVO = A.COD_TIPO_ARCHIVO and'
      #9#9'   exists (Select '#39'OK'#39
      #9#9'   '#9#9'   from GEMA.DISTRIBUCIONES_DISENO X'
      
        #9#9#9#9'   where X.COD_CIA = :pCod_Cia2 and X.NRO_PROCESO = :pNro_Pr' +
        'oceso2 and'
      #9#9#9#9'   A.COD_TIPO_ARCHIVO = X.COD_TIPO_ARCHIVO)'
      'order by C.NOMBRE_TABLA_DBF')
    Left = 40
    Top = 80
    object QryTblDBFaTblOraNOMBRE_TABLA_DBF: TStringField
      FieldName = 'NOMBRE_TABLA_DBF'
      Size = 8
    end
    object QryTblDBFaTblOraNOMBRE_TABLA_ORA: TStringField
      FieldName = 'NOMBRE_TABLA_ORA'
      Size = 30
    end
    object QryTblDBFaTblOraCOD_TIPO_ARCHIVO_DBF: TStringField
      FieldName = 'COD_TIPO_ARCHIVO_DBF'
      Size = 2
    end
    object QryTblDBFaTblOraCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryTblDBFaTblOraTIPO_INDICE_DBF: TStringField
      FieldName = 'TIPO_INDICE_DBF'
      Size = 3
    end
    object QryTblDBFaTblOraDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
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
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select 1'
      'from GEMA.DISTRIBUCIONES_CONVERSION'
      'where COD_CIA = :pCod_Cia and'
      '    NRO_PROCESO = :pNro_Proceso and '
      '           EJECUTA = 1')
    Left = 232
    Top = 24
  end
  object EvaluaConversion: TClipperMacroExpr
    DecimalSep = dsPoint
    Left = 232
    Top = 88
  end
end
