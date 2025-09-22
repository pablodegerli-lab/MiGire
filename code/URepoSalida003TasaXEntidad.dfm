inherited RepoSalida003TasaPorEntidad: TRepoSalida003TasaPorEntidad
  Width = 1056
  Height = 816
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
  PrintIfEmpty = True
  inherited BandaDetalle: TQRBand
    Top = 242
    Width = 980
    Height = 29
    Size.Values = (
      76.729166666666680000
      2592.916666666667000000)
    object dbBanco: TQRDBText
      Left = 7
      Top = 2
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        18.520833333333300000
        5.291666666666670000
        76.729166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBBANCO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = '#0'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object dbDescripcion: TQRDBText
      Left = 47
      Top = 2
      Width = 135
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.145833333333300000
        124.354166666667000000
        5.291666666666670000
        357.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBDESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object dbTalones: TQRDBText
      Left = 184
      Top = 2
      Width = 66
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        486.833333333333400000
        5.291666666666667000
        174.625000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBCANAUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object dbImpCob: TQRDBText
      Left = 261
      Top = 2
      Width = 60
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        690.562500000000000000
        5.291666666666667000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBIMPAUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 332
      Top = 2
      Width = 81
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        878.416666666666800000
        5.291666666666667000
        214.312500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBCANNOAUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 418
      Top = 2
      Width = 75
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1105.958333333330000000
        5.291666666666670000
        198.437500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBIMPNOAUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 529
      Top = 2
      Width = 60
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1399.645833333330000000
        5.291666666666670000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBCANSIGE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 608
      Top = 2
      Width = 54
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1608.666666666670000000
        5.291666666666670000
        142.875000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBIMPSIGE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 688
      Top = 2
      Width = 66
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1820.333333333330000000
        5.291666666666670000
        174.625000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBCANCARS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 768
      Top = 2
      Width = 60
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        2032.000000000000000000
        5.291666666666670000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBIMPCARS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 843
      Top = 2
      Width = 60
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        2230.437500000000000000
        5.291666666666670000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBCANATIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 921
      Top = 2
      Width = 54
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        2436.812500000000000000
        5.291666666666670000
        142.875000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DBIMPATIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#0.00'
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  inherited BandaEncabezado: TQRBand
    Width = 980
    Size.Values = (
      433.916666666666800000
      2592.916666666667000000)
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
      Left = 829
      Size.Values = (
        44.979166666666700000
        2193.395833333330000000
        21.166666666666700000
        108.479166666667000000)
      FontSize = 10
    end
    inherited lblFecha: TQRLabel
      Left = 829
      Size.Values = (
        44.979166666666700000
        2193.395833333330000000
        84.666666666666700000
        97.895833333333300000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Left = 829
      Size.Values = (
        44.979166666666700000
        2193.395833333330000000
        148.166666666667000000
        74.083333333333300000)
      FontSize = 10
    end
    inherited QRSysData1: TQRSysData
      Left = 901
      Size.Values = (
        44.979166666666700000
        2383.895833333330000000
        21.166666666666700000
        121.708333333333000000)
      FontSize = 10
    end
    inherited QRSysData2: TQRSysData
      Left = 901
      Size.Values = (
        44.979166666666700000
        2383.895833333330000000
        84.666666666666700000
        95.250000000000000000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Left = 901
      Size.Values = (
        44.979166666666700000
        2383.895833333330000000
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
      Left = 399
      Width = 181
      Size.Values = (
        52.916666666666660000
        1055.687500000000000000
        232.833333333333400000
        478.895833333333400000)
      Caption = 'Telef'#243'nica de Argentina'
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 444
      Top = 112
      Size.Values = (
        50.270833333333330000
        1174.750000000000000000
        296.333333333333400000
        240.770833333333300000)
      Alignment = taCenter
      AlignToBand = True
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 328
      Top = 132
      Width = 324
      Size.Values = (
        44.979166666666670000
        867.833333333333500000
        349.250000000000000000
        857.250000000000000000)
      Caption = 'Cobranzas_Ventanilla - Fecha de Proceso: 00/00/00'
      Font.Style = [fsBold]
      ParentFont = False
      FontSize = 10
    end
  end
  object ChildBand1: TQRChildBand [2]
    Left = 38
    Top = 202
    Width = 980
    Height = 40
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
      105.833333333333300000
      2592.916666666667000000)
    ParentBand = BandaEncabezado
    object lBanco: TQRLabel
      Left = 3
      Top = 21
      Width = 41
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        7.937500000000000000
        55.562500000000000000
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
    object lDescripcion: TQRLabel
      Left = 46
      Top = 21
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        121.708333333333300000
        55.562500000000000000
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
    object QRLabel1: TQRLabel
      Left = 183
      Top = 5
      Width = 144
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        484.187500000000000000
        13.229166666666670000
        381.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fadeuda - Autorizados'
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
    object lTalones: TQRLabel
      Left = 191
      Top = 21
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        505.354166666666700000
        55.562500000000000000
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
    object lImpCob: TQRLabel
      Left = 271
      Top = 21
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        717.020833333333400000
        55.562500000000000000
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
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 365
      Top = 21
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        965.729166666666800000
        55.562500000000000000
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
    object QRLabel2: TQRLabel
      Left = 349
      Top = 5
      Width = 165
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        923.395833333333400000
        13.229166666666670000
        436.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fadeuda - No Autorizados'
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
    object QRLabel4: TQRLabel
      Left = 445
      Top = 21
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1177.395833333330000000
        55.562500000000000000
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
    object QRLabel6: TQRLabel
      Left = 531
      Top = 21
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1404.937500000000000000
        55.562500000000000000
        153.458333333333000000)
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
    object QRLabel5: TQRLabel
      Left = 576
      Top = 5
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1524.000000000000000000
        13.229166666666700000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sigeco'
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
      Left = 611
      Top = 21
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1616.604166666670000000
        55.562500000000000000
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
    object QRLabel9: TQRLabel
      Left = 696
      Top = 21
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1841.500000000000000000
        55.562500000000000000
        153.458333333333000000)
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
    object QRLabel8: TQRLabel
      Left = 737
      Top = 5
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1949.979166666670000000
        13.229166666666700000
        134.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Carriers'
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
      Left = 776
      Top = 21
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2053.166666666670000000
        55.562500000000000000
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
    object QRLabel12: TQRLabel
      Left = 844
      Top = 21
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2233.083333333330000000
        55.562500000000000000
        153.458333333333000000)
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
    object QRLabel11: TQRLabel
      Left = 898
      Top = 5
      Width = 24
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2375.958333333330000000
        13.229166666666700000
        63.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Atis'
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
      Left = 924
      Top = 21
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2444.750000000000000000
        55.562500000000000000
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
  end
  object BandaTotales: TQRBand [3]
    Left = 38
    Top = 271
    Width = 980
    Height = 32
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
      84.666666666666680000
      2592.916666666667000000)
    BandType = rbSummary
    object lTotal: TQRLabel
      Left = 91
      Top = 11
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        240.770833333333000000
        29.104166666666700000
        238.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Cobranzas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object v_dbTalones: TQRExpr
      Left = 185
      Top = 11
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        489.479166666667000000
        29.104166666666700000
        171.979166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbCanAuto)'
      FontSize = 8
    end
    object v_dbImpCob: TQRExpr
      Left = 256
      Top = 11
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        677.333333333333000000
        29.104166666666700000
        171.979166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbImpAuto)'
      Mask = '#0.00'
      FontSize = 8
    end
    object QRExpr1: TQRExpr
      Left = 335
      Top = 11
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        886.354166666667000000
        29.104166666666700000
        206.375000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbCanNoAuto)'
      FontSize = 8
    end
    object QRExpr2: TQRExpr
      Left = 417
      Top = 11
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1103.312500000000000000
        29.104166666666700000
        201.083333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbImpNoAuto)'
      Mask = '#0.00'
      FontSize = 8
    end
    object QRExpr3: TQRExpr
      Left = 520
      Top = 11
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1375.833333333330000000
        29.104166666666700000
        182.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbCanSige)'
      FontSize = 8
    end
    object QRExpr4: TQRExpr
      Left = 594
      Top = 11
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1571.625000000000000000
        29.104166666666700000
        179.916666666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbImpSige)'
      Mask = '#0.00'
      FontSize = 8
    end
    object QRExpr5: TQRExpr
      Left = 684
      Top = 11
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1809.750000000000000000
        29.104166666666700000
        182.562500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbCanCars)'
      FontSize = 8
    end
    object QRExpr6: TQRExpr
      Left = 754
      Top = 11
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1994.958333333330000000
        29.104166666666700000
        198.437500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbImpCars)'
      Mask = '#0.00'
      FontSize = 8
    end
    object QRExpr7: TQRExpr
      Left = 909
      Top = 11
      Width = 66
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2405.062500000000000000
        29.104166666666700000
        174.625000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbImpAtis)'
      Mask = '#0.00'
      FontSize = 8
    end
    object QRExpr8: TQRExpr
      Left = 844
      Top = 11
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2233.083333333330000000
        29.104166666666700000
        156.104166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'sum(dbCanAtis)'
      FontSize = 8
    end
  end
  inherited QryBase: TADOQuery
    SQL.Strings = (
      'select dbBanco,'
      #9'   dbDescripcion, '
      #9'   sum(dbCAuto) as dbCanAuto, '
      #9'   sum(dbIAuto) as dbImpAuto, '
      #9'   sum(dbCNoAuto) as dbCanNoAuto, '
      #9'   sum(dbINoAuto) as dbImpNoAuto, '
      #9'   sum(dbCSige) as dbCanSige, '
      #9'   sum(dbISige) as dbImpSige,'
      #9'   sum(dbCCars) as dbCanCars,'
      #9'   sum(dbICars) as dbImpCars,'
      #9'   sum(dbCAtis) as dbCanAtis, '
      #9'   sum(dbIAtis) as dbImpAtis,'#9'    '
      #9'   sum(dbCanTotal) as dbCantidad, '
      #9'   sum(dbImpTotal) as dbImporte from('
      'select dbBanco, '
      #9'   dbDescripcion, '
      
        #9'   decode(instr(dbresultado,'#39'Si Autorizados'#39'),0,0,sum(dbtalones' +
        ')) as dbCAuto, '
      
        #9'   decode(instr(dbresultado,'#39'Si Autorizados'#39'),0,0,sum(dbimpcob)' +
        ') as dbIAuto,'
      
        #9'   decode(instr(dbresultado,'#39'No Autorizados'#39'),0,0,sum(dbtalones' +
        ')) as dbCNoAuto,'
      
        #9'   decode(instr(dbresultado,'#39'No Autorizados'#39'),0,0,sum(dbimpcob)' +
        ') as dbINoAuto,'
      
        #9'   decode(instr(dbresultado,'#39'Sigeco'#39'),0,0,sum(dbtalones)) as db' +
        'CSige,'
      
        #9'   decode(instr(dbresultado,'#39'Sigeco'#39'),0,0,sum(dbimpcob)) as dbI' +
        'Sige,'
      
        #9'   decode(instr(dbresultado,'#39'Carriers'#39'),0,0,sum(dbtalones)) as ' +
        'dbCCars,'
      
        #9'   decode(instr(dbresultado,'#39'Carriers'#39'),0,0,sum(dbimpcob)) as d' +
        'bICars,'
      
        #9'   decode(instr(dbresultado,'#39'Atis'#39'),0,0,sum(dbtalones)) as dbCA' +
        'tis,'
      
        #9'   decode(instr(dbresultado,'#39'Atis'#39'),0,0,sum(dbimpcob)) as dbIAt' +
        'is,'#9'   '
      #9'   sum(dbtalones) as dbCanTotal,'
      #9'   sum(dbImpCob) as dbImpTotal'
      'from('
      'select cob.cod_entidad_segun_cia as dbBanco,'
      '       entidad.descripcion as dbDescripcion,'
      #9'   '#39'Si Autorizados'#39' as dbResultado,'
      #9'   count(8) as dbTalones,'
      #9'   sum(cob.importe_cobrado) as dbImpCob'
      'from GEMA.COBRANZAS_00003 cob, '
      #9' GIRE.ENTIDADES entidad '
      'where cob.cod_entidad_segun_cia = entidad.cod_entidad and'
      
        #9'  (substr(cob.barra,1,1) = '#39'1'#39' or substr(cob.barra,1,1) = '#39'3'#39') ' +
        'and'
      
        #9'  cob.tipo_archivo = 2 and cob.cod_regulariza <> '#39'3'#39' and cob.co' +
        'd_regulariza <> '#39'2'#39' and NRO_PROCESO = 1'
      'group by cob.cod_entidad_segun_cia, entidad.descripcion '
      'union '
      'select cob.cod_entidad_segun_cia as dbBanco, '
      '       entidad.descripcion as dbDescripcion, '
      #9'   '#39'No Autorizados'#39' as dbResultado, '
      #9'   count(8) as dbTalones, '
      #9'   sum(cob.importe_cobrado) as dbImpCob '
      'from GEMA.COBRANZAS_00003 cob, '
      #9' GIRE.ENTIDADES entidad '
      'where cob.cod_entidad_segun_cia = entidad.cod_entidad and'
      
        #9'  (substr(cob.barra,1,1) = '#39'1'#39' or substr(cob.barra,1,1) = '#39'3'#39') ' +
        'and'
      
        #9'  cob.tipo_archivo <> 2 and cob.cod_regulariza <> '#39'3'#39' and cob.c' +
        'od_regulariza <> '#39'2'#39' and NRO_PROCESO = 1'
      'group by cob.cod_entidad_segun_cia, entidad.descripcion '
      'union '
      'select cob.cod_entidad_segun_cia as dbBanco, '
      '       entidad.descripcion as dbDescripcion, '
      #9'   '#39'Sigeco'#39' as dbResultado, '
      #9'   count(8) as dbTalones, '
      #9'   sum(cob.importe_cobrado) as dbImpCob '
      'from GEMA.COBRANZAS_00003 cob, '
      #9' GIRE.ENTIDADES entidad '
      'where cob.cod_entidad_segun_cia = entidad.cod_entidad and'
      
        #9'  substr(cob.barra,1,1) = '#39'7'#39' and ( cob.cod_regulariza <> '#39'3'#39' a' +
        'nd cob.cod_regulariza <> '#39'2'#39' ) and NRO_PROCESO = 1'
      'group by cob.cod_entidad_segun_cia, entidad.descripcion '
      'union '
      'select cob.cod_entidad_segun_cia as dbBanco, '
      '       entidad.descripcion as dbDescripcion, '
      #9'   '#39'Carriers'#39' as dbResultado, '
      #9'   count(8) as dbTalones, '
      #9'   sum(cob.importe_cobrado) as dbImpCob '
      'from GEMA.COBRANZAS_00003 cob, '
      #9' GIRE.ENTIDADES entidad '
      'where cob.cod_entidad_segun_cia = entidad.cod_entidad and'
      
        #9'  substr(cob.barra,1,1) = '#39'5'#39' and ( cob.cod_regulariza <> '#39'3'#39' a' +
        'nd cob.cod_regulariza <> '#39'2'#39' ) and NRO_PROCESO = 1'
      'group by cob.cod_entidad_segun_cia, entidad.descripcion '
      'union '
      'select cob.cod_entidad_segun_cia as dbBanco, '
      '       entidad.descripcion as dbDescripcion, '
      #9'   '#39'Atis'#39' as dbResultado, '
      #9'   count(8) as dbTalones, '
      #9'   sum(cob.importe_cobrado) as dbImpCob '
      'from GEMA.COBRANZAS_00003 cob, '
      #9' GIRE.ENTIDADES entidad '
      'where cob.cod_entidad_segun_cia = entidad.cod_entidad and'
      
        #9'  substr(cob.barra,1,1) = '#39'6'#39' and cob.tipo_archivo in (15,16) a' +
        'nd NRO_PROCESO = 1 '
      'group by cob.cod_entidad_segun_cia, entidad.descripcion)'
      'group by dbBanco ,dbDescripcion, dbResultado )'
      'group by dbBanco, dbDescripcion'
      'order by TO_NUMBER(dbBanco)')
    object QryBaseDBBANCO: TStringField
      FieldName = 'DBBANCO'
      Size = 10
    end
    object QryBaseDBDESCRIPCION: TStringField
      FieldName = 'DBDESCRIPCION'
      Size = 40
    end
    object QryBaseDBCANAUTO: TBCDField
      FieldName = 'DBCANAUTO'
      Precision = 32
      Size = 0
    end
    object QryBaseDBIMPAUTO: TBCDField
      FieldName = 'DBIMPAUTO'
      Precision = 32
      Size = 0
    end
    object QryBaseDBCANNOAUTO: TBCDField
      FieldName = 'DBCANNOAUTO'
      Precision = 32
      Size = 0
    end
    object QryBaseDBIMPNOAUTO: TBCDField
      FieldName = 'DBIMPNOAUTO'
      Precision = 32
      Size = 0
    end
    object QryBaseDBCANSIGE: TBCDField
      FieldName = 'DBCANSIGE'
      Precision = 32
      Size = 0
    end
    object QryBaseDBIMPSIGE: TBCDField
      FieldName = 'DBIMPSIGE'
      Precision = 32
      Size = 0
    end
    object QryBaseDBCANCARS: TBCDField
      FieldName = 'DBCANCARS'
      Precision = 32
      Size = 0
    end
    object QryBaseDBIMPCARS: TBCDField
      FieldName = 'DBIMPCARS'
      Precision = 32
      Size = 0
    end
    object QryBaseDBCANATIS: TBCDField
      FieldName = 'DBCANATIS'
      Precision = 32
      Size = 0
    end
    object QryBaseDBIMPATIS: TBCDField
      FieldName = 'DBIMPATIS'
      Precision = 32
      Size = 0
    end
    object QryBaseDBCANTIDAD: TBCDField
      FieldName = 'DBCANTIDAD'
      Precision = 32
      Size = 0
    end
    object QryBaseDBIMPORTE: TBCDField
      FieldName = 'DBIMPORTE'
      Precision = 32
      Size = 0
    end
  end
end
