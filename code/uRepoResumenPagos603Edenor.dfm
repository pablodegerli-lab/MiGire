inherited RepoResumenPagos603Edenor: TRepoResumenPagos603Edenor
  Width = 1613
  Height = 979
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Orientation = poLandscape
  Page.PaperSize = Legal
  Page.Values = (
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    3556.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  Zoom = 120
  inherited BandaDetalle: TQRBand
    Left = 45
    Top = 384
    Width = 1522
    Height = 20
    Size.Values = (
      44.097222222222230000
      3355.798611111111000000)
    object qrlDetalle: TQRLabel
      Left = 0
      Top = 0
      Width = 61
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        0.000000000000000000
        134.496527777777800000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlDetalle'
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
  inherited BandaEncabezado: TQRBand
    Left = 45
    Top = 45
    Width = 1522
    Height = 204
    Size.Values = (
      449.791666666666700000
      3355.798611111111000000)
    inherited QRLGire: TQRLabel
      Left = 22
      Top = 29
      Width = 74
      Height = 20
      Size.Values = (
        44.097222222222230000
        48.506944444444440000
        63.940972222222230000
        163.159722222222200000)
      FontSize = 10
    end
    inherited QRImage1: TQRImage
      Left = 59
      Top = 2
      Width = 107
      Height = 47
      Size.Values = (
        103.628472222222200000
        130.086805555555600000
        4.409722222222222000
        235.920138888888900000)
    end
    inherited lblNombreSistema: TQRLabel
      Left = 200
      Top = 50
      Width = 97
      Height = 20
      Size.Values = (
        44.097222222222230000
        440.972222222222300000
        110.243055555555600000
        213.871527777777800000)
      Font.Height = -8
      Font.Name = 'Lucida Console'
      FontSize = 6
    end
    inherited lblPagina: TQRLabel
      Left = 707
      Top = 10
      Width = 49
      Height = 20
      Enabled = False
      Size.Values = (
        44.097222222222230000
        1558.836805555556000000
        22.048611111111110000
        108.038194444444400000)
      FontSize = 10
    end
    inherited lblFecha: TQRLabel
      Left = 707
      Top = 38
      Width = 44
      Height = 20
      Enabled = False
      Size.Values = (
        44.097222222222230000
        1558.836805555556000000
        83.784722222222230000
        97.013888888888880000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Left = 707
      Top = 67
      Width = 34
      Height = 20
      Enabled = False
      Size.Values = (
        44.097222222222230000
        1558.836805555556000000
        147.725694444444400000
        74.965277777777790000)
      FontSize = 10
    end
    inherited QRSysData1: TQRSysData
      Left = 793
      Top = 10
      Width = 55
      Height = 20
      Enabled = False
      Size.Values = (
        44.097222222222230000
        1748.454861111111000000
        22.048611111111110000
        121.267361111111100000)
      FontSize = 10
    end
    inherited QRSysData2: TQRSysData
      Left = 793
      Top = 38
      Width = 43
      Height = 20
      Enabled = False
      Size.Values = (
        44.097222222222230000
        1748.454861111111000000
        83.784722222222230000
        94.809027777777790000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Left = 793
      Top = 67
      Width = 44
      Height = 20
      Enabled = False
      Size.Values = (
        44.097222222222230000
        1748.454861111111000000
        147.725694444444400000
        97.013888888888880000)
      FontSize = 10
    end
    inherited lblDateLine: TQRLabel
      Left = 112
      Top = 44
      Width = 67
      Height = 20
      Size.Values = (
        44.097222222222230000
        246.944444444444400000
        97.013888888888880000
        147.725694444444400000)
      Font.Height = -8
      Font.Name = 'Lucida Console'
      FontSize = 6
    end
    inherited lblUsuario: TQRLabel
      Left = 291
      Top = 10
      Width = 70
      Height = 20
      Enabled = False
      Size.Values = (
        44.097222222222230000
        641.614583333333400000
        22.048611111111110000
        154.340277777777800000)
      FontSize = 10
    end
    inherited lblNombreEmpresa: TQRLabel
      Left = 660
      Top = 2
      Width = 202
      Height = 24
      Enabled = False
      Size.Values = (
        52.916666666666660000
        1455.208333333333000000
        4.409722222222222000
        445.381944444444500000)
      Caption = 'EMPRESA: CITIBANK'
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 489
      Top = 11
      Width = 544
      Height = 23
      Enabled = False
      Size.Values = (
        50.711805555555560000
        1078.177083333333000000
        24.253472222222220000
        1199.444444444445000000)
      Alignment = taCenter
      AlignToBand = True
      Text = 'DESGLOSE DE LISTADO DE POSICION EN PESOS'
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 0
      Top = 158
      Width = 403
      Height = 20
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        348.368055555555600000
        888.559027777777800000)
      Alignment = taLeftJustify
      Caption = 
        'La fecha de vto. es igual a la fecha de comp. menos 24 hs. habil' +
        'es.'
      Font.Height = -8
      Font.Name = 'Lucida Console'
      ParentFont = False
      FontSize = 6
    end
    object QRLabel4: TQRLabel
      Left = 0
      Top = 138
      Width = 529
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        304.270833333333300000
        1166.371527777778000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'EMPRESA : CITIBANK                              DESGLOSE DE LIST' +
        'ADO DE POSICION EN PESOS'
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
    object QRLabel6: TQRLabel
      Left = 0
      Top = 174
      Width = 181
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        383.645833333333300000
        399.079861111111200000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '                              '
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
    object qrlDateLine: TQRLabel
      Left = 0
      Top = 76
      Width = 67
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        167.569444444444400000
        147.725694444444400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'lblDateLine'
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
    object qrlNombreSistema: TQRLabel
      Left = 0
      Top = 98
      Width = 97
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        216.076388888888900000
        213.871527777777800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'lblNombreSistema'
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
  object ChildBand1: TQRChildBand [2]
    Left = 45
    Top = 249
    Width = 1522
    Height = 18
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
      39.687500000000000000
      3355.798611111111000000)
    ParentBand = BandaEncabezado
  end
  object QRGroup1: TQRGroup [3]
    Left = 45
    Top = 267
    Width = 1522
    Height = 117
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = 14737632
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      257.968750000000000000
      3355.798611111111000000)
    Expression = 
      'QryBase.COD_CIA_CITI  And  QryBase.NOMBRE_CIA_CITI And QryBase.C' +
      'UIT_CIA_CITI'
    FooterBand = QRBand1
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel1: TQRLabel
      Left = 6
      Top = 34
      Width = 72
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        13.229166666666670000
        74.965277777777790000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Empresa:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 83
      Top = 34
      Width = 72
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        183.003472222222200000
        74.965277777777790000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'EMPRESA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 160
      Top = 34
      Width = 158
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        352.777777777777900000
        74.965277777777790000
        348.368055555555600000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NOMBRE_CIA_CITI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 334
      Top = 34
      Width = 71
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        736.423611111111000000
        74.965277777777790000
        156.545138888888900000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C.U.I.T. : '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 406
      Top = 34
      Width = 158
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        895.173611111111200000
        74.965277777777790000
        348.368055555555600000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CUIT_CIA_CITI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 571
      Top = 34
      Width = 286
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        1258.975694444445000000
        74.965277777777790000
        630.590277777777800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'PRESTACION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel21: TQRLabel
      Left = 6
      Top = 10
      Width = 194
      Height = 20
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        13.229166666666670000
        22.048611111111110000
        427.743055555555600000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Compensaci'#243'n:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 211
      Top = 10
      Width = 72
      Height = 20
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        465.225694444444500000
        22.048611111111110000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'fh_compensacion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 0
      Top = 80
      Width = 1033
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        176.388888888888900000
        2277.621527777778000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'BANCOS         TOTAL DEBITOS    TOT. DEB.EFECT.     TOT.DEB.RECH' +
        '.      REVERSIONES  OK REVERSIONES MAL      NETO       RETENS.  ' +
        '     TOTAL        COMIS.   IVA 21%    NETO  '
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
    object QRLabel3: TQRLabel
      Left = 0
      Top = 96
      Width = 1033
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        211.666666666666700000
        2277.621527777778000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '           CANT.       IMPORTE CANT.       IMPORTE CANT.       I' +
        'MPORTE CANT.   IMPORTE CANT.   IMPORTE                 IVA  8%  ' +
        '                  COBRAR    COMIS.    COMIS.'
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
    object QRLabel7: TQRLabel
      Left = 0
      Top = 57
      Width = 181
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        125.677083333333300000
        399.079861111111200000)
      Alignment = taLeftJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '                              '
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
  object QRBand1: TQRBand [4]
    Left = 45
    Top = 404
    Width = 1522
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRBand1AfterPrint
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = 14737632
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666660000
      3355.798611111111000000)
    BandType = rbGroupFooter
    object lblTotales: TQRLabel
      Left = 0
      Top = 2
      Width = 967
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        0.000000000000000000
        4.409722222222222000
        2132.100694444444000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'GALICIA      294  169890.47   287  166451.04     7    3439.43   ' +
        '  0       0.00     0       0.00  166451.04   13316.08  153134.96' +
        '       0.00       0.00       0.00'
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
  object QRBand2: TQRBand [5]
    Left = 45
    Top = 428
    Width = 1522
    Height = 48
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
      105.833333333333300000
      3355.798611111111000000)
    BandType = rbPageFooter
    object QRSysData4: TQRSysData
      Left = 704
      Top = 16
      Width = 113
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.097222222222230000
        1552.222222222222000000
        35.277777777777780000
        249.149305555555600000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      Color = clWhite
      Data = qrsPageNumber
      Text = 'P'#225'gina: '
      Transparent = False
      FontSize = 10
    end
  end
  inherited QryBase: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'P1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'P2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_citi,' +
        'cuit_cia_citi,'#39'('#39'||prestacion||'#39')'#39' as prestacion,'
      
        '            col01, col02, col03, col04, col05, col06,col07, col0' +
        '8, col09, col10, (col04-col08) as col11, '
      
        '           round(((col04-col08)*0.08),2) as col12, round(( (col0' +
        '4-col08) - (col04-col08)*0.08),2) as col13, 0 as col14,'
      
        '           0 as col15, 0 as col16, fh_compensacion, '#39'('#39'||cod_cia' +
        '_citi||'#39')'#39' as empresa, '
      'rpad(nombre_entidad,10,'#39' '#39') ||'#39' '#39'||'
      'lpad(TO_CHAR(col01),5,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(col02,'#39'9999999990.00'#39')),13,'#39' '#39') ||'#39' '#39'||'
      'lpad(TO_CHAR(col03),5,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(col04,'#39'9999999990.00'#39')),13,'#39' '#39') ||'#39' '#39'||'
      'lpad(TO_CHAR(col05),5,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(col06,'#39'99999999990.00'#39')),13,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(TO_CHAR(col07,'#39'99990'#39')),5,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(col08,'#39'999990.00'#39')),9,'#39' '#39') ||'#39' '#39'||'
      'lpad(TO_CHAR(col09),5,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(col10,'#39'999990.00'#39')),9,'#39' '#39') ||'#39' '#39'||'
      
        'lpad(trim(to_char((col04-col08),'#39'9999999990.00'#39')),13,'#39' '#39') ||'#39' '#39'|' +
        '|'
      
        ' lpad(trim(to_char(((col04-col08)*0.08),'#39'99999990.00'#39')),11,'#39' '#39') ' +
        '||'#39' '#39'||'
      
        ' lpad(trim(to_char(( (col04-col08) - (col04-col08)*0.08),'#39'999999' +
        '9990.00'#39')),13,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(0,'#39'999990.00'#39')),9,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(0,'#39'999990.00'#39')),9,'#39' '#39') ||'#39' '#39'||'
      'lpad(trim(to_char(0,'#39'999990.00'#39')),9,'#39' '#39') as DETALLE '
      
        'from (   SELECT    sum(col01) as col01, sum(col02) as col02, sum' +
        '(col03) as col03,'
      
        '                            sum(col04) as col04, sum(col05) as c' +
        'ol05, sum(col06) as col06,'
      
        '                            sum(col07) as col07, sum(col08) as c' +
        'ol08, sum(col09) as col09,'
      
        '                            sum(col10) as col10, sum(col11) as c' +
        'ol11, sum(col12) as col12,'
      
        '                            sum(col13) as col13, sum(col14) as c' +
        'ol14, sum(col15) as col15,'
      
        '                            sum(col16) as col16,  cod_cia_citi, ' +
        'cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestac' +
        'ion, fh_compensacion                                            ' +
        '                                                    '
      
        '            from((SELECT sum(cantidad_aceptados + cantidad_recha' +
        'zados) as col01,'
      
        '                            sum(importe_aceptados + importe_rech' +
        'azados) as col02,'
      '                            sum(cantidad_aceptados) as col03,'
      '                            sum(importe_aceptados) as col04,'
      '                            sum(cantidad_rechazados) as col05,'
      '                            sum(importe_rechazados) as col06,'
      
        '                            0 as col07,0 as col08,0 as col09,0 a' +
        's col10,0 as col11,0 as col12,0 as col13,0 as col14,'
      
        '                            0 as col15,0 as col16,cod_cia_citi, ' +
        'cod_entidad,nombre_entidad,nombre_cia_citi,cuit_cia_citi,prestac' +
        'ion, max(trunc(FH_COMPENSACION)) as fh_compensacion             ' +
        ' '
      '                            FROM GEMA.RESUMEN_PAGOS_00603'
      '                            WHERE FH_PROCESO <= :P1  '
      '                            and Trim(COD_TRX) = '#39'1'#39
      '                            and COD_CIA_CITI = 967'
      
        '                            GROUP BY cod_cia_citi, cod_entidad,n' +
        'ombre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion)'
      '                           UNION ALL'
      
        '                           (SELECT 0 as col01,0 as col02,0 as co' +
        'l03,0 as col04,0 as col05,0 as col06,sum(CANTIDAD_ACEPTADOS) as ' +
        'col07,'
      
        '                           sum(IMPORTE_ACEPTADOS) as col08,sum(C' +
        'ANTIDAD_RECHAZADOS) as col09,sum(IMPORTE_RECHAZADOS) as col10,'
      
        '                           0 as col11,0 as col12,0 as col13,0 as' +
        ' col14,0 as col15,0 as col16,'
      
        '                           cod_cia_citi, cod_entidad,nombre_enti' +
        'dad,nombre_cia_citi,cuit_cia_citi,prestacion, max(trunc(FH_COMPE' +
        'NSACION)) as fh_compensacion'
      '                           FROM GEMA.RESUMEN_PAGOS_00603'
      '                           WHERE FH_PROCESO <= :P2'
      '                           and  Trim(COD_TRX) in ( '#39'4'#39','#39'2'#39')'
      '                           and COD_CIA_CITI = 967'
      
        '                           GROUP BY cod_cia_citi, cod_entidad,no' +
        'mbre_entidad,nombre_cia_citi,cuit_cia_citi,prestacion)'
      '                )'
      
        '        GROUP BY cod_cia_citi, cod_entidad,nombre_entidad,nombre' +
        '_cia_citi,cuit_cia_citi,prestacion, fh_compensacion'
      '        ORDER BY cod_cia_citi, cod_entidad'
      ')'
      
        'order by cod_cia_citi, cod_entidad,nombre_entidad,nombre_cia_cit' +
        'i,cuit_cia_citi,prestacion')
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
      'Select * from('
      'SELECT Count(9) as CANTIDAD,'
      '               0 as IMPORTE   '
      'FROM GEMA.RESUMEN_PAGOS_00603'
      'WHERE FH_PROCESO <= :pFh_Proceso )'
      'where CANTIDAD > 0')
  end
  object QRTextFilter1: TQRTextFilter
    Left = 480
    Top = 24
  end
end
