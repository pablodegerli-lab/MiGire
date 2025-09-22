inherited RepoSalida064SucCableBco: TRepoSalida064SucCableBco
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
    Top = 234
    Height = 22
    Size.Values = (
      58.208333333333340000
      1957.916666666667000000)
    object QRDBText1: TQRDBText
      Left = 10
      Top = 0
      Width = 90
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        26.458333333333330000
        0.000000000000000000
        238.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_PROCESO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 320
      Top = 0
      Width = 172
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        846.666666666666600000
        0.000000000000000000
        455.083333333333300000)
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
    object QRDBText4: TQRDBText
      Left = 150
      Top = 0
      Width = 156
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
        412.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_SUCURSAL_CABLE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 520
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1375.833333333330000000
        0.000000000000000000
        171.979166666667000000)
      Alignment = taLeftJustify
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
    object QRDBText6: TQRDBText
      Left = 600
      Top = 0
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1587.500000000000000000
        0.000000000000000000
        156.104166666667000000)
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
  end
  inherited BandaEncabezado: TQRBand
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
        52.916666666666660000
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
    Height = 32
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
      84.666666666666680000
      1957.916666666667000000)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 10
      Top = 8
      Width = 107
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
        283.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Proceso'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 150
      Top = 8
      Width = 89
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
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sucursal Cable'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 520
      Top = 8
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1375.833333333330000000
        21.166666666666700000
        137.583333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 600
      Top = 8
      Width = 44
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1587.500000000000000000
        21.166666666666700000
        116.416666666667000000)
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
    object QRLabel2: TQRLabel
      Left = 320
      Top = 8
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        846.666666666666600000
        21.166666666666670000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Entidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
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
      end
      item
        Name = 'pTipoCob'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select FH_PROCESO,'
      '       COD_SUCURSAL_CABLE,'
      '       COD_ENTIDAD_SEGUN_CIA,'
      '       Sum(CANTIDAD) as CANTIDAD,'
      '       Sum(IMPORTE_COBRADO) as IMPORTE'
      'From('#9'   '
      'Select FH_PROCESO,'
      '       COD_SUCURSAL_CABLE,'
      '       COD_ENTIDAD_SEGUN_CIA,'
      '       1 as CANTIDAD,'
      '       IMPORTE_COBRADO'
      'From @01'
      'Where FH_PROCESO <= :pFh_Proceso and'
      '      TIPO_COBRANZA = :pTipoCob and'
      '      MARCA = '#39'A'#39' and'
      '      COD_ENTIDAD <> 997)'
      'Group by FH_PROCESO,COD_SUCURSAL_CABLE,COD_ENTIDAD_SEGUN_CIA'
      '')
    object QryBaseFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
    object QryBaseCOD_SUCURSAL_CABLE: TIntegerField
      FieldName = 'COD_SUCURSAL_CABLE'
    end
    object QryBaseCOD_ENTIDAD_SEGUN_CIA: TStringField
      FieldName = 'COD_ENTIDAD_SEGUN_CIA'
      Size = 10
    end
    object QryBaseCANTIDAD: TBCDField
      FieldName = 'CANTIDAD'
      Precision = 32
      Size = 0
    end
    object QryBaseIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      Precision = 32
      Size = 0
    end
  end
end
