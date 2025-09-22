inherited RepoSalida064BancoSucursal: TRepoSalida064BancoSucursal
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
  inherited BandaDetalle: TQRBand
    Top = 238
    Height = 9
    Enabled = False
    Size.Values = (
      23.812500000000000000
      1957.916666666667000000)
  end
  inherited BandaEncabezado: TQRBand
    Height = 142
    Size.Values = (
      375.708333333333400000
      1957.916666666667000000)
    inherited QRLGire: TQRLabel
      Top = 10
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        26.458333333333330000
        164.041666666666700000)
      FontSize = 10
    end
    inherited QRImage1: TQRImage
      Top = 56
      Width = 89
      Height = 39
      Size.Values = (
        103.187500000000000000
        42.333333333333340000
        148.166666666666700000
        235.479166666666700000)
    end
    inherited lblNombreSistema: TQRLabel
      Left = 18
      Top = 28
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        74.083333333333340000
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
      Top = 25
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        66.145833333333340000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Top = 41
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        108.479166666666700000
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
      Top = 25
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        66.145833333333340000
        95.250000000000000000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Top = 41
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        108.479166666666700000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblDateLine: TQRLabel
      Left = 18
      Top = 46
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        121.708333333333300000
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
      Top = 56
      Size.Values = (
        52.916666666666660000
        783.166666666666800000
        148.166666666666700000
        391.583333333333400000)
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 177
      Top = 83
      Width = 428
      Size.Values = (
        50.270833333333330000
        468.312500000000000000
        219.604166666666700000
        1132.416666666667000000)
      Alignment = taCenter
      Text = 'Listado de totales por banco / sucursal de cable'
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 288
      Top = 104
      Width = 163
      Size.Values = (
        44.979166666666670000
        762.000000000000000000
        275.166666666666700000
        431.270833333333400000)
      Caption = 'Fecha de proceso: 99/99/99'
      FontSize = 10
    end
  end
  object QRGroupBanco: TQRGroup [2]
    Left = 38
    Top = 180
    Width = 740
    Height = 55
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      145.520833333333300000
      1957.916666666667000000)
    Expression = 'QryBase.COD_ENTIDAD'
    FooterBand = QRFooterBanco
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel7: TQRLabel
      Left = 12
      Top = 16
      Width = 45
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        31.750000000000000000
        42.333333333333340000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Banco:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 63
      Top = 16
      Width = 42
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        166.687500000000000000
        42.333333333333300000
        111.125000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_ENTIDAD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 108
      Top = 16
      Width = 92
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        285.750000000000000000
        42.333333333333340000
        243.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'RAZONSOCIAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 112
      Top = 37
      Width = 56
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        296.333333333333400000
        97.895833333333340000
        148.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sucursal'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 534
      Top = 37
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1412.875000000000000000
        97.895833333333340000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 668
      Top = 37
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1767.416666666667000000
        97.895833333333340000
        132.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
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
  object QRGroupSucursal: TQRGroup [3]
    Left = 38
    Top = 235
    Width = 740
    Height = 3
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
      7.937500000000000000
      1957.916666666667000000)
    Expression = 'QryBase.COD_SUCURSAL_CABLE'
    FooterBand = QRFooterSucursal
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRFooterBanco: TQRBand [4]
    Left = 38
    Top = 269
    Width = 740
    Height = 24
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
      63.500000000000000000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRLabel1: TQRLabel
      Left = 12
      Top = 4
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        10.583333333333330000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Subtotal:'
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
    object QRDBText4: TQRDBText
      Left = 72
      Top = 4
      Width = 56
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        190.500000000000000000
        10.583333333333300000
        148.166666666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_ENTIDAD'
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
    object QRDBText5: TQRDBText
      Left = 132
      Top = 4
      Width = 389
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        349.250000000000000000
        10.583333333333300000
        1029.229166666670000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'RAZONSOCIAL'
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
    object QRExpr4: TQRExpr
      Left = 528
      Top = 4
      Width = 63
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1397.000000000000000000
        10.583333333333300000
        166.687500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 10
    end
    object QRExpr5: TQRExpr
      Left = 612
      Top = 4
      Width = 109
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1619.250000000000000000
        10.583333333333300000
        288.395833333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE)'
      Mask = '#,###,##0.00'
      FontSize = 10
    end
  end
  object QRFooterSucursal: TQRBand [5]
    Left = 38
    Top = 247
    Width = 740
    Height = 22
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
      58.208333333333340000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRDBText3: TQRDBText
      Left = 11
      Top = 2
      Width = 156
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        29.104166666666670000
        5.291666666666667000
        412.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_SUCURSAL_CABLE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRExpr7: TQRExpr
      Left = 528
      Top = 2
      Width = 64
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1397.000000000000000000
        5.291666666666670000
        169.333333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 10
    end
    object QRExpr8: TQRExpr
      Left = 612
      Top = 2
      Width = 110
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1619.250000000000000000
        5.291666666666670000
        291.041666666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE)'
      Mask = '#,###,##0.00'
      FontSize = 10
    end
  end
  object QRBand1: TQRBand [6]
    Left = 38
    Top = 293
    Width = 740
    Height = 40
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
      105.833333333333300000
      1957.916666666667000000)
    BandType = rbSummary
    object QRExpr2: TQRExpr
      Left = 612
      Top = 19
      Width = 109
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1619.250000000000000000
        50.270833333333300000
        288.395833333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE)'
      Mask = '#,###,##0.00'
      FontSize = 10
    end
    object QRExpr1: TQRExpr
      Left = 528
      Top = 19
      Width = 62
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1397.000000000000000000
        50.270833333333300000
        164.041666666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 12
      Top = 19
      Width = 37
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        31.750000000000000000
        50.270833333333330000
        97.895833333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
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
    Parameters = <
      item
        Name = 'pFh_proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pTipoCobranza'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select A.COD_ENTIDAD,'
      '          A.COD_SUCURSAL_CABLE,'
      '          1 as CANTIDAD,'
      '          A.IMPORTE_COBRADO as IMPORTE,'
      '          B.DESCRIPCION as RAZONSOCIAL'
      'from @01 A,'
      '        GIRE.ENTIDADES B'
      'where A.FH_PROCESO <= :pFh_proceso and'
      '      A.COD_ENTIDAD = B.COD_ENTIDAD and'
      '      A.TIPO_COBRANZA = :pTipoCobranza and'
      '      MARCA = '#39'A'#39' and'
      '      A.COD_ENTIDAD <> 997'
      '      and @02'
      'order by A.COD_ENTIDAD,A.COD_SUCURSAL_CABLE')
    Left = 158
    Top = 58
    object QryBaseCOD_ENTIDAD: TIntegerField
      FieldName = 'COD_ENTIDAD'
    end
    object QryBaseCOD_SUCURSAL_CABLE: TIntegerField
      FieldName = 'COD_SUCURSAL_CABLE'
    end
    object QryBaseCANTIDAD: TBCDField
      FieldName = 'CANTIDAD'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object QryBaseIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      Precision = 11
      Size = 2
    end
    object QryBaseRAZONSOCIAL: TStringField
      FieldName = 'RAZONSOCIAL'
      Size = 40
    end
  end
  inherited QryTotales: TADOQuery
    Left = 262
    Top = 54
  end
end
