inherited GireTipoCobranzas: TGireTipoCobranzas
  OldCreateOrder = True
  Left = 238
  Top = 180
  inherited QryCab: TQuery
    SQL.Strings = (
      'select * '
      'from GIRE.TIPO_COBRANZAS')
    object QryCabTIPOCOB: TStringField
      FieldName = 'TIPOCOB'
      Origin = 'TIPO_COBRANZAS.TIPOCOB'
      Size = 1
    end
    object QryCabDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_COBRANZAS.DESCRIPCION'
      Size = 25
    end
    object QryCabUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'TIPO_COBRANZAS.USUARIO'
      Size = 15
    end
  end
  inherited UpdCab: TUpdateSQL
    ModifySQL.Strings = (
      'update GIRE.TIPO_COBRANZAS'
      'set'
      '  TIPOCOB = :TIPOCOB,'
      '  DESCRIPCION = :DESCRIPCION,'
      ' '
      'where'
      '  TIPOCOB = :OLD_TIPOCOB')
    InsertSQL.Strings = (
      'insert into GIRE.TIPO_COBRANZAS'
      '  (TIPOCOB, DESCRIPCION)'
      'values'
      '  (:TIPOCOB, :DESCRIPCION)')
    DeleteSQL.Strings = (
      'delete from GIRE.TIPO_COBRANZAS'
      'where'
      '  TIPOCOB = :OLD_TIPOCOB')
  end
end
