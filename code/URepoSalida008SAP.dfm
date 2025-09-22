inherited RepoSalida008SAP: TRepoSalida008SAP
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
    Size.Values = (
      63.500000000000000000
      1957.916666666667000000)
    object QRDBText1: TQRDBText
      Left = 1
      Top = 0
      Width = 30
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2.645833333333333000
        0.000000000000000000
        79.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'MES'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 20
      Top = 0
      Width = 32
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'ANIO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 30
      Top = 0
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        79.375000000000000000
        0.000000000000000000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TARJETAS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 40
      Top = 0
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        105.833333333333300000
        0.000000000000000000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DESCRIPCION'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 50
      Top = 0
      Width = 96
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        132.291666666666700000
        0.000000000000000000
        254.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DESCRIPCION1'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 60
      Top = 0
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        158.750000000000000000
        0.000000000000000000
        76.729166666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CUIT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 70
      Top = 0
      Width = 91
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        185.208333333333300000
        0.000000000000000000
        240.770833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_DEPOSITO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 80
      Top = 0
      Width = 165
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        211.666666666666700000
        0.000000000000000000
        436.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NRO_COMPROBANTE_IVA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 90
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
        238.125000000000000000
        0.000000000000000000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMPORTE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 100
      Top = 0
      Width = 64
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        264.583333333333400000
        0.000000000000000000
        169.333333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NUM_SUC'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 110
      Top = 0
      Width = 66
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        0.000000000000000000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TIP_COMP'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 120
      Top = 0
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        317.500000000000000000
        0.000000000000000000
        185.208333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'LET_COMP'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText13: TQRDBText
      Left = 130
      Top = 0
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        343.958333333333400000
        0.000000000000000000
        201.083333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NUM_COMP'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 140
      Top = 0
      Width = 71
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        370.416666666666700000
        0.000000000000000000
        187.854166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'PROVINCIA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText15: TQRDBText
      Left = 150
      Top = 0
      Width = 60
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        396.875000000000000000
        0.000000000000000000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_JUR'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited BandaEncabezado: TQRBand
    Enabled = False
    Size.Values = (
      433.916666666666700000
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
      Size.Values = (
        52.916666666666670000
        783.166666666666800000
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
      Size.Values = (
        44.979166666666670000
        785.812500000000000000
        370.416666666666700000
        383.645833333333400000)
      FontSize = 10
    end
  end
  object QRBand1: TQRBand [2]
    Left = 38
    Top = 202
    Width = 740
    Height = 36
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      95.250000000000000000
      1957.916666666667000000)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 1
      Top = 8
      Width = 26
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2.645833333333333000
        21.166666666666670000
        68.791666666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Mes'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 20
      Top = 8
      Width = 24
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        21.166666666666670000
        63.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'A'#241'o'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 30
      Top = 8
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        79.375000000000000000
        21.166666666666670000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Banco'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 40
      Top = 8
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        105.833333333333300000
        21.166666666666670000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Banco'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 50
      Top = 8
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        132.291666666666700000
        21.166666666666670000
        129.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Pagador'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 60
      Top = 8
      Width = 79
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        158.750000000000000000
        21.166666666666670000
        209.020833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cuit_Pagador'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 70
      Top = 8
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        185.208333333333300000
        21.166666666666670000
        97.895833333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 80
      Top = 8
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        211.666666666666700000
        21.166666666666670000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nro.Comp'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 90
      Top = 8
      Width = 97
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        238.125000000000000000
        21.166666666666670000
        256.645833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ret.IVA RG3130'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 100
      Top = 8
      Width = 48
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        264.583333333333400000
        21.166666666666670000
        127.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nro.Suc'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 110
      Top = 8
      Width = 63
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        21.166666666666670000
        166.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo Comp'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 120
      Top = 8
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        317.500000000000000000
        21.166666666666670000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Let.Comp'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 130
      Top = 8
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        343.958333333333400000
        21.166666666666670000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nro.Comp'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 140
      Top = 8
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        370.416666666666700000
        21.166666666666670000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Jurisdiccion'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 150
      Top = 8
      Width = 96
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        396.875000000000000000
        21.166666666666670000
        254.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cod.Jurisdiccion'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited QryBase: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select to_char(DEP.FH_DEPOSITO,'#39'MM'#39') as MES,'
      '       to_char(DEP.FH_DEPOSITO,'#39'YY'#39') as ANIO,'
      #9'   '#39'COMP'#39' as TARJETAS,'
      
        '     DECODE(ENT.COD_ENTIDAD,400,'#39'BANELCO'#39',ENT.DESCRIPCION) as DE' +
        'SCRIPCION,'
      
        #9'   DECODE(ENT.COD_ENTIDAD,400,'#39'CITIBANK NA'#39',ENT.DESCRIPCION) as' +
        ' DESCRIPCION1,'
      
        #9'   DECODE(ENT.COD_ENTIDAD,400,decode(COD_AJUSTE,47,'#39'30500005625' +
        #39',48,'#39'30710903812'#39'),ENT.CUIT) as CUIT,'
      #9'   DEP.FH_DEPOSITO,'
      #9'   DEP.NRO_COMPROBANTE_IVA,'
      
        #9'   decode(DEP.COD_AJUSTE,'#39'47'#39',DEP.IMPORTE_IVA,'#39'48'#39',DEP.IMPORTE_' +
        'IVA, DEP.IMPORTE_COBRADO) as IMPORTE,'
      #9'   '#39#39' as NUM_SUC,'
      #9'   '#39#39' as TIP_COMP,'
      #9'   '#39#39' as LET_COMP,'
      #9'   '#39#39' as NUM_COMP,'
      #9'   PRO.DESCRIPCION as PROVINCIA,'
      #9'   '#39#39' as COD_JUR,'
      #9'   '#39'PCS'#39' as SOBRE,'
      
        '                   decode(DEP.COD_AJUSTE,'#39'47'#39','#39'1'#39','#39'48'#39','#39'1'#39','#39'2'#39') ' +
        'as HOJA'
      'from @01 DEP,'
      '     gire.entidades ENT,'
      '     gire.provincias PRO'
      'where DEP.COD_AJUSTE in ( @02 )'
      'and DEP.COD_ENTIDAD = ENT.COD_ENTIDAD'
      'and DEP.COD_PROVINCIA = PRO.COD_PROVINCIA  (+)'
      'order by ENT.COD_ENTIDAD')
    object QryBaseMES: TStringField
      FieldName = 'MES'
      ReadOnly = True
      Size = 2
    end
    object QryBaseANIO: TStringField
      FieldName = 'ANIO'
      ReadOnly = True
      Size = 2
    end
    object QryBaseTARJETAS: TStringField
      FieldName = 'TARJETAS'
      ReadOnly = True
      FixedChar = True
      Size = 4
    end
    object QryBaseDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QryBaseDESCRIPCION1: TStringField
      FieldName = 'DESCRIPCION1'
      ReadOnly = True
      Size = 40
    end
    object QryBaseCUIT: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
    object QryBaseFH_DEPOSITO: TDateTimeField
      FieldName = 'FH_DEPOSITO'
    end
    object QryBaseNRO_COMPROBANTE_IVA: TStringField
      FieldName = 'NRO_COMPROBANTE_IVA'
      Size = 16
    end
    object QryBaseIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object QryBaseNUM_SUC: TStringField
      FieldName = 'NUM_SUC'
      ReadOnly = True
      FixedChar = True
      Size = 0
    end
    object QryBaseTIP_COMP: TStringField
      FieldName = 'TIP_COMP'
      ReadOnly = True
      FixedChar = True
      Size = 0
    end
    object QryBaseLET_COMP: TStringField
      FieldName = 'LET_COMP'
      ReadOnly = True
      FixedChar = True
      Size = 0
    end
    object QryBaseNUM_COMP: TStringField
      FieldName = 'NUM_COMP'
      ReadOnly = True
      FixedChar = True
      Size = 0
    end
    object QryBasePROVINCIA: TStringField
      FieldName = 'PROVINCIA'
    end
    object QryBaseCOD_JUR: TStringField
      FieldName = 'COD_JUR'
      ReadOnly = True
      FixedChar = True
      Size = 0
    end
    object QryBaseSOBRE: TStringField
      FieldName = 'SOBRE'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object QryBaseHOJA: TStringField
      FieldName = 'HOJA'
      ReadOnly = True
      Size = 1
    end
  end
  inherited QryTotales: TADOQuery
    Left = 262
  end
end
