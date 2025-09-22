inherited RepoSalida017Cobranzas: TRepoSalida017Cobranzas
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
      Width = 54
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
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'AGENTE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 340
      Top = 0
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        899.583333333333000000
        0.000000000000000000
        129.645833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NUMERO_CUPON'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 56
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
        148.166666666666700000
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
    object QRDBText4: TQRDBText
      Left = 120
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
        317.500000000000000000
        0.000000000000000000
        150.812500000000000000)
      Alignment = taLeftJustify
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
    object QRDBText5: TQRDBText
      Left = 430
      Top = 0
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1137.708333333330000000
        0.000000000000000000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CUOTAS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 480
      Top = 0
      Width = 71
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1270.000000000000000000
        0.000000000000000000
        187.854166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FECHA_OP'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 280
      Top = 0
      Width = 55
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        740.833333333333400000
        0.000000000000000000
        145.520833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NRO_OP'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 180
      Top = 0
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        476.250000000000000000
        0.000000000000000000
        261.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_AUTORIZA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 550
      Top = 0
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1455.208333333330000000
        0.000000000000000000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TIPO_FC'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 610
      Top = 0
      Width = 61
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1613.958333333330000000
        0.000000000000000000
        161.395833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FACTURA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 670
      Top = 0
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1772.708333333330000000
        0.000000000000000000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CLIENTE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 370
      Top = 0
      Width = 97
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        978.958333333333400000
        0.000000000000000000
        256.645833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'LOTE_TARJETA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText13: TQRDBText
      Left = 726
      Top = 0
      Width = 172
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1920.875000000000000000
        0.000000000000000000
        455.083333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_ENTIDAD_SEGUN_CIA'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 736
      Top = 0
      Width = 89
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1947.333333333330000000
        0.000000000000000000
        235.479166666667000000)
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
      Width = 42
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
        111.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Agente'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 120
      Top = 8
      Width = 40
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
        105.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tarjeta'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 340
      Top = 8
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        899.583333333333400000
        21.166666666666670000
        164.041666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nro Cup'#243'n'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 56
      Top = 8
      Width = 44
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        148.166666666666700000
        21.166666666666670000
        116.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Importe'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 370
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
        978.958333333333400000
        21.166666666666670000
        68.791666666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Lote'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 480
      Top = 8
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1270.000000000000000000
        21.166666666666700000
        153.458333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha_op'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 280
      Top = 8
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        740.833333333333400000
        21.166666666666670000
        111.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nro_op'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 180
      Top = 8
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        476.250000000000000000
        21.166666666666670000
        203.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cod_autoriza'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 550
      Top = 8
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1455.208333333330000000
        21.166666666666700000
        121.708333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo FC'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 610
      Top = 8
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1613.958333333330000000
        21.166666666666700000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Factura'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 670
      Top = 8
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1772.708333333330000000
        21.166666666666700000
        134.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Solicitud'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 430
      Top = 8
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1137.708333333330000000
        21.166666666666700000
        111.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cuotas'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 726
      Top = 8
      Width = 73
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1920.875000000000000000
        21.166666666666700000
        193.145833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cod_entidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 736
      Top = 8
      Width = 69
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1947.333333333330000000
        21.166666666666700000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Descripcion'
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
      'select AGENTE,'
      '          IMPORTE_EN_PESOS as IMPORTE,'
      '         NUMERO_TARJETA as TARJETA,'
      '         COD_AUTORIZACION as COD_AUTORIZA,'
      '         NUMERO_OPERACION as NRO_OP,'
      '         NUMERO_CUPON,'
      '         LOTE_TARJETA,'
      '         CUOTA_TARJETA as CUOTAS,'
      '         FH_COBRO as FECHA_OP,'
      '         Decode(substr(FACTURA,1,1),1,'#39'A'#39','#39'B'#39') as TIPO_FC,'
      '         chr(160)||substr(FACTURA,2,12) as FACTURA,'
      '         CLIENTE,'
      '         COD_ENTIDAD_SEGUN_CIA,'
      '         E.DESCRIPCION'
      ' from GEMA.COBRANZAS_00017 C,'
      '         GIRE.ENTIDADES E'
      'where C.COD_ENTIDAD_SEGUN_CIA=E.COD_ENTIDAD and'
      '  MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p0,'#39'dd/mm/yyyy'#39') and'
      
        '    IMPORTE_EN_PESOS > 0 and NRO_PROCESO_GEMA = :pNP0 and C.COD_' +
        'ENTIDAD = '#39'997'#39
      'union all'
      '    select AGENTE,'
      '       IMPORTE_MONEDA_1 as IMPORTE,'
      '         NUMERO_TARJETA as TARJETA,'
      '         COD_AUTORIZACION as COD_AUTORIZA,'
      '         NUMERO_OPERACION as NRO_OP,'
      '         NUMERO_CUPON,'
      '         LOTE_TARJETA,'
      '         CUOTA_TARJETA as CUOTAS,'
      '         FH_COBRO as FECHA_OP,'
      '         Decode(substr(FACTURA,1,1),1,'#39'A'#39','#39'B'#39') as TIPO_FC,'
      '         chr(160)||substr(FACTURA,2,12) as FACTURA,'
      '         CLIENTE,'
      '         COD_ENTIDAD_SEGUN_CIA,'
      '         E.DESCRIPCION'
      ' from GEMA.COBRANZAS_00017 C,'
      '         GIRE.ENTIDADES E'
      'where C.COD_ENTIDAD_SEGUN_CIA=E.COD_ENTIDAD and'
      '     MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p1,'#39'dd/mm/yyyy'#39') and'
      
        '    IMPORTE_MONEDA_1 > 0 and NRO_PROCESO_GEMA= :pNP1 and C.COD_E' +
        'NTIDAD = '#39'997'#39
      '    union all'
      '    select AGENTE,'
      '       IMPORTE_MONEDA_2 as IMPORTE,'
      '         NUMERO_TARJETA as TARJETA,'
      '         COD_AUTORIZACION as COD_AUTORIZA,'
      '         NUMERO_OPERACION as NRO_OP,'
      '         NUMERO_CUPON,'
      '         LOTE_TARJETA,'
      '         CUOTA_TARJETA as CUOTAS,'
      '         FH_COBRO as FECHA_OP,'
      '         Decode(substr(FACTURA,1,1),1,'#39'A'#39','#39'B'#39') as TIPO_FC,'
      '         chr(160)||substr(FACTURA,2,12) as FACTURA,'
      '         CLIENTE,'
      '         COD_ENTIDAD_SEGUN_CIA,'
      '         E.DESCRIPCION'
      ' from GEMA.COBRANZAS_00017 C,'
      '         GIRE.ENTIDADES E'
      'where C.COD_ENTIDAD_SEGUN_CIA=E.COD_ENTIDAD and'
      '   MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p2,'#39'dd/mm/yyyy'#39') and'
      
        '    IMPORTE_MONEDA_2 > 0 and NRO_PROCESO_GEMA= :pNP2 and C.COD_E' +
        'NTIDAD = '#39'997'#39
      '    union all'
      '    select  AGENTE,'
      '       IMPORTE_MONEDA_3 as IMPORTE,'
      '         NUMERO_TARJETA as TARJETA,'
      '         COD_AUTORIZACION as COD_AUTORIZA,'
      '         NUMERO_OPERACION as NRO_OP,'
      '         NUMERO_CUPON,'
      '         LOTE_TARJETA,'
      '         CUOTA_TARJETA as CUOTAS,'
      '         FH_COBRO as FECHA_OP,'
      '         Decode(substr(FACTURA,1,1),1,'#39'A'#39','#39'B'#39') as TIPO_FC,'
      '         chr(160)||substr(FACTURA,2,12) as FACTURA,'
      '         CLIENTE,'
      '         COD_ENTIDAD_SEGUN_CIA,'
      '         E.DESCRIPCION'
      ' from GEMA.COBRANZAS_00017 C,'
      '         GIRE.ENTIDADES E'
      'where C.COD_ENTIDAD_SEGUN_CIA=E.COD_ENTIDAD and'
      '    MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p3,'#39'dd/mm/yyyy'#39') and'
      
        '    IMPORTE_MONEDA_3 > 0 and NRO_PROCESO_GEMA= :pNP3 and C.COD_E' +
        'NTIDAD = '#39'997'#39
      '    union all'
      '    select  AGENTE,'
      '       IMPORTE_MONEDA_4 as IMPORTE,'
      '         NUMERO_TARJETA as TARJETA,'
      '         COD_AUTORIZACION as COD_AUTORIZA,'
      '         NUMERO_OPERACION as NRO_OP,'
      '         NUMERO_CUPON,'
      '         LOTE_TARJETA,'
      '         CUOTA_TARJETA as CUOTAS,'
      '         FH_COBRO as FECHA_OP,'
      '         Decode(substr(FACTURA,1,1),1,'#39'A'#39','#39'B'#39') as TIPO_FC,'
      '         chr(160)||substr(FACTURA,2,12) as FACTURA,'
      '         CLIENTE,'
      '         COD_ENTIDAD_SEGUN_CIA,'
      '         E.DESCRIPCION'
      ' from GEMA.COBRANZAS_00017 C,'
      '         GIRE.ENTIDADES E'
      'where C.COD_ENTIDAD_SEGUN_CIA=E.COD_ENTIDAD and'
      '    MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p4,'#39'dd/mm/yyyy'#39') and'
      
        '    IMPORTE_MONEDA_4 > 0 and NRO_PROCESO_GEMA= :pNP4 and C.COD_E' +
        'NTIDAD = '#39'997'#39
      '    union all'
      '    select  AGENTE,'
      '         IMPORTE_COBRADO as IMPORTE,'
      '         NUMERO_TARJETA as TARJETA,'
      '         COD_AUTORIZACION as COD_AUTORIZA,'
      '         NUMERO_OPERACION as NRO_OP,'
      '         NUMERO_CUPON,'
      '         LOTE_TARJETA,'
      '         CUOTA_TARJETA as CUOTAS,'
      '         FH_COBRO as FECHA_OP,'
      '         Decode(substr(FACTURA,1,1),1,'#39'A'#39','#39'B'#39') as TIPO_FC,'
      '         chr(160)||substr(FACTURA,2,12) as FACTURA,'
      '         CLIENTE,'
      '         COD_ENTIDAD_SEGUN_CIA,'
      '         E.DESCRIPCION'
      ' from GEMA.COBRANZAS_00017 C,'
      '         GIRE.ENTIDADES E'
      'where C.COD_ENTIDAD_SEGUN_CIA=E.COD_ENTIDAD and'
      
        '          MARCA = '#39'A'#39' and FH_PROCESO <= To_Date(:p5,'#39'dd/mm/yyyy'#39 +
        ') and'
      '          IMPORTE_EN_PESOS = 0 and IMPORTE_MONEDA_1 = 0 and'
      '          IMPORTE_MONEDA_2 = 0 and IMPORTE_MONEDA_3 = 0 and'
      
        '          IMPORTE_MONEDA_4 = 0 and NRO_PROCESO_GEMA= :pNP5 and C' +
        '.COD_ENTIDAD = '#39'997'#39)
    object QryBaseAGENTE: TIntegerField
      FieldName = 'AGENTE'
    end
    object QryBaseIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      Precision = 32
      Size = 0
    end
    object QryBaseTARJETA: TStringField
      FieldName = 'TARJETA'
      Size = 30
    end
    object QryBaseCOD_AUTORIZA: TStringField
      FieldName = 'COD_AUTORIZA'
      Size = 6
    end
    object QryBaseNRO_OP: TBCDField
      FieldName = 'NRO_OP'
      Precision = 32
      Size = 0
    end
    object QryBaseNUMERO_CUPON: TIntegerField
      FieldName = 'NUMERO_CUPON'
    end
    object QryBaseLOTE_TARJETA: TIntegerField
      FieldName = 'LOTE_TARJETA'
    end
    object QryBaseCUOTAS: TIntegerField
      FieldName = 'CUOTAS'
    end
    object QryBaseFECHA_OP: TDateTimeField
      FieldName = 'FECHA_OP'
    end
    object QryBaseTIPO_FC: TStringField
      FieldName = 'TIPO_FC'
      ReadOnly = True
      Size = 1
    end
    object QryBaseFACTURA: TStringField
      FieldName = 'FACTURA'
      ReadOnly = True
      Size = 13
    end
    object QryBaseCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object QryBaseCOD_ENTIDAD_SEGUN_CIA: TStringField
      FieldName = 'COD_ENTIDAD_SEGUN_CIA'
      Size = 10
    end
    object QryBaseDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 40
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
