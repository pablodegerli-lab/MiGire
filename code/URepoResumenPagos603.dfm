inherited RepoResumenPagos603: TRepoResumenPagos603
  Width = 1111
  Height = 1572
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.PaperSize = A4
  Page.Values = (
    200.000000000000000000
    2970.000000000000000000
    200.000000000000000000
    2100.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  Zoom = 140
  inherited BandaDetalle: TQRBand
    Left = 53
    Top = 536
    Width = 1005
    Size.Values = (
      45.357142857142850000
      1899.330357142857000000)
    object QRDBText12: TQRDBText
      Left = 0
      Top = 4
      Width = 50
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        7.559523809523811000
        94.494047619047620000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      DataSet = QryBase
      DataField = 'DETALLE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  inherited BandaEncabezado: TQRBand
    Left = 53
    Top = 106
    Width = 1005
    Height = 244
    Size.Values = (
      461.130952380952400000
      1899.330357142857000000)
    inherited QRLGire: TQRLabel
      Left = 25
      Top = 34
      Width = 64
      Height = 23
      Size.Values = (
        43.467261904761910000
        47.247023809523810000
        64.255952380952380000
        120.952380952381000000)
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      FontSize = 6
    end
    inherited QRImage1: TQRImage
      Left = 451
      Top = 61
      Width = 30
      Height = 28
      Enabled = False
      Size.Values = (
        52.916666666666680000
        852.336309523809700000
        115.282738095238100000
        56.696428571428570000)
    end
    inherited lblNombreSistema: TQRLabel
      Left = 312
      Top = 124
      Width = 120
      Height = 23
      Enabled = False
      Size.Values = (
        43.467261904761910000
        589.642857142857100000
        234.345238095238100000
        226.785714285714300000)
      FontSize = 8
    end
    inherited lblPagina: TQRLabel
      Left = 778
      Top = 28
      Width = 57
      Height = 23
      Enabled = False
      Size.Values = (
        43.467261904761910000
        1470.327380952381000000
        52.916666666666680000
        107.723214285714300000)
      FontSize = 10
    end
    inherited lblFecha: TQRLabel
      Left = 196
      Top = 28
      Width = 52
      Height = 23
      Enabled = False
      Size.Values = (
        43.467261904761910000
        370.416666666666700000
        52.916666666666680000
        98.273809523809540000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Left = 741
      Top = 28
      Width = 39
      Height = 23
      Enabled = False
      Size.Values = (
        43.467261904761910000
        1400.401785714286000000
        52.916666666666680000
        73.705357142857140000)
      FontSize = 10
    end
    inherited QRSysData1: TQRSysData
      Left = 691
      Top = 30
      Width = 50
      Height = 23
      Size.Values = (
        43.467261904761910000
        1305.907738095238000000
        56.696428571428570000
        94.494047619047620000)
      Font.Height = -8
      Font.Name = 'Lucida Console'
      ParentFont = False
      FontSize = 6
    end
    inherited QRSysData2: TQRSysData
      Left = 253
      Top = 28
      Width = 50
      Height = 23
      Enabled = False
      Size.Values = (
        43.467261904761910000
        478.139880952381000000
        52.916666666666680000
        94.494047619047620000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Left = 393
      Top = 28
      Width = 52
      Height = 23
      Enabled = False
      Size.Values = (
        43.467261904761910000
        742.723214285714300000
        52.916666666666680000
        98.273809523809540000)
      FontSize = 10
    end
    inherited lblDateLine: TQRLabel
      Left = 230
      Top = 126
      Width = 78
      Height = 23
      Size.Values = (
        43.467261904761910000
        434.672619047619100000
        238.125000000000000000
        147.410714285714300000)
      Font.Height = -8
      Font.Name = 'Lucida Console'
      FontSize = 6
    end
    inherited lblUsuario: TQRLabel
      Left = 304
      Top = 28
      Width = 81
      Height = 23
      Enabled = False
      Size.Values = (
        43.467261904761910000
        574.523809523809500000
        52.916666666666680000
        153.080357142857200000)
      FontSize = 10
    end
    inherited lblNombreEmpresa: TQRLabel
      Left = 365
      Top = 56
      Width = 82
      Height = 28
      Enabled = False
      Size.Values = (
        52.916666666666680000
        689.806547619047700000
        105.833333333333400000
        154.970238095238100000)
      AlignToBand = False
      AutoSize = False
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 268
      Top = 56
      Width = 81
      Height = 26
      Enabled = False
      Size.Values = (
        49.136904761904770000
        506.488095238095200000
        105.833333333333400000
        153.080357142857200000)
      Alignment = taCenter
      AutoSize = False
      Text = 'DESGLOSE DE LISTADO DE POSICION EN PESOS'
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 1
      Top = 119
      Width = 552
      Height = 12
      Size.Values = (
        22.678571428571430000
        1.889880952380953000
        224.895833333333300000
        1043.214285714286000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Fecha de compensaci'#243'n: 99/99/99'
      Font.Height = -8
      Font.Name = 'Lucida Console'
      ParentFont = False
      FontSize = 6
    end
    object QRLabel7: TQRLabel
      Left = 9
      Top = 96
      Width = 561
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.048611111111110000
        17.638888888888890000
        180.798611111111100000
        1060.538194444445000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '                    DESGLOSE DE LISTADO DE POSICION EN PESOS    ' +
        '                '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel8: TQRLabel
      Left = 5
      Top = 80
      Width = 260
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.678571428571430000
        9.449404761904763000
        151.190476190476200000
        491.369047619047700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'EMPRESA : CITIBANK'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object lblLinea1: TQRLabel
      Left = 0
      Top = 22
      Width = 570
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.678571428571430000
        0.000000000000000000
        41.577380952380950000
        1077.232142857143000000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = False
      AutoStretch = False
      Caption = 'EMPRESA :         '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object lblLinea2: TQRLabel
      Left = 0
      Top = 35
      Width = 537
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        66.145833333333340000
        1014.866071428571000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'GIRE S.A.                                                       ' +
        '  Hoja: 1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel9: TQRLabel
      Left = 64
      Top = 59
      Width = 169
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        120.952380952381000000
        111.502976190476200000
        319.389880952381000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '                        '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel10: TQRLabel
      Left = 9
      Top = 133
      Width = 169
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.048611111111110000
        17.638888888888890000
        251.354166666666700000
        319.704861111111200000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '                        '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel13: TQRLabel
      Left = 0
      Top = 9
      Width = 288
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.048611111111110000
        0.000000000000000000
        17.638888888888890000
        544.600694444444500000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '                                         '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRGroup1: TQRGroup [2]
    Left = 53
    Top = 350
    Width = 1005
    Height = 186
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRGroup1AfterPrint
    AlignToBottom = False
    Color = 14737632
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      351.517857142857100000
      1899.330357142857000000)
    Expression = 'QryBase.COD_CIA_CITI'
    FooterBand = qrBandPieLote
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel6: TQRLabel
      Left = 0
      Top = 170
      Width = 526
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        321.279761904761900000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = 
        #192#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196 +
        #196#196#196#196#196#196#196#196#196#196#217
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 0
      Top = 1
      Width = 526
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.678571428571430000
        0.000000000000000000
        1.889880952380953000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = QryBase
      DataField = 'CABECERA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 6
    end
    object QRLabel4: TQRLabel
      Left = 0
      Top = 79
      Width = 526
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        149.300595238095200000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = 
        #218#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196#196 +
        #196#196#196#196#196#196#196#196#196#196#191
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel3: TQRLabel
      Left = 0
      Top = 113
      Width = 526
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        213.556547619047600000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = 
        #179'BANCO                DEBITOS     REVERSIONES     DEBITOS      R' +
        'EVERSIONES'#179
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel2: TQRLabel
      Left = 0
      Top = 137
      Width = 526
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        258.913690476190500000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = 
        #179'                    ACEPTADOS     ACEPTADAS     RECHAZADOS    R' +
        'ECHAZADAS '#179
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel14: TQRLabel
      Left = 0
      Top = 60
      Width = 526
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        113.392857142857100000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = False
      AutoStretch = True
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel15: TQRLabel
      Left = 0
      Top = 93
      Width = 526
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        175.758928571428500000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = False
      AutoStretch = True
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
    object QRLabel16: TQRLabel
      Left = 0
      Top = 154
      Width = 526
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        291.041666666666700000
        994.077380952380900000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = False
      AutoStretch = True
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 6
    end
  end
  object qrBandPieLote: TQRBand [3]
    Left = 53
    Top = 560
    Width = 1005
    Height = 74
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrBandPieLoteBeforePrint
    Color = 14737632
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      139.851190476190500000
      1899.330357142857000000)
    BandType = rbGroupFooter
    object QRDBText1: TQRDBText
      Left = 0
      Top = 19
      Width = 22
      Height = 14
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        35.907738095238090000
        41.577380952380950000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      DataSet = QryBase
      DataField = 'PIE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel5: TQRLabel
      Left = 0
      Top = 55
      Width = 267
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        103.943452380952400000
        504.598214285714300000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = '                                      '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object lblTotales: TQRLabel
      Left = 2
      Top = 38
      Width = 99
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        3.779761904761905000
        71.815476190476190000
        187.098214285714300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Total General:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel1: TQRLabel
      Left = 0
      Top = 3
      Width = 267
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        0.000000000000000000
        5.669642857142857000
        504.598214285714300000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = '                                      '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRMemo1: TQRMemo
      Left = 3
      Top = 19
      Width = 582
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        5.669642857142857000
        35.907738095238090000
        1099.910714285714000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object qrBandTotalGral: TQRBand [4]
    Left = 53
    Top = 634
    Width = 1005
    Height = 56
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrBandTotalGralBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333400000
      1899.330357142857000000)
    BandType = rbSummary
    object lblTotalGral: TQRLabel
      Left = 0
      Top = 36
      Width = 609
      Height = 17
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        32.127976190476190000
        0.000000000000000000
        68.035714285714290000
        1150.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total General:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 6
    end
    object QRLabel11: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.678571428571430000
        0.000000000000000000
        0.000000000000000000
        319.389880952381000000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '                        '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel12: TQRLabel
      Left = 0
      Top = 18
      Width = 169
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        22.678571428571430000
        0.000000000000000000
        34.017857142857150000
        319.389880952381000000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '                        '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRMemo2: TQRMemo
      Left = 3
      Top = 36
      Width = 604
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        26.458333333333340000
        5.669642857142857000
        68.035714285714290000
        1141.488095238095000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRBand3: TQRBand [5]
    Left = 53
    Top = 690
    Width = 1005
    Height = 56
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333400000
      1899.330357142857000000)
    BandType = rbPageFooter
  end
  inherited QryBase: TADOQuery
    CursorType = ctStatic
    BeforeOpen = QryBaseBeforeOpen
    Parameters = <
      item
        Name = 'pFh_Proceso1'
        DataType = ftDateTime
        Size = 16
        Value = Null
      end
      item
        Name = 'pFh_Proceso2'
        DataType = ftDateTime
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '  cod_cia_citi, '
      '  cod_entidad,'
      '  nombre_entidad,'
      '  nombre_cia_citi,'
      '  cuit_cia_citi,'
      '  prestacion, '
      '  round(SUM(deb_acep),2) as deb_acep,'
      '  round(sum(rev_acep),2) as rev_acep, '
      '  round(sum(deb_rech),2) as deb_rech, '
      '  round(sum(rev_rech),2) as rev_rech, '
      
        '  '#39'('#39'||lpad(COD_ENTIDAD,3,'#39' '#39')||'#39')'#39'|| rpad(NOMBRE_ENTIDAD,10,'#39' '#39 +
        ') '
      
        '    || lpad(to_char(round(sum(DEB_ACEP),2),'#39'99999999990.00'#39'),15,' +
        #39' '#39') '
      
        '    || lpad(to_char(round(sum(REV_ACEP),2),'#39'9999999990.00'#39'),14,'#39 +
        ' '#39') '
      
        '    || lpad(to_char(round(sum(DEB_RECH),2),'#39'9999999990.00'#39'),14,'#39 +
        ' '#39') '
      
        '    || lpad(to_char(round(sum(REV_RECH),2),'#39'99999999990.00'#39'),15,' +
        #39' '#39') as DETALLE,'
      '  '#39'EMPRESA :('#39' || lpad(COD_CIA_CITI,4,'#39' '#39') || '#39')'#39
      '    || rpad(NOMBRE_CIA_CITI,19,'#39' '#39') '
      
        '    || '#39'C.U.I.T. :'#39' || rpad(CUIT_CIA_CITI,14,'#39' '#39')||'#39'('#39'||PRESTACI' +
        'ON||'#39')'#39' as CABECERA,'
      
        '  '#39'Total Empresa :('#39'||lpad(COD_CIA_CITI,4,'#39' '#39') ||'#39')'#39'|| rpad(NOMB' +
        'RE_CIA_CITI,19,'#39' '#39') as PIE'
      'FROM ('
      '  SELECT '
      
        '    cod_cia_citi, cod_entidad, nombre_entidad, nombre_cia_citi, ' +
        'cuit_cia_citi, prestacion,'
      
        '    sum(IMPORTE_ACEPTADOS) deb_acep, 0 rev_acep, sum(IMPORTE_REC' +
        'HAZADOS) deb_rech, 0 rev_rech'
      '  FROM @01'
      '  WHERE '
      '    FH_PROCESO <= :pFh_Proceso1  '
      '    and Trim(COD_TRX) = '#39'1'#39' '
      '    and cod_sucursal_receptora <> 8888'
      '  GROUP BY '
      
        '    cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,cui' +
        't_cia_citi,prestacion'
      '  UNION ALL'
      '  SELECT '
      
        '    cod_cia_citi, cod_entidad, nombre_entidad, nombre_cia_citi, ' +
        'cuit_cia_citi, prestacion,'
      
        '    0 deb_acep, sum(IMPORTE_ACEPTADOS) rev_acep, 0 deb_rech, sum' +
        '(IMPORTE_RECHAZADOS) rev_rech'
      '  FROM @01'
      '  WHERE '
      '    FH_PROCESO <= :pFh_Proceso2'
      '    and ((Trim(COD_TRX) = '#39'4'#39') or (Trim(COD_TRX) = '#39'2'#39'))'
      '    and cod_sucursal_receptora <> 8888'
      '  GROUP BY '
      
        '    cod_cia_citi, cod_entidad, nombre_entidad, nombre_cia_citi, ' +
        'cuit_cia_citi, prestacion)'
      'GROUP BY '
      
        '  cod_cia_citi, cod_entidad, nombre_entidad, nombre_cia_citi, cu' +
        'it_cia_citi, prestacion'
      'ORDER BY '
      '  cod_cia_citi, cod_entidad')
    object QryBaseCOD_CIA_CITI: TIntegerField
      FieldName = 'COD_CIA_CITI'
    end
    object QryBaseCOD_ENTIDAD: TIntegerField
      FieldName = 'COD_ENTIDAD'
    end
    object QryBaseNOMBRE_ENTIDAD: TStringField
      FieldName = 'NOMBRE_ENTIDAD'
      Size = 30
    end
    object QryBaseNOMBRE_CIA_CITI: TStringField
      FieldName = 'NOMBRE_CIA_CITI'
      Size = 40
    end
    object QryBaseCUIT_CIA_CITI: TBCDField
      FieldName = 'CUIT_CIA_CITI'
      Precision = 11
      Size = 0
    end
    object QryBasePRESTACION: TStringField
      FieldName = 'PRESTACION'
      Size = 10
    end
    object QryBaseDEB_ACEP: TBCDField
      FieldName = 'DEB_ACEP'
      Precision = 32
      Size = 0
    end
    object QryBaseREV_ACEP: TBCDField
      FieldName = 'REV_ACEP'
      Precision = 32
      Size = 0
    end
    object QryBaseDEB_RECH: TBCDField
      FieldName = 'DEB_RECH'
      Precision = 32
      Size = 0
    end
    object QryBaseREV_RECH: TBCDField
      FieldName = 'REV_RECH'
      Precision = 32
      Size = 0
    end
    object QryBaseDETALLE: TWideStringField
      FieldName = 'DETALLE'
      Size = 300
    end
    object QryBaseCABECERA: TWideStringField
      FieldName = 'CABECERA'
      Size = 300
    end
    object QryBasePIE: TWideStringField
      FieldName = 'PIE'
      Size = 300
    end
  end
  inherited QryTotales: TADOQuery
    Parameters = <
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = 41412d
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM('
      '  SELECT '
      '    COUNT(9) AS CANTIDAD,'
      '    0 AS IMPORTE   '
      '  FROM GEMA.RESUMEN_PAGOS_00603'
      '  WHERE '
      '    FH_PROCESO <= :PFH_PROCESO'
      ')'
      'WHERE '
      '  CANTIDAD > 0')
  end
end
