inherited GireCias: TGireCias
  OldCreateOrder = True
  Left = 245
  Top = 197
  inherited QryCab: TQuery
    DatabaseName = 'DBPrinc'
    SQL.Strings = (
      'Select * from GIRE.CIAS')
  end
  inherited UpdCab: TUpdateSQL
    ModifySQL.Strings = (
      'update GIRE.CIAS'
      'set'
      '  COD_CIA = :COD_CIA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  ABREVIATURA = :ABREVIATURA,'
      'where'
      '  COD_CIA = :OLD_COD_CIA')
    InsertSQL.Strings = (
      'insert into GIRE.CIAS'
      '  (COD_CIA, DESCRIPCION, ABREVIATURA)'
      'values'
      '  (:COD_CIA , :DESCRIPCION, :ABREVIATURA)')
    DeleteSQL.Strings = (
      'delete from GIRE.CIAS'
      'where'
      '  COD_CIA = :OLD_COD_CIA')
  end
end
