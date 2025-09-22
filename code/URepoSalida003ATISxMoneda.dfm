inherited RepoSalida003ATISxMoneda: TRepoSalida003ATISxMoneda
  DataSet = RxMDTotalesXMoneda
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  PrintIfEmpty = True
  inherited BandaDetalle: TQRBand
    Top = 251
    Height = 30
    Size.Values = (
      79.375000000000000000
      1957.916666666667000000)
    object QRDBTDescrip_Moneda: TQRDBText
      Left = 168
      Top = 5
      Width = 122
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        444.500000000000000000
        13.229166666666700000
        322.791666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = RxMDTotalesXMoneda
      DataField = 'DESCRIP_MONEDA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBTImporte: TQRDBText
      Left = 532
      Top = 5
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1407.583333333330000000
        13.229166666666700000
        156.104166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = RxMDTotalesXMoneda
      DataField = 'IMPORTE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited BandaEncabezado: TQRBand
    Height = 178
    Size.Values = (
      470.958333333333400000
      1957.916666666667000000)
    inherited QRLGire: TQRLabel
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        63.500000000000000000
        164.041666666666700000)
      FontSize = 10
    end
    inherited QRImage1: TQRImage
      Width = 89
      Height = 39
      Size.Values = (
        103.187500000000000000
        42.333333333333340000
        21.166666666666670000
        235.479166666666700000)
    end
    inherited lblNombreSistema: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        127.000000000000000000
        227.541666666666700000)
      FontSize = 8
    end
    inherited lblPagina: TQRLabel
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        21.166666666666670000
        108.479166666666700000)
      FontSize = 10
    end
    inherited lblFecha: TQRLabel
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        84.666666666666680000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        148.166666666666700000
        74.083333333333340000)
      FontSize = 10
    end
    inherited QRSysData1: TQRSysData
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        21.166666666666670000
        121.708333333333300000)
      FontSize = 10
    end
    inherited QRSysData2: TQRSysData
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        84.666666666666680000
        95.250000000000000000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        148.166666666666700000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblDateLine: TQRLabel
      Size.Values = (
        44.979166666666670000
        44.979166666666670000
        185.208333333333300000
        140.229166666666700000)
      FontSize = 8
    end
    inherited lblUsuario: TQRLabel
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        232.833333333333400000
        153.458333333333300000)
      FontSize = 10
    end
    inherited lblNombreEmpresa: TQRLabel
      Left = 291
      Width = 158
      Size.Values = (
        52.916666666666660000
        769.937500000000000000
        232.833333333333400000
        418.041666666666700000)
      Caption = 'Telef'#243'nica Argentina'
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 222
      Width = 379
      Size.Values = (
        50.270833333333330000
        587.375000000000000000
        317.500000000000000000
        1002.770833333333000000)
      Text = 'Cobranzas Rapipago- ATIS - Por Moneda'
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 312
      Top = 145
      Width = 115
      Height = 18
      Size.Values = (
        47.625000000000000000
        825.500000000000000000
        383.645833333333400000
        304.270833333333400000)
      Caption = 'Fecha de Proceso: '
      FontSize = 10
    end
  end
  object QRBand1: TQRBand [2]
    Left = 38
    Top = 281
    Width = 740
    Height = 59
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      156.104166666666700000
      1957.916666666667000000)
    BandType = rbSummary
    object QRLabel8: TQRLabel
      Left = 170
      Top = 32
      Width = 128
      Height = 17
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        449.791666666667000000
        84.666666666666700000
        338.666666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total de Cobranzas:'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QREImporte_Total: TQRExpr
      Left = 437
      Top = 32
      Width = 155
      Height = 17
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1156.229166666670000000
        84.666666666666700000
        410.104166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clSilver
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(RxMDTotalesXMoneda.IMPORTE)'
      Mask = '###,###,##0.00'
      FontSize = 10
    end
    object QRLCantidad: TQRLabel
      Left = 312
      Top = 32
      Width = 85
      Height = 17
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        825.500000000000000000
        84.666666666666700000
        224.895833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLCantidad'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand2: TQRBand [3]
    Left = 38
    Top = 216
    Width = 740
    Height = 35
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      92.604166666666680000
      1957.916666666667000000)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 168
      Top = 8
      Width = 57
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        444.500000000000000000
        21.166666666666670000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'MONEDA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 530
      Top = 8
      Width = 60
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        1402.291666666667000000
        21.166666666666670000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'IMPORTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited QryBase: TADOQuery
    AfterOpen = QryBaseAfterOpen
    SQL.Strings = (
      'Select '#39'ok'#39' from Dual')
  end
  inherited QryTotales: TADOQuery
    Left = 238
  end
  object RxMDTotalesXMoneda: TRxMemoryData
    FieldDefs = <
      item
        Name = 'ORDEN'
        DataType = ftInteger
      end
      item
        Name = 'COD_MONEDA'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DESCRIP_MONEDA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IMPORTE'
        DataType = ftFloat
      end>
    Left = 182
    Top = 110
    object RxMDTotalesXMonedaDESCRIP_MONEDA: TStringField
      FieldName = 'DESCRIP_MONEDA'
      Size = 30
    end
    object RxMDTotalesXMonedaIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
    end
    object RxMDTotalesXMonedaCOD_MONEDA: TStringField
      FieldName = 'COD_MONEDA'
      Size = 3
    end
    object RxMDTotalesXMonedaORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
  end
  object QryCobranzas: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'From GEMA.COBRANZAS_00003'
      'Where FH_PROCESO <= :pFh_Proceso and '
      '             NRO_PROCESO_GEMA = 3')
    Left = 310
    Top = 46
  end
  object QryEntidades: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <>
    SQL.Strings = (
      'Select COD_ENTIDAD, DESCRIPCION'
      'From GIRE.ENTIDADES')
    Left = 390
    Top = 46
    object QryEntidadesCOD_ENTIDAD: TIntegerField
      FieldName = 'COD_ENTIDAD'
    end
    object QryEntidadesDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
end
