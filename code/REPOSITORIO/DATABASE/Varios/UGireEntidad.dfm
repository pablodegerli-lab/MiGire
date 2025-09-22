object GireEntidad: TGireEntidad
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 198
  Width = 300
  object QryCab: TQuery
    CachedUpdates = True
    BeforeDelete = QryCabBeforeDelete
    DatabaseName = 'DbPrinc'
    UpdateObject = UpdCab
    Left = 40
    Top = 24
  end
  object UpdCab: TUpdateSQL
    Left = 95
    Top = 24
  end
  object DsCab: TDataSource
    DataSet = QryCab
    Left = 136
    Top = 24
  end
  object QryDet1: TQuery
    CachedUpdates = True
    OnNewRecord = QryDetNewRecord
    DatabaseName = 'DbPrinc'
    DataSource = DsCab
    UpdateObject = UpdDet1
    Left = 43
    Top = 77
  end
  object UpdDet1: TUpdateSQL
    Left = 98
    Top = 77
  end
end
