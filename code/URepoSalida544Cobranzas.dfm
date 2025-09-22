inherited RepoSalida544Cobranzas: TRepoSalida544Cobranzas
  Width = 794
  Height = 1123
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.PaperSize = A4
  Page.Values = (
    100.000000000000000000
    2970.000000000000000000
    100.000000000000000000
    2100.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  inherited BandaDetalle: TQRBand
    Top = 305
    Width = 718
    Size.Values = (
      63.500000000000000000
      1899.708333333333000000)
    object QRDBText5: TQRDBText
      Left = 455
      Top = 0
      Width = 117
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1203.854166666670000000
        0.000000000000000000
        309.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_PRESENTACION'
      Mask = 'dd/mm/yyyy'
      Transparent = False
      WordWrap = False
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 2
      Top = 0
      Width = 91
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        5.291666666666670000
        0.000000000000000000
        240.770833333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CBU_TARJETA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 249
      Top = 0
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        658.812500000000000000
        0.000000000000000000
        293.687500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NUMERO_CUPON'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 136
      Top = 0
      Width = 131
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        359.833333333333000000
        0.000000000000000000
        346.604166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMPORTE_COBRADO'
      Mask = '#0.00'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 301
      Top = 0
      Width = 117
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        0.000000000000000000
        309.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NUMERO_LOTE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited BandaEncabezado: TQRBand
    Width = 718
    Enabled = False
    Size.Values = (
      433.916666666666800000
      1899.708333333333000000)
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
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        127.000000000000000000
        227.541666666666700000)
      FontSize = 8
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
      Left = 285
      Size.Values = (
        52.916666666666660000
        754.062500000000000000
        232.833333333333400000
        391.583333333333400000)
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Size.Values = (
        50.270833333333330000
        857.250000000000000000
        317.500000000000000000
        240.770833333333300000)
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 257
      Width = 204
      Size.Values = (
        44.979166666666670000
        679.979166666666800000
        370.416666666666700000
        539.750000000000000000)
      Caption = 'Listado de presentaci'#243'n por Tarjeta'
      FontSize = 10
    end
  end
  object GrupoTarjetas: TQRGroup [2]
    Left = 38
    Top = 265
    Width = 718
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
      1899.708333333333000000)
    Expression = 'cod_entidad'
    FooterBand = BandaSubTotal
    Master = Owner
    ReprintOnNewPage = False
  end
  object BandaSubTotal: TQRBand [3]
    Left = 38
    Top = 329
    Width = 718
    Height = 64
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      169.333333333333300000
      1899.708333333333000000)
    BandType = rbGroupFooter
    object ImportePorTarjeta: TQRExpr
      Left = 114
      Top = 38
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        301.625000000000000000
        100.541666666667000000
        354.541666666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(importe_cobrado)'
      Mask = '#0.00'
      FontSize = 10
    end
    object CantidadPorTarjeta: TQRExpr
      Left = 79
      Top = 16
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        209.020833333333000000
        42.333333333333300000
        140.229166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'COUNT()'
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 0
      Top = 0
      Width = 82
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        0.000000000000000000
        0.000000000000000000
        216.958333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Tarjeta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      OnPrint = QRLabel3Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 0
      Top = 16
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        0.000000000000000000
        42.333333333333300000
        164.041666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad:'
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
    object QRLabel5: TQRLabel
      Left = 0
      Top = 38
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        0.000000000000000000
        100.541666666667000000
        238.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe Total:'
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
  object BandaDeTotales: TQRBand [4]
    Left = 38
    Top = 393
    Width = 718
    Height = 72
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      190.500000000000000000
      1899.708333333333000000)
    BandType = rbSummary
    object ImporteTotal: TQRExpr
      Left = 418
      Top = 46
      Width = 134
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1105.958333333330000000
        121.708333333333000000
        354.541666666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(importe_cobrado)'
      Mask = '#0.00'
      FontSize = 10
    end
    object CantidadTotal: TQRExpr
      Left = 382
      Top = 24
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1010.708333333330000000
        63.500000000000000000
        140.229166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'COUNT()'
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 304
      Top = 0
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        804.333333333333000000
        0.000000000000000000
        232.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total General'
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
    object QRLabel10: TQRLabel
      Left = 304
      Top = 24
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        804.333333333333000000
        63.500000000000000000
        164.041666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad:'
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
    object QRLabel11: TQRLabel
      Left = 304
      Top = 46
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        804.333333333333000000
        121.708333333333000000
        238.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe Total:'
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
  object QRBand2: TQRBand [5]
    Left = 38
    Top = 202
    Width = 718
    Height = 63
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
      166.687500000000000000
      1899.708333333333000000)
    BandType = rbTitle
    object QRLabel13: TQRLabel
      Left = 0
      Top = 18
      Width = 52
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        0.000000000000000000
        47.625000000000000000
        137.583333333333300000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '<fecha:>'
      Color = clWhite
      OnPrint = QRLabel13Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 0
      Top = 2
      Width = 204
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        0.000000000000000000
        5.291666666666667000
        539.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Listado de presentaci'#243'n por Tarjeta'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 47
      Top = 43
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        124.354166666666700000
        113.770833333333300000
        121.708333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tarjeta'
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
    object QRLabel8: TQRLabel
      Left = 216
      Top = 43
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        571.500000000000000000
        113.770833333333300000
        132.291666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe'
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
    object QRLabel7: TQRLabel
      Left = 292
      Top = 43
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        772.583333333333400000
        113.770833333333300000
        179.916666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nro Cup'#243'n'
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
    object QRLabel1: TQRLabel
      Left = 388
      Top = 43
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1026.583333333330000000
        113.770833333333000000
        76.729166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Lote'
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
    object QRLabel6: TQRLabel
      Left = 453
      Top = 43
      Width = 127
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1198.562500000000000000
        113.770833333333000000
        336.020833333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Presentaci'#243'n'
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
    CursorType = ctStatic
    SQL.Strings = (
      
        'select C.COD_ENTIDAD, E.ABREVIATURA, CBU_TARJETA, IMPORTE_COBRAD' +
        'O, NUMERO_CUPON,'
      '       NUMERO_LOTE, FH_PRESENTACION,FH_PROCESO'
      'from GEMA.COBRANZAS_00544 C, GIRE.ENTIDADES E'
      'where C.COD_ENTIDAD = E.COD_ENTIDAD '
      
        'order  by C.COD_ENTIDAD, E.ABREVIATURA, CBU_TARJETA, IMPORTE_COB' +
        'RADO, NUMERO_CUPON, '
      '       NUMERO_LOTE, FH_PRESENTACION,FH_PROCESO '
      ' '
      ' '
      ' '
      ' ')
    object QryBaseCOD_ENTIDAD: TIntegerField
      FieldName = 'COD_ENTIDAD'
    end
    object QryBaseABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Size = 10
    end
    object QryBaseCBU_TARJETA: TStringField
      FieldName = 'CBU_TARJETA'
      Size = 23
    end
    object QryBaseIMPORTE_COBRADO: TBCDField
      FieldName = 'IMPORTE_COBRADO'
      Precision = 11
      Size = 2
    end
    object QryBaseNUMERO_CUPON: TIntegerField
      FieldName = 'NUMERO_CUPON'
    end
    object QryBaseNUMERO_LOTE: TIntegerField
      FieldName = 'NUMERO_LOTE'
    end
    object QryBaseFH_PRESENTACION: TDateTimeField
      FieldName = 'FH_PRESENTACION'
    end
    object QryBaseFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
  end
  inherited QryTotales: TADOQuery
    Parameters = <
      item
        Name = 'p0'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNP0'
        Size = -1
        Value = Null
      end
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNP1'
        Size = -1
        Value = Null
      end
      item
        Name = 'p2'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNP2'
        Size = -1
        Value = Null
      end
      item
        Name = 'p3'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNP3'
        Size = -1
        Value = Null
      end
      item
        Name = 'p4'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNP4'
        Size = -1
        Value = Null
      end
      item
        Name = 'p5'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNP5'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select  count(9) as CANTIDAD, sum(IMPORTE) as IMPORTE '
      'from ('
      '  (select IMPORTE_EN_PESOS as IMPORTE'
      '   from GEMA.COBRANZAS_00017'
      
        '   where MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p0,'#39'dd/mm/yyyy'#39')' +
        ' and'
      
        '         IMPORTE_EN_PESOS > 0 and NRO_PROCESO_GEMA = :pNP0 and C' +
        'OD_ENTIDAD = '#39'997'#39
      'union all'
      '   select  IMPORTE_MONEDA_1 as IMPORTE'
      '   from GEMA.COBRANZAS_00017'
      
        '   where MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p1,'#39'dd/mm/yyyy'#39')' +
        ' and'
      
        '         IMPORTE_MONEDA_1 > 0 and NRO_PROCESO_GEMA= :pNP1 and CO' +
        'D_ENTIDAD = '#39'997'#39
      'union all'
      '   select IMPORTE_MONEDA_2 as IMPORTE '
      '   from GEMA.COBRANZAS_00017'
      
        '   where MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p2,'#39'dd/mm/yyyy'#39')' +
        ' and'
      
        '         IMPORTE_MONEDA_2 > 0 and NRO_PROCESO_GEMA= :pNP2 and CO' +
        'D_ENTIDAD = '#39'997'#39
      'union all'
      '   select IMPORTE_MONEDA_3 as IMPORTE'
      '   from GEMA.COBRANZAS_00017'
      
        '   where MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p3,'#39'dd/mm/yyyy'#39')' +
        ' and'
      
        '         IMPORTE_MONEDA_3 > 0 and NRO_PROCESO_GEMA= :pNP3 and CO' +
        'D_ENTIDAD = '#39'997'#39
      'union all'
      '   select IMPORTE_MONEDA_4 as IMPORTE'
      '   from GEMA.COBRANZAS_00017'
      
        '   where MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p4,'#39'dd/mm/yyyy'#39')' +
        ' and'
      
        '         IMPORTE_MONEDA_4 > 0 and NRO_PROCESO_GEMA= :pNP4 and CO' +
        'D_ENTIDAD = '#39'997'#39
      'union all'
      '   select IMPORTE_COBRADO as IMPORTE'
      '   from GEMA.COBRANZAS_00017'
      
        '   where MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p5,'#39'dd/mm/yyyy'#39')' +
        ' and'
      '         IMPORTE_EN_PESOS = 0 and IMPORTE_MONEDA_1 = 0 and'
      '         IMPORTE_MONEDA_2 = 0 and IMPORTE_MONEDA_3 = 0 and'
      
        '         IMPORTE_MONEDA_4 = 0 and NRO_PROCESO_GEMA= :pNP5 and CO' +
        'D_ENTIDAD = '#39'997'#39'))'
      'having Count(1) > 0')
    Left = 262
  end
end
