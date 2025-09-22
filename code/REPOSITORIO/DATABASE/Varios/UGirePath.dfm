inherited GirePath: TGirePath
  OldCreateOrder = True
  Left = 197
  Top = 152
  Height = 386
  Width = 556
  inherited QryCab: TQuery
    SQL.Strings = (
      'select A.COD_SISTEMA , B.DESCRIPCION AS SISTEMA, '
      'A.COD_PATH AS CODPATH, A.PATH, A.USUARIO, '
      'A.FH_ACTUALIZACION '
      'from GIRE.PATHS A, GIRE.SISTEMAS B '
      'where A.COD_SISTEMA = B.COD_SISTEMA')
  end
end
