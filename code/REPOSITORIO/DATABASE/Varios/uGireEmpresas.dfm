inherited GireEmpresas: TGireEmpresas
  OldCreateOrder = True
  Left = 245
  Top = 197
  inherited QryCab: TQuery
    SQL.Strings = (
      'Select * from GIRE.EMPRESAS')
  end
  inherited UpdCab: TUpdateSQL
    ModifySQL.Strings = (
      'update GIRE.EMPRESAS'
      'set'
      '  EMPRESA = :EMPRESA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  ABREV = :ABREV,'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
    InsertSQL.Strings = (
      'insert into GIRE.EMPRESAS'
      '  (EMPRESA, DESCRIPCION, ABREV)'
      'values'
      '  (:EMPRESA, :DESCRIPCION, :ABREV)')
    DeleteSQL.Strings = (
      'delete from GIRE.EMPRESAS'
      'where'
      '  EMPRESA = :OLD_EMPRESA')
  end
end
