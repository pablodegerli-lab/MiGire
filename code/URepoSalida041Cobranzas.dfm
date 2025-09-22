inherited RepoSalida041Cobranzas: TRepoSalida041Cobranzas
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
    Top = 265
    Width = 718
    Size.Values = (
      63.500000000000000000
      1899.708333333333000000)
    object QRDBText1: TQRDBText
      Left = 36
      Top = 0
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        0.000000000000000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TARJETA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 220
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        582.083333333333400000
        0.000000000000000000
        171.979166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CANTIDAD'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 432
      Top = 0
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1143.000000000000000000
        0.000000000000000000
        156.104166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMPORTE'
      Mask = '#0.00'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited BandaEncabezado: TQRBand
    Width = 718
    Enabled = False
    Size.Values = (
      433.916666666666700000
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
  object BandaDeTotales: TQRBand [2]
    Left = 38
    Top = 289
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
      Left = 64
      Top = 55
      Width = 151
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        169.333333333333300000
        145.520833333333300000
        399.520833333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE)'
      Mask = '#0.00'
      FontSize = 10
    end
    object CantidadTotal: TQRExpr
      Left = 58
      Top = 33
      Width = 157
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        153.458333333333300000
        87.312500000000000000
        415.395833333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.CANTIDAD)'
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 0
      Top = 11
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        29.104166666666670000
        232.833333333333400000)
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
      Left = 0
      Top = 33
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        87.312500000000000000
        164.041666666666700000)
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
      Left = 0
      Top = 55
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        145.520833333333300000
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
  object QRBand2: TQRBand [3]
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
      Left = 440
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
        1164.166666666667000000
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
      Left = 227
      Top = 43
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        600.604166666666800000
        113.770833333333300000
        153.458333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
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
      
        'select DECODE(COD_ENTIDAD_SEGUN_CIA,13,'#39'AMEX'#39',16,'#39'VISA'#39',21,'#39'MAST' +
        'ER'#39',25,'#39'DINERS'#39') Tarjeta, '
      #9'   count(1) Cantidad, sum(IMPORTE_COBRADO) Importe, fh_proceso'
      ' from @02'
      ' where @01'
      'group by COD_ENTIDAD_SEGUN_CIA, fh_proceso'
      ' '
      ' '
      ' '
      ' ')
    object QryBaseTARJETA: TStringField
      FieldName = 'TARJETA'
      ReadOnly = True
      Size = 6
    end
    object QryBaseCANTIDAD: TBCDField
      FieldName = 'CANTIDAD'
      ReadOnly = True
      Precision = 32
    end
    object QryBaseIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      ReadOnly = True
      Precision = 32
    end
    object QryBaseFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
      ReadOnly = True
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
