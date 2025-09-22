object DMGirePath: TDMGirePath
  OldCreateOrder = False
  Left = 190
  Top = 103
  Height = 375
  Width = 544
  object QryGirePath: TADOQuery
    Connection = GIREADO.ADOConec
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
end
