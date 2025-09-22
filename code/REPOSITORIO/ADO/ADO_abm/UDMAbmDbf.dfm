inherited DMAbmDbf: TDMAbmDbf
  OldCreateOrder = True
  Left = 192
  Top = 122
  Height = 267
  Width = 477
  inherited QryCab: TADOQuery
    AfterPost = QryCabAfterPost
    Left = 40
  end
  inherited QryGirePath: TADOQuery
    Left = 120
  end
  object DBTABLAS: TApolloDatabase
    DataPathAlias = 'TABLASDBF'
    Left = 40
    Top = 80
  end
  object ABMEntorno: TApolloEnv
    ApplyTo = [atLocal]
    Deleted = True
    OptimisticBuffer = True
    Left = 120
    Top = 80
  end
  object TblCabDBF: TApolloTable
    DatabaseName = 'FERIADOS'
    FieldDefs = <>
    Sequenced = False
    TableType = ttSXNTX
    OnPostError = TblCabDBFPostError
    Left = 40
    Top = 136
  end
end
