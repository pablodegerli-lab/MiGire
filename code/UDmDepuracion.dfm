inherited DMDepuracion: TDMDepuracion
  OldCreateOrder = True
  Left = 234
  Top = 142
  Height = 381
  Width = 529
  object QryTblServicios: TADOQuery
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
      'select  DISTINCT D.NOMBRE_TABLA_ORA'
      'from GEMA.TIPOS_DE_ARCHIVO D,'
      '        GEMA.DISTRIBUCIONES_DISENO A'
      
        'where A.COD_CIA = :pCod_Cia and A.NRO_PROCESO = :pNro_Proceso an' +
        'd'
      '            A.COD_TIPO_ARCHIVO = D.COD_TIPO_ARCHIVO and'
      
        '             (D.COD_TIPO_ARCHIVO <> '#39'LS'#39' and D.COD_TIPO_ARCHIVO ' +
        '<> '#39'ZZ'#39')   '
      'order by D.NOMBRE_TABLA_ORA')
    Left = 40
    Top = 88
    object QryTblServiciosNOMBRE_TABLA_ORA: TStringField
      FieldName = 'NOMBRE_TABLA_ORA'
      Size = 30
    end
  end
  object SPDepuraEnBackup: TADOStoredProc
    Connection = GemaConexion.ADOConec
    ProcedureName = 'GEMA.PKG_GEMA_GENERICAS.DEPURA_EN_BACKUP'
    Parameters = <>
    Prepared = True
    Left = 40
    Top = 160
  end
end
