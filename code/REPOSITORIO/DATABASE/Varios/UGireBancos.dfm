inherited GireBancos: TGireBancos
  OldCreateOrder = True
  Left = 226
  Top = 198
  inherited QryCab: TQuery
    SQL.Strings = (
      'Select * from GIRE.BANCOS'
      'order by BANCO')
    object QryCabBANCO: TFloatField
      FieldName = 'BANCO'
      Origin = 'BANCOS.BANCO'
    end
    object QryCabDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 40
    end
    object QryCabABREV: TStringField
      FieldName = 'ABREV'
      Origin = 'BANCOS.ABREV'
      Size = 10
    end
    object QryCabFH_ACTUALIZACION: TDateTimeField
      FieldName = 'FH_ACTUALIZACION'
      Origin = 'BANCOS.FH_ACTUALIZACION'
    end
    object QryCabUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'BANCOS.USUARIO'
      Size = 16
    end
  end
  inherited UpdCab: TUpdateSQL
    ModifySQL.Strings = (
      'update GIRE.BANCOS'
      'set'
      '  BANCO = :BANCO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  ABREV = :ABREV,'
      'where'
      '  BANCO = :OLD_BANCO')
    InsertSQL.Strings = (
      'insert into GIRE.BANCOS'
      '  (BANCO, DESCRIPCION, ABREV)'
      'values'
      '  (:BANCO, :DESCRIPCION, :ABREV)')
    DeleteSQL.Strings = (
      'delete from GIRE.BANCOS'
      'where'
      '  BANCO = :OLD_BANCO')
  end
end
