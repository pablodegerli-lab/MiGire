object DbExpressConexion: TDbExpressConexion
  OldCreateOrder = False
  OnCreate = ConexionCreate
  OnDestroy = ConexionDestroy
  Left = 420
  Top = 160
  Height = 204
  Width = 499
  object SQLConnect: TSQLConnection
    DriverName = 'Oracle'
    GetDriverFunc = 'getSQLDriverORACLE'
    LibraryName = 'dbexpora.dll'
    Params.Strings = (
      'USER_NAME=osrodrig')
    VendorLib = 'oci.dll'
    Left = 30
    Top = 24
  end
  object SQLDataSet: TSQLDataSet
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    Left = 110
    Top = 25
  end
  object DataSetProvider: TDataSetProvider
    DataSet = SQLDataSet
    Left = 204
    Top = 26
  end
  object ClienteDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtsSesion'
    Left = 300
    Top = 26
  end
  object SQLMonitor: TSQLMonitor
    AutoSave = True
    Left = 382
    Top = 25
  end
end
