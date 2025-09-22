inherited GireEntidades: TGireEntidades
  OldCreateOrder = True
  inherited QryCab: TQuery
    DatabaseName = 'DBPrinc'
    SQL.Strings = (
      'Select * from GIRE.ENTIDADES'
      'order by COD_ENTIDAD')
    object QryCabCOD_ENTIDAD: TFloatField
      FieldName = 'COD_ENTIDAD'
    end
    object QryCabDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QryCabABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Size = 10
    end
    object QryCabDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 30
    end
    object QryCabLOCALIDAD: TStringField
      FieldName = 'LOCALIDAD'
      Size = 30
    end
    object QryCabCOD_PROVINCIA: TFloatField
      FieldName = 'COD_PROVINCIA'
    end
    object QryCabCOD_POSTAL: TStringField
      FieldName = 'COD_POSTAL'
      Size = 8
    end
    object QryCabCUIT: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
    object QryCabTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 10
    end
    object QryCabFH_ACTUALIZACION: TDateTimeField
      FieldName = 'FH_ACTUALIZACION'
    end
    object QryCabUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 10
    end
  end
  inherited UpdCab: TUpdateSQL
    ModifySQL.Strings = (
      'update GIRE.ENTIDADES'
      'set'
      '  COD_ENTIDAD = : COD_ENTIDAD,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  ABREVIATURA = :ABREVIATURA,'
      'where'
      '  COD_ENTIDAD = :OLD_COD_ENTIDAD ')
    InsertSQL.Strings = (
      'insert into GIRE.ENTIDADES'
      '  (COD_ENTIDAD, DESCRIPCION, ABREVIATURA)'
      'values'
      '  (:COD_ENTIDAD, :DESCRIPCION, :ABREVIATURA)')
    DeleteSQL.Strings = (
      'delete from GIRE.ENTIDADES'
      'where'
      '  COD_ENTIDAD = :OLD_COD_ENTIDAD')
  end
end
