inherited DMPrincipal: TDMPrincipal
  OldCreateOrder = True
  Left = 760
  Top = 181
  Height = 367
  Width = 544
  inherited QryGirePath: TADOQuery
    SQL.Strings = (
      'Select A.COD_SISTEMA,'
      '       B.DESCRIPCION AS SISTEMA,'
      '       A.COD_PATH AS CODPATH,'
      '       A.PATH'
      'from GIRE.PATHS A,'
      '     GIRE.SISTEMAS B'
      'where B.COD_SISTEMA = 5 and'
      '        A.COD_SISTEMA = B.COD_SISTEMA')
    Left = 51
  end
  inherited SPRBSGrande: TADOStoredProc
    Left = 216
    Top = 24
  end
  object QryDistribuciones: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select A.COD_CIA as EMPRESA,'
      '           B.ABREVIATURA, '
      '           B.DESCRIPCION as RAZONSOCIAL, '
      '           A.NRO_PROCESO as PROCESO, '
      '           nvl(A.DESCRIPCION,'#39' '#39') as DESCRIPCION, '
      '           A.FH_PROCESO as ULTFHPROCESO, '
      '           C.COPIA_A_TRANSMISION, '
      '           C.COD_MODO, '
      '           A.PATH_WORK, '
      '           A.FH_PROCESO_ANTERIOR, '
      '           A.PARAMETRO_DIA_HABIL,'
      '           D.COD_ARCHIVO as PROCESO_AU, '
      '           D.ID_LOTE as LOTE_AU, B.IMPRIME as IMPRIME'
      'from GEMA.DISTRIBUCIONES A, '
      '        GIRE.CIAS B, '
      '        GEMA.CIAS C, '
      
        '        (select * from GEMA.DISTRIBUCIONES_AUTOMATICO where esta' +
        'do_proceso  in (0)) D '
      'where A.COD_CIA = B.COD_CIA '
      '          and  A.COD_CIA = C.COD_CIA '
      '          and A.HABILITADA = 1 '
      #9#9'  and a.NRO_PROCESO = d.NRO_PROCESO(+)'
      '          and a.cod_cia=d.cod_cia(+) '
      'order by RAZONSOCIAL,PROCESO')
    Left = 50
    Top = 88
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
    object QryDistribucionesFH_PROCESO_ANTERIOR: TDateTimeField
      FieldName = 'FH_PROCESO_ANTERIOR'
    end
    object QryDistribucionesPARAMETRO_DIA_HABIL: TIntegerField
      FieldName = 'PARAMETRO_DIA_HABIL'
    end
    object QryDistribucionesPROCESO_AU: TBCDField
      FieldName = 'PROCESO_AU'
      Precision = 32
      Size = 0
    end
    object QryDistribucionesLOTE_AU: TStringField
      FieldName = 'LOTE_AU'
    end
    object QryDistribucionesIMPRIME: TBCDField
      FieldName = 'IMPRIME'
    end
  end
  object qryAutomatico: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <>
    Left = 376
    Top = 40
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
    Left = 376
    Top = 120
  end
  object QryProcesos: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select max(NRO_PROCESO) as PROCESOS'
      'from gema.DISTRIBUCIONES_DETALLE'
      'where cod_cia= :pCod_Cia'
      'group by COD_CIA')
    Left = 377
    Top = 192
  end
  object QryModos: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pCod_Cia'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_proceso'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select min(COD_DISENO) as DISENO, COD_MODO'
      'from GEMA.DISTRIBUCIONES_DISENO'
      'where cod_cia= :pCod_Cia'
      '          and nro_proceso=:pNro_proceso'
      'group by COD_MODO')
    Left = 379
    Top = 256
  end
end
