object DMDetalleFacturacion: TDMDetalleFacturacion
  OldCreateOrder = False
  Left = 966
  Top = 215
  Height = 253
  Width = 400
  object QryCiasGema: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select A.COD_CIA as CIA,'
      '           B.COD_CIA, B.DESCRIPCION as RAZONSOCIAL'
      'from GEMA.CIAS A,'
      '        GIRE.CIAS B'
      'where A.COD_CIA = B.COD_CIA'
      'order by RAZONSOCIAL')
    Left = 40
    Top = 8
  end
  object QryServiciosXCia: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pCod_Cia'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select A.COD_SERVICIO AS SERVICIO,'
      '           A.COD_TIPO_ARCHIVO AS TIPOARCHIVO,'
      '           B.DESCRIPCION AS DESCRIPCION'
      'from GEMA.DISTRIBUCIONES_SERVICIO A,'
      '        GEMA.SERVICIOS B'
      'where A.COD_CIA = :pCod_Cia AND A.COD_SERVICIO = B.COD_SERVICIO')
    Left = 40
    Top = 56
  end
  object QryDetalle: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM GEMA.RESUMENES')
    Left = 144
    Top = 8
  end
end
