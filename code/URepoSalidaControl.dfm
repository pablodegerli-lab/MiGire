inherited RepoSalidaControl: TRepoSalidaControl
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
    Top = 293
    Height = 23
    Size.Values = (
      60.854166666666680000
      1957.916666666667000000)
    object QRDBTImporte: TQRDBText
      Left = 251
      Top = 3
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        664.104166666667000000
        7.937500000000000000
        232.833333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clRed
      DataSet = QryBase
      DataField = 'IMPORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Mask = '######0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBTObservacion: TQRDBText
      Left = 345
      Top = 3
      Width = 268
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        912.812500000000000000
        7.937500000000000000
        709.083333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clLime
      DataSet = QryBase
      DataField = 'DESCRIPCION_MAIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 618
      Top = 3
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        7.937500000000000000
        206.375000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clAqua
      DataSet = QryBase
      DataField = 'CANTIDAD_REGISTROS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Mask = '######0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLNombreArchivo: TQRDBText
      Left = 7
      Top = 3
      Width = 146
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        7.937500000000000000
        386.291666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NOMBRE_ARCHIVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Mask = '######'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 157
      Top = 3
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        415.395833333333400000
        7.937500000000000000
        232.833333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clRed
      DataSet = QryBase
      DataField = 'CANTIDAD_MOVIMIENTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Mask = '######0'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 699
      Top = 3
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1849.437500000000000000
        7.937500000000000000
        100.541666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clRed
      DataSet = QryBase
      DataField = 'CANTIDAD_LOTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      Mask = '#########0'
      ParentFont = False
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
      Top = 8
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        21.166666666666670000
        164.041666666666700000)
      FontSize = 10
    end
    inherited QRImage1: TQRImage
      Top = 88
      Width = 89
      Height = 39
      Size.Values = (
        103.187500000000000000
        42.333333333333340000
        232.833333333333400000
        235.479166666666700000)
    end
    inherited lblNombreSistema: TQRLabel
      Top = 27
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        71.437500000000000000
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
      Top = 27
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        71.437500000000000000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Top = 46
      Size.Values = (
        44.979166666666670000
        1558.395833333333000000
        121.708333333333300000
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
      Top = 27
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        71.437500000000000000
        95.250000000000000000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Top = 46
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        121.708333333333300000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblDateLine: TQRLabel
      Top = 46
      Size.Values = (
        44.979166666666670000
        44.979166666666670000
        121.708333333333300000
        140.229166666666700000)
      FontSize = 8
    end
    inherited lblUsuario: TQRLabel
      Top = 65
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        171.979166666666700000
        153.458333333333300000)
      FontSize = 10
    end
    inherited lblNombreEmpresa: TQRLabel
      Top = 87
      Size.Values = (
        52.916666666666660000
        783.166666666666800000
        230.187500000000000000
        391.583333333333400000)
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Top = 113
      Size.Values = (
        50.270833333333330000
        857.250000000000000000
        298.979166666666700000
        240.770833333333300000)
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 316
      Top = 138
      Width = 107
      Size.Values = (
        44.979166666666670000
        836.083333333333400000
        365.125000000000000000
        283.104166666666700000)
      Caption = 'Fecha de Proceso'
      FontSize = 10
    end
  end
  object QRBand1: TQRBand [2]
    Left = 38
    Top = 202
    Width = 740
    Height = 91
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
      240.770833333333300000
      1957.916666666667000000)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 6
      Top = 72
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        15.875000000000000000
        190.500000000000000000
        129.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Archivo'
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
    object QRLabel2: TQRLabel
      Left = 187
      Top = 72
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        494.770833333333400000
        190.500000000000000000
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
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 289
      Top = 72
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        764.645833333333400000
        190.500000000000000000
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
    object QRLabel4: TQRLabel
      Left = 343
      Top = 72
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        907.520833333333400000
        190.500000000000000000
        211.666666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Observacion'
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
      Left = 20
      Top = 32
      Width = 351
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        52.916666666666660000
        84.666666666666680000
        928.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Informe del resultado del proceso 9 del dia 99/99/9999'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel10: TQRLabel
      Left = 637
      Top = 72
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1685.395833333333000000
        190.500000000000000000
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
    object QRLabel11: TQRLabel
      Left = 702
      Top = 72
      Width = 35
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1857.375000000000000000
        190.500000000000000000
        92.604166666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Lotes'
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
    Top = 316
    Width = 740
    Height = 96
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRBand2BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      254.000000000000000000
      1957.916666666667000000)
    BandType = rbSummary
    object QRLabel6: TQRLabel
      Left = 21
      Top = 27
      Width = 101
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        55.562500000000000000
        71.437500000000000000
        267.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Hora de env'#237'o: de'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLHoraDesde: TQRLabel
      Left = 122
      Top = 27
      Width = 34
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        322.791666666667000000
        71.437500000000000000
        89.958333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'QRLHoraDesde'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 159
      Top = 27
      Width = 16
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        420.687500000000000000
        71.437500000000000000
        42.333333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = ' a '
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLHoraHasta: TQRLabel
      Left = 177
      Top = 27
      Width = 34
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        468.312500000000000000
        71.437500000000000000
        89.958333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'QRLHoraHasta'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 212
      Top = 27
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        560.916666666666700000
        71.437500000000000000
        261.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = ', para su control.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 455
      Top = 64
      Width = 236
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1203.854166666667000000
        169.333333333333300000
        624.416666666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Atte: Centro de C'#243'mputos - GIRE S.A.'
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
      end>
    SQL.Strings = (
      'Select A.NOMBRE_ARCHIVO,'
      '       A.CANTIDAD_REGISTROS,'
      '       A.CANTIDAD_MOVIMIENTOS,'
      '       A.CANTIDAD_LOTES,'
      '       A.IMPORTE,'
      '       B.DESCRIPCION_MAIL'
      'From  GEMA.RESUMENES A,'
      '      GEMA.DISTRIBUCIONES_DETALLE B'
      'Where A.COD_CIA = :pCod_Cia and'
      '      A.NRO_PROCESO = :pNro_Proceso and'
      '      A.FH_DISTRIBUCION = :pFh_Distribucion and'
      '      A.NRO_CORRIDA = :pNro_Corrida and'
      '        A.COD_CIA = B.COD_CIA and'
      '        A.NRO_PROCESO = B.NRO_PROCESO and'
      '        A.COD_TIPO_ARCHIVO = B.COD_TIPO_ARCHIVO and'
      '        A.COD_DISENO = B.COD_DISENO and'
      '        A.NRO_ORDEN = B.NRO_ORDEN and'
      '        B.INFORME_MAIL = 1 and'
      '      @01      '
      'union '
      'Select '#39#39' as NOMBRE_ARCHIVO,'
      '       to_number(0) as CANTIDAD_REGISTROS,'
      '       to_number(0) as CANTIDAD_MOVIMIENTOS,'
      '       to_number(4) as CANTIDAD_LOTES,'
      '       to_number(0) as IMPORTE,'
      '       '#39#39' as DESCRIPCION_MAIL'
      'from dual       '
      '    ')
  end
end
