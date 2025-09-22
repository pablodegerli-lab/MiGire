inherited RepoSalida018EntSucCableDebito: TRepoSalida018EntSucCableDebito
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
      Width = 90
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
    object QRDBText3: TQRDBText
      Left = 76
      Top = 0
      Width = 141
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        201.083333333333300000
        0.000000000000000000
        373.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_CABLEVISION_ID'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 135
      Top = 0
      Width = 93
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        357.187500000000000000
        0.000000000000000000
        246.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DESCCABLE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 192
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
        508.000000000000000000
        0.000000000000000000
        240.770833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_ENTIDAD'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 246
      Top = 0
      Width = 72
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        650.875000000000000000
        0.000000000000000000
        190.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_COBRO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 320
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
        846.666666666666600000
        0.000000000000000000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CANT_TOT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 380
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
        1005.416666666667000000
        0.000000000000000000
        145.520833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMP_TOT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 437
      Top = 0
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1156.229166666667000000
        0.000000000000000000
        206.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CANT_ACEP'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 510
      Top = 0
      Width = 67
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1349.375000000000000000
        0.000000000000000000
        177.270833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMP_ACEP'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 581
      Top = 0
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1537.229166666667000000
        0.000000000000000000
        206.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CANT_RECH'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 654
      Top = 0
      Width = 67
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1730.375000000000000000
        0.000000000000000000
        177.270833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMP_RECH'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited BandaEncabezado: TQRBand
    Enabled = False
    Size.Values = (
      433.916666666666800000
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
      Width = 64
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
        169.333333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fh_Prestal'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 192
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
        508.000000000000000000
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
    object QRLabel3: TQRLabel
      Left = 135
      Top = 8
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        357.187500000000000000
        21.166666666666670000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 76
      Top = 8
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        201.083333333333300000
        21.166666666666670000
        137.583333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sucursal'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 320
      Top = 8
      Width = 52
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
        137.583333333333300000)
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
      Left = 380
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
        1005.416666666667000000
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
    object QRLabel7: TQRLabel
      Left = 246
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
        650.875000000000000000
        21.166666666666670000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fh_Cobro'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 437
      Top = 8
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1156.229166666667000000
        21.166666666666670000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cant_Acep'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 510
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
        1349.375000000000000000
        21.166666666666670000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Imp_Acep'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 581
      Top = 8
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1537.229166666667000000
        21.166666666666670000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cant_Rech'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 654
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
        1730.375000000000000000
        21.166666666666670000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Imp_Rech'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited QryBase: TADOQuery
    SQL.Strings = (
      'Select  A.FH_PROCESO,'
      '            A.COD_CABLEVISION_ID,'
      '           Max(B.DESCRIPCION) AS DESCCABLE,'
      '           A.COD_ENTIDAD,'
      '           A.FH_COBRO,'
      '           Sum(A.CANT_ACEP+A.CANT_RECH) AS CANT_TOT,'
      '           Sum(A.IMP_ACEP+A.IMP_RECH) AS IMP_TOT,'
      '           Sum(CANT_ACEP) AS CANT_ACEP,'
      '           Sum(A.IMP_ACEP) AS IMP_ACEP,'
      '           Sum(CANT_RECH) AS CANT_RECH,'
      '           Sum(A.IMP_RECH) AS IMP_RECH'
      'From (SELECT FH_PROCESO,'
      
        '                        decode(COD_CABLEVISION_ID,98,8,COD_CABLE' +
        'VISION_ID) as COD_CABLEVISION_ID,'
      '                        COD_SUCURSAL_CABLE,'
      #9'        COD_ENTIDAD,'
      #9'        FH_COBRO,'
      '                        1 AS CANT_ACEP,'
      '                        IMPORTE_COBRADO AS IMP_ACEP,'
      '                        0 AS CANT_RECH,'
      '                        0 AS IMP_RECH'
      '          FROM GEMA.COBRANZAS_00018'
      '          WHERE TIPO_COBRANZA = '#39'D'#39' AND MARCA = '#39'A'#39
      '          UNION ALL'#9#9' '
      '          SELECT FH_PROCESO,'
      
        '                         decode(COD_CABLEVISION_ID,98,8,COD_CABL' +
        'EVISION_ID) as COD_CABLEVISION_ID,'
      '                         COD_SUCURSAL_CABLE,'
      '                         COD_ENTIDAD,'
      '                         FH_COBRO,'
      '                         0 AS CANT_ACEP,'
      '                         0 AS IMP_ACEP,'
      '                         1 AS CANT_RECH,'
      '                         IMPORTE_COBRADO AS IMP_RECH'
      '          FROM GEMA.COBRANZAS_00018'
      '          WHERE TIPO_COBRANZA = '#39'D'#39' AND MARCA = '#39'R'#39'  ) A,'
      '                         GIRE.SUCURSALES_POR_CABLE_00018 B'
      'Where A.COD_SUCURSAL_CABLE = B.COD_SUCURSAL_CABLE'
      
        'Group By A.FH_PROCESO, A.COD_CABLEVISION_ID, A.COD_ENTIDAD,A.FH_' +
        'COBRO')
    object QryBaseFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
    object QryBaseCOD_CABLEVISION_ID: TBCDField
      FieldName = 'COD_CABLEVISION_ID'
      Precision = 32
      Size = 0
    end
    object QryBaseDESCCABLE: TStringField
      FieldName = 'DESCCABLE'
    end
    object QryBaseCOD_ENTIDAD: TBCDField
      FieldName = 'COD_ENTIDAD'
      Precision = 32
      Size = 0
    end
    object QryBaseFH_COBRO: TDateTimeField
      FieldName = 'FH_COBRO'
    end
    object QryBaseCANT_TOT: TBCDField
      FieldName = 'CANT_TOT'
      Precision = 32
      Size = 0
    end
    object QryBaseIMP_TOT: TBCDField
      FieldName = 'IMP_TOT'
      Precision = 32
      Size = 0
    end
    object QryBaseCANT_ACEP: TBCDField
      FieldName = 'CANT_ACEP'
      Precision = 32
      Size = 0
    end
    object QryBaseIMP_ACEP: TBCDField
      FieldName = 'IMP_ACEP'
      Precision = 32
      Size = 0
    end
    object QryBaseCANT_RECH: TBCDField
      FieldName = 'CANT_RECH'
      Precision = 32
      Size = 0
    end
    object QryBaseIMP_RECH: TBCDField
      FieldName = 'IMP_RECH'
      Precision = 32
      Size = 0
    end
  end
end
