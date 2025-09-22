object ADOConexion: TADOConexion
  OldCreateOrder = False
  OnCreate = ConexionCreate
  OnDestroy = ConexionDestroy
  Left = 370
  Top = 242
  Height = 479
  Width = 741
  object ADOConec: TADOConnection
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle'
    Left = 32
    Top = 24
  end
  object qUsuarioParams: TADOQuery
    Connection = ADOConec
    OnWillChangeRecordset = qUsuarioParamsWillChangeRecordset
    Parameters = <>
    Left = 112
    Top = 24
  end
  object qModParams: TADOQuery
    Connection = ADOConec
    Parameters = <>
    Left = 204
    Top = 4
  end
  object qInsParams: TADOQuery
    Connection = ADOConec
    Parameters = <>
    Left = 205
    Top = 50
  end
  object qDelParams: TADOQuery
    Connection = ADOConec
    Parameters = <>
    Left = 206
    Top = 95
  end
  object ADOConec2: TADOConnection
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle'
    Left = 32
    Top = 80
  end
end
