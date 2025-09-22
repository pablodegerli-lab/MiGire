inherited GireMonedas: TGireMonedas
  OldCreateOrder = True
  inherited QryCab: TQuery
    SQL.Strings = (
      'Select * from GIRE.MONEDAS')
    object QryCabMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 1
    end
    object QryCabDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 8
    end
  end
  inherited UpdCab: TUpdateSQL
    ModifySQL.Strings = (
      'update GIRE.MONEDAS'
      'set'
      '  MONEDA = :MONEDA,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  MONEDA = :OLD_MONEDA')
    InsertSQL.Strings = (
      'insert into GIRE.MONEDAS'
      '  (MONEDA, DESCRIPCION)'
      'values'
      '  (:MONEDA, :DESCRIPCION)')
    DeleteSQL.Strings = (
      'delete from GIRE.MONEDAS'
      'where'
      '  MONEDA = :OLD_MONEDA')
  end
end
