object DMGirePath: TDMGirePath
  OldCreateOrder = False
  Left = 843
  Top = 246
  Height = 353
  Width = 534
  object QryGirePath: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <>
    SQL.Strings = (
      'Select A.COD_SISTEMA , B.DESCRIPCION AS SISTEMA, '
      'A.COD_PATH AS CODPATH, A.PATH, A.USUARIO, '
      'A.FH_ACTUALIZACION '
      'from GIRE.PATHS A, GIRE.SISTEMAS B '
      'where A.COD_SISTEMA = B.COD_SISTEMA')
    Left = 40
    Top = 24
    object QryGirePathSISTEMA: TStringField
      FieldName = 'SISTEMA'
      Size = 15
    end
    object QryGirePathCODPATH: TStringField
      FieldName = 'CODPATH'
    end
    object QryGirePathPATH: TStringField
      FieldName = 'PATH'
      Size = 50
    end
  end
  object Entorno: TApolloEnv
    ApplyTo = [atLocal]
    Left = 138
    Top = 25
  end
  object DBDisemp: TApolloDatabase
    DataPathAlias = 'DBDisemp'
    Left = 138
    Top = 92
  end
  object TblCaminos: TApolloTable
    DatabaseName = 'DBDisemp'
    FieldDefs = <>
    IndexDefs = <>
    TableName = 'CAMINOS'
    OEMTranslate = False
    Left = 138
    Top = 148
  end
  object TblGireCtrl: TApolloTable
    DatabaseName = 'DBDisemp'
    Exclusive = True
    FieldDefs = <>
    IndexDefs = <>
    Sequenced = False
    TableName = 'GireCtrl.DBF'
    OEMTranslate = False
    TableType = ttSXNTX
    Left = 136
    Top = 220
  end
  object SPRBSGrande: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GIRE.SETEOROLL'
    Parameters = <>
    Prepared = True
    Left = 40
    Top = 88
  end
end
