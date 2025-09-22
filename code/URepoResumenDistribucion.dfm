inherited RepoResumenDistribucion: TRepoResumenDistribucion
  Width = 1056
  Height = 816
  DataSet = QryBaseReporte
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Orientation = poLandscape
  Page.Values = (
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  ShowProgress = False
  inherited BandaDetalle: TQRBand
    Top = 248
    Width = 980
    BeforePrint = BandaDetalleBeforePrint
    Size.Values = (
      63.500000000000000000
      2592.916666666667000000)
    object QRDBTArchivo: TQRDBText
      Left = 4
      Top = 1
      Width = 301
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        10.583333333333330000
        2.645833333333333000
        796.395833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'NOMBRE_ARCHIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTTipo_Archivo: TQRDBText
      Left = 302
      Top = 1
      Width = 195
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        799.041666666666800000
        2.645833333333333000
        515.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataField = 'DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTFh_Distri: TQRDBText
      Left = 496
      Top = 1
      Width = 120
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        1312.333333333333000000
        2.645833333333333000
        317.500000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = QryBaseReporte
      DataField = 'FH_ACTUALIZACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTMovimientos: TQRDBText
      Left = 658
      Top = 4
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1740.958333333333000000
        10.583333333333330000
        206.375000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'CANTIDAD_MOVIMIENTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '######'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTRegistros: TQRDBText
      Left = 771
      Top = 4
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2039.937500000000000000
        10.583333333333330000
        211.666666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'CANTIDAD_REGISTROS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '######'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTImporte: TQRDBText
      Left = 880
      Top = 4
      Width = 94
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2328.333333333333000000
        10.583333333333330000
        248.708333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'IMPORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '######0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTNro: TQRDBText
      Left = 615
      Top = 1
      Width = 27
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        1627.187500000000000000
        2.645833333333333000
        71.437500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataField = 'NRO_CORRIDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  inherited BandaEncabezado: TQRBand
    Width = 980
    Height = 166
    Size.Values = (
      439.208333333333400000
      2592.916666666667000000)
    inherited QRImage1: TQRImage
      Width = 89
      Size.Values = (
        103.187500000000000000
        42.333333333333340000
        21.166666666666670000
        235.479166666666700000)
      AutoSize = True
    end
    inherited lblNombreSistema: TQRLabel
      Width = 130
      Height = 19
      Size.Values = (
        50.270833333333330000
        42.333333333333340000
        127.000000000000000000
        343.958333333333400000)
      Font.Color = clBlack
      Font.Height = -15
      Font.Style = [fsBold]
      ParentFont = False
      FontSize = 11
    end
    inherited lblPagina: TQRLabel
      Left = 822
      Size.Values = (
        44.979166666666670000
        2174.875000000000000000
        21.166666666666670000
        108.479166666666700000)
      FontSize = 10
    end
    inherited lblFecha: TQRLabel
      Left = 822
      Size.Values = (
        44.979166666666670000
        2174.875000000000000000
        84.666666666666680000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Left = 822
      Size.Values = (
        44.979166666666670000
        2174.875000000000000000
        148.166666666666700000
        74.083333333333340000)
      FontSize = 10
    end
    inherited QRSysData1: TQRSysData
      Left = 894
      Size.Values = (
        44.979166666666670000
        2365.375000000000000000
        21.166666666666670000
        121.708333333333300000)
      FontSize = 10
    end
    inherited QRSysData2: TQRSysData
      Left = 894
      Size.Values = (
        44.979166666666670000
        2365.375000000000000000
        84.666666666666680000
        95.250000000000000000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Left = 894
      Size.Values = (
        44.979166666666670000
        2365.375000000000000000
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
      Left = 395
      Top = 43
      Width = 189
      Height = 23
      Size.Values = (
        60.854166666666680000
        1045.104166666667000000
        113.770833333333300000
        500.062500000000000000)
      Caption = 'Distribuci'#243'n de Archivos'
      Font.Height = -16
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Top = 112
      Size.Values = (
        44.979166666666670000
        867.833333333333500000
        296.333333333333400000
        190.500000000000000000)
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 311
      Top = 103
      Width = 55
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        822.854166666666600000
        272.520833333333400000
        145.520833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Empresa:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 311
      Top = 124
      Width = 50
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        822.854166666666600000
        328.083333333333400000
        132.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Proceso:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLProceso: TQRLabel
      Left = 371
      Top = 124
      Width = 191
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        981.604166666666800000
        328.083333333333400000
        505.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C'#243'digo y Descripcion del Proceso'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLCia: TQRLabel
      Left = 371
      Top = 103
      Width = 209
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        981.604166666666800000
        272.520833333333400000
        552.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C'#243'digo y Razon Social de la Empresa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLCopia: TQRLabel
      Left = 818
      Top = 141
      Width = 144
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2164.291666666667000000
        373.062500000000000000
        381.000000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Original / Reimpresion'
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
  object BandaTitulos: TQRChildBand
    Left = 38
    Top = 204
    Width = 980
    Height = 41
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
      108.479166666666700000
      2592.916666666667000000)
    ParentBand = BandaEncabezado
    object QRLabel5: TQRLabel
      Left = 537
      Top = 19
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1420.812500000000000000
        50.270833333333330000
        201.083333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Distribuci'#243'n'
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
      Left = 8
      Top = 19
      Width = 116
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        50.270833333333330000
        306.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Archivo Generado'
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
      Left = 301
      Top = 19
      Width = 101
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        796.395833333333400000
        50.270833333333330000
        267.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Archivo'
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
      Left = 655
      Top = 19
      Width = 81
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1733.020833333333000000
        50.270833333333330000
        214.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Movimientos'
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
    object QRLabel9: TQRLabel
      Left = 783
      Top = 19
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2071.687500000000000000
        50.270833333333330000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Registros'
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
      Left = 935
      Top = 19
      Width = 33
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2473.854166666667000000
        50.270833333333330000
        87.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
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
    object QRLabel14: TQRLabel
      Left = 658
      Top = 3
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1740.958333333333000000
        7.937500000000000000
        206.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad de'
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
    object QRLabel15: TQRLabel
      Left = 773
      Top = 3
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2045.229166666667000000
        7.937500000000000000
        206.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad de'
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
    object QRLabel16: TQRLabel
      Left = 925
      Top = 3
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2447.395833333333000000
        7.937500000000000000
        132.291666666666700000)
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 514
      Top = 3
      Width = 125
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1359.958333333333000000
        7.937500000000000000
        330.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha y N'#250'mero de'
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
  object BandaGrupo: TQRGroup
    Left = 38
    Top = 245
    Width = 980
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
      2592.916666666667000000)
    FooterBand = BandaPie
    Master = Owner
    ReprintOnNewPage = False
  end
  object BandaPie: TQRBand
    Left = 38
    Top = 272
    Width = 980
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      82.020833333333340000
      2592.916666666667000000)
    BandType = rbGroupFooter
    object QREMovimientos: TQRExpr
      Left = 635
      Top = 8
      Width = 101
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1680.104166666667000000
        21.166666666666670000
        267.229166666666700000)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Mask = '#######'
      FontSize = 10
    end
    object QRERegistros: TQRExpr
      Left = 768
      Top = 8
      Width = 84
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2032.000000000000000000
        21.166666666666670000
        222.250000000000000000)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Mask = '#######'
      FontSize = 10
    end
    object QREImporte: TQRExpr
      Left = 881
      Top = 8
      Width = 94
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2330.979166666667000000
        21.166666666666670000
        248.708333333333300000)
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
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Mask = '######0.00'
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 10
      Top = 8
      Width = 164
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        26.458333333333330000
        21.166666666666670000
        433.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Subtotal distribuci'#243'n del: '
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
    object QRDBTFechadistribu: TQRDBText
      Left = 176
      Top = 8
      Width = 129
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        465.666666666666700000
        21.166666666666670000
        341.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clSilver
      DataField = 'FH_ACTUALIZACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 10
    end
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 303
    Width = 980
    Height = 33
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
      87.312500000000000000
      2592.916666666667000000)
    BandType = rbSummary
    object QRETotMovimientos: TQRExpr
      Left = 635
      Top = 6
      Width = 101
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1680.104166666667000000
        15.875000000000000000
        267.229166666666700000)
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
      Mask = '#######'
      FontSize = 10
    end
    object QRETotRegistros: TQRExpr
      Left = 768
      Top = 6
      Width = 84
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2032.000000000000000000
        15.875000000000000000
        222.250000000000000000)
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
      Mask = '#######'
      FontSize = 10
    end
    object QRETotImporte: TQRExpr
      Left = 881
      Top = 6
      Width = 94
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2330.979166666667000000
        15.875000000000000000
        248.708333333333300000)
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
      Mask = '######0.00'
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 10
      Top = 6
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        26.458333333333330000
        15.875000000000000000
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
  end
  object QryBaseReporte: TADOQuery
    Connection = GemaConexion.ADOConec
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
      end
      item
        Name = 'pFh_Distribucion'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_Corrida'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'pNro_CorridaB'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select A.*,'
      '           B.DESCRIPCION'
      'From GEMA.RESUMENES A,'
      '         GEMA.TIPOS_DE_ARCHIVO B,'
      '         GIRE.CIAS C'
      'Where A.COD_CIA = :pCod_Cia and'
      '             A.NRO_PROCESO = :pNro_Proceso and'
      '              A.FH_DISTRIBUCION = :pFh_Distribucion and'
      
        '              (A.NRO_CORRIDA = :pNro_Corrida or :pNro_CorridaB =' +
        ' 0) and'
      '                A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO'
      '                and A.COD_CIA = C.COD_CIA'
      
        '                and ((c.IMPRIME_ARCHIVOS_VACIOS = 0 and A.IMPORT' +
        'E > 0) or (c.IMPRIME_ARCHIVOS_VACIOS = 1))'
      
        'order by A.FH_DISTRIBUCION,A.NRO_CORRIDA,A.COD_TIPO_ARCHIVO,A.NO' +
        'MBRE_ARCHIVO'
      ''
      '')
    Left = 206
    Top = 40
    object QryBaseReporteCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
    end
    object QryBaseReporteNRO_PROCESO: TIntegerField
      FieldName = 'NRO_PROCESO'
    end
    object QryBaseReporteCOD_TIPO_ARCHIVO: TStringField
      FieldName = 'COD_TIPO_ARCHIVO'
      Size = 2
    end
    object QryBaseReporteCOD_DISENO: TStringField
      FieldName = 'COD_DISENO'
      Size = 10
    end
    object QryBaseReporteNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object QryBaseReporteFH_DISTRIBUCION: TDateTimeField
      FieldName = 'FH_DISTRIBUCION'
    end
    object QryBaseReporteNRO_CORRIDA: TIntegerField
      FieldName = 'NRO_CORRIDA'
    end
    object QryBaseReporteNOMBRE_ARCHIVO: TStringField
      FieldName = 'NOMBRE_ARCHIVO'
      Size = 30
    end
    object QryBaseReporteCANTIDAD_REGISTROS: TIntegerField
      FieldName = 'CANTIDAD_REGISTROS'
    end
    object QryBaseReporteCANTIDAD_MOVIMIENTOS: TIntegerField
      FieldName = 'CANTIDAD_MOVIMIENTOS'
    end
    object QryBaseReporteIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      Precision = 14
      Size = 2
    end
    object QryBaseReporteUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object QryBaseReporteFH_ACTUALIZACION: TDateTimeField
      FieldName = 'FH_ACTUALIZACION'
    end
    object QryBaseReporteDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
end
