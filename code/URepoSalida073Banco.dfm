inherited RepoSalida073Banco: TRepoSalida073Banco
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
    Top = 244
    Height = 5
    Enabled = False
    Size.Values = (
      13.229166666666670000
      1957.916666666667000000)
  end
  inherited BandaEncabezado: TQRBand
    Height = 172
    Size.Values = (
      455.083333333333300000
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
      Size.Values = (
        103.187500000000000000
        42.333333333333340000
        21.166666666666670000
        235.479166666666700000)
    end
    inherited lblNombreSistema: TQRLabel
      Width = 107
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        127.000000000000000000
        283.104166666666700000)
      Font.Height = -13
      FontSize = 10
    end
    inherited lblPagina: TQRLabel
      Size.Values = (
        44.979166666666700000
        1558.395833333330000000
        21.166666666666700000
        108.479166666667000000)
      FontSize = 10
    end
    inherited lblFecha: TQRLabel
      Size.Values = (
        44.979166666666700000
        1558.395833333330000000
        84.666666666666700000
        97.895833333333300000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Size.Values = (
        44.979166666666700000
        1558.395833333330000000
        148.166666666667000000
        74.083333333333300000)
      FontSize = 10
    end
    inherited QRSysData1: TQRSysData
      Size.Values = (
        44.979166666666700000
        1748.895833333330000000
        21.166666666666700000
        121.708333333333000000)
      FontSize = 10
    end
    inherited QRSysData2: TQRSysData
      Size.Values = (
        44.979166666666700000
        1748.895833333330000000
        84.666666666666700000
        95.250000000000000000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Size.Values = (
        44.979166666666700000
        1748.895833333330000000
        148.166666666667000000
        97.895833333333300000)
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
      Size.Values = (
        52.916666666666660000
        783.166666666666800000
        232.833333333333400000
        391.583333333333400000)
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 200
      Top = 126
      Width = 340
      Size.Values = (
        50.270833333333330000
        529.166666666666800000
        333.375000000000000000
        899.583333333333400000)
      Alignment = taCenter
      AlignToBand = True
      Text = 'Totales de presentacion por Banco'
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 288
      Top = 148
      Width = 163
      Size.Values = (
        44.979166666666670000
        762.000000000000000000
        391.583333333333400000
        431.270833333333400000)
      Caption = 'Fecha de proceso: 99/99/99'
      FontSize = 10
    end
  end
  object QRGroup1: TQRGroup [2]
    Left = 38
    Top = 240
    Width = 740
    Height = 4
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
      10.583333333333330000
      1957.916666666667000000)
    Expression = 'QryBase.ENTIDAD'
    FooterBand = QRBand2
    Master = Owner
    ReprintOnNewPage = False
  end
  object QRBand1: TQRBand [3]
    Left = 38
    Top = 275
    Width = 740
    Height = 28
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
      74.083333333333340000
      1957.916666666667000000)
    BandType = rbSummary
    object QRExpr1: TQRExpr
      Left = 374
      Top = 4
      Width = 64
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        989.541666666667000000
        10.583333333333300000
        169.333333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 10
    end
    object QRExpr2: TQRExpr
      Left = 462
      Top = 4
      Width = 109
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1222.375000000000000000
        10.583333333333300000
        288.395833333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE)'
      Mask = '###,##0.00'
      FontSize = 10
    end
    object QRExpr3: TQRExpr
      Left = 582
      Top = 4
      Width = 101
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1539.875000000000000000
        10.583333333333300000
        267.229166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.COMISION)'
      Mask = '###,##0.00'
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 14
      Top = 4
      Width = 47
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        37.041666666666700000
        10.583333333333300000
        124.354166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Totales'
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
  object ChildBand1: TQRChildBand [4]
    Left = 38
    Top = 210
    Width = 740
    Height = 30
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      79.375000000000000000
      1957.916666666667000000)
    ParentBand = BandaEncabezado
    object QRLabel1: TQRLabel
      Left = 16
      Top = 8
      Width = 41
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        21.166666666666670000
        108.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Banco'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 72
      Top = 8
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        190.500000000000000000
        21.166666666666670000
        198.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Descripci'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 384
      Top = 8
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1016.000000000000000000
        21.166666666666670000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 518
      Top = 8
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1370.541666666670000000
        21.166666666666700000
        132.291666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 625
      Top = 8
      Width = 60
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1653.645833333330000000
        21.166666666666700000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Comision'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand2: TQRBand [5]
    Left = 38
    Top = 249
    Width = 740
    Height = 26
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
      68.791666666666680000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRDBTBanco: TQRDBText
      Left = 6
      Top = 5
      Width = 48
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        15.875000000000000000
        13.229166666666700000
        127.000000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'ENTIDAD'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBTRazon: TQRDBText
      Left = 71
      Top = 5
      Width = 300
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        187.854166666667000000
        13.229166666666700000
        793.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'RAZONSOCIAL'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRExpr4: TQRExpr
      Left = 376
      Top = 5
      Width = 64
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        994.833333333333000000
        13.229166666666700000
        169.333333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 10
    end
    object QRExpr5: TQRExpr
      Left = 460
      Top = 5
      Width = 110
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1217.083333333330000000
        13.229166666666700000
        291.041666666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE)'
      Mask = '###,##0.00'
      FontSize = 10
    end
    object QRExpr6: TQRExpr
      Left = 584
      Top = 5
      Width = 101
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1545.166666666670000000
        13.229166666666700000
        267.229166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.COMISION)'
      Mask = '###,##0.00'
      FontSize = 10
    end
  end
  inherited QryBase: TADOQuery
    Parameters = <
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT A.COD_ENTIDAD_SEGUN_CIA as ENTIDAD,'
      #9#9'   B.DESCRIPCION as RAZONSOCIAL,'
      #9'  '#9' NVL(A.IMPORTE_COBRADO,0) as IMPORTE,'
      #9#9'   NVL(A.COMISION,0) as COMISION'
      'FROM GEMA.COBRANZAS_00073 A,'
      #9#9' GIRE.ENTIDADES B'
      'WHERE A.COD_ENTIDAD_SEGUN_CIA = B.COD_ENTIDAD and'
      #9#9#9' A.FH_PROCESO = :pFh_Proceso'
      'ORDER BY ENTIDAD')
    object QryBaseENTIDAD: TIntegerField
      FieldName = 'ENTIDAD'
    end
    object QryBaseRAZONSOCIAL: TStringField
      FieldName = 'RAZONSOCIAL'
      Size = 40
    end
    object QryBaseIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object QryBaseCOMISION: TBCDField
      FieldName = 'COMISION'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
  end
end
