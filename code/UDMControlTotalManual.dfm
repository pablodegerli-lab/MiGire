object DMControlTotalManual: TDMControlTotalManual
  OldCreateOrder = False
  Left = 225
  Top = 131
  Height = 287
  Width = 529
  object QryServicios: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
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
      'Select  A.COD_CIA,'
      '        A.NRO_PROCESO,'
      '        A.COD_SERVICIO,'
      '        B.DESCRIPCION,'
      '        B.COD_PROCESO,'
      '        A.COD_TIPO_ARCHIVO,'
      '        A.CONDICION,'
      '        C.NOMBRE_TABLA_ORA,'
      '        0 as CANTIDAD,'
      '        0 as IMPORTE'
      'from GEMA.DISTRIBUCIONES_SERVICIO A,'
      '     GEMA.SERVICIOS B,'
      '     GEMA.TIPOS_DE_ARCHIVO C'
      'where A.COD_SERVICIO = B.COD_SERVICIO and'
      '        A.COD_CIA = :pCod_Cia and'
      '          A.NRO_PROCESO = :pNro_Proceso and'
      '            A.COD_TIPO_ARCHIVO = C.COD_TIPO_ARCHIVO'
      'order by A.COD_SERVICIO')
    Left = 45
    Top = 24
    object QryServiciosCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryServiciosNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryServiciosCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
    end
    object QryServiciosDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object QryServiciosCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryServiciosNOMBRE_TABLA_ORA: TStringField
      FieldName = 'NOMBRE_TABLA_ORA'
      Size = 30
    end
    object QryServiciosCONDICION: TStringField
      FieldName = 'CONDICION'
      Size = 50
    end
    object QryServiciosCOD_PROCESO: TIntegerField
      FieldName = 'COD_PROCESO'
    end
    object QryServiciosCANTIDAD: TBCDField
      FieldName = 'CANTIDAD'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object QryServiciosIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
  end
  object ADOCtrlTotalesGema: TADOCtrlTotales
    Conexion = GemaConexion.ADOConec
    NroProceso = 1
    CodProceso = 100
    ShowErrorMsg = False
    Left = 48
    Top = 96
  end
  object MDTotalesControl: TRxMemoryData
    FieldDefs = <
      item
        Name = 'COD_SERVICIO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FH_PROCESO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'IMPORTE'
        DataType = ftFloat
      end
      item
        Name = 'CANTIDAD_CTRL'
        DataType = ftInteger
      end
      item
        Name = 'IMPORTE_CTRL'
        DataType = ftFloat
      end
      item
        Name = 'COD_PROCESO'
        DataType = ftInteger
      end>
    BeforeDelete = MDTotalesControlBeforeDelete
    Left = 256
    Top = 24
    object MDTotalesControlCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
    end
    object MDTotalesControlDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object MDTotalesControlCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      DisplayFormat = '###,###,##0'
      EditFormat = '###,###,##0'
    end
    object MDTotalesControlIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      EditFormat = '########0.00'
    end
    object MDTotalesControlFH_PROCESO: TStringField
      FieldName = 'FH_PROCESO'
    end
    object MDTotalesControlCANTIDAD_CTRL: TIntegerField
      FieldName = 'CANTIDAD_CTRL'
      DisplayFormat = '###,###,##0'
      EditFormat = '###,###,##0'
    end
    object MDTotalesControlIMPORTE_CTRL: TFloatField
      FieldName = 'IMPORTE_CTRL'
      DisplayFormat = '########0.00'
      EditFormat = '########0.00'
    end
    object MDTotalesControlCOD_PROCESO: TIntegerField
      FieldName = 'COD_PROCESO'
    end
  end
  object QryTotales: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
    Parameters = <>
    Left = 168
    Top = 24
  end
  object TblMovimientos: TADOTable
    Connection = GemaConexion.ADOConec
    CursorLocation = clUseServer
    Left = 160
    Top = 96
  end
end
