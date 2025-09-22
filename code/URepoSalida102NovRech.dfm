inherited RepoSalida102NovRech: TRepoSalida102NovRech
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
  inherited BandaDetalle: TQRBand
    Top = 225
    Width = 980
    Height = 48
    Size.Values = (
      127.000000000000000000
      2592.916666666667000000)
    object A00: TQRDBText
      Left = 16
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
        42.333333333333340000
        0.000000000000000000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CLIENTE'
      OnPrint = A00Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 160
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
        423.333333333333300000
        0.000000000000000000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TIPO_TRX'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 304
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
        804.333333333333200000
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
    object QRDBText3: TQRDBText
      Left = 448
      Top = 0
      Width = 48
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1185.333333333333000000
        0.000000000000000000
        127.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_TRX'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 648
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
        1714.500000000000000000
        0.000000000000000000
        261.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TIPO_RECHAZO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited BandaEncabezado: TQRBand
    Width = 980
    Size.Values = (
      433.916666666666700000
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
      Left = 853
      Size.Values = (
        44.979166666666670000
        2256.895833333333000000
        21.166666666666670000
        108.479166666666700000)
      FontSize = 10
    end
    inherited lblFecha: TQRLabel
      Left = 853
      Size.Values = (
        44.979166666666670000
        2256.895833333333000000
        84.666666666666680000
        97.895833333333340000)
      FontSize = 10
    end
    inherited lblHora: TQRLabel
      Left = 853
      Size.Values = (
        44.979166666666670000
        2256.895833333333000000
        148.166666666666700000
        74.083333333333340000)
      FontSize = 10
    end
    inherited QRSysData1: TQRSysData
      Left = 925
      Size.Values = (
        44.979166666666670000
        2447.395833333333000000
        21.166666666666670000
        121.708333333333400000)
      FontSize = 10
    end
    inherited QRSysData2: TQRSysData
      Left = 925
      Size.Values = (
        44.979166666666670000
        2447.395833333333000000
        84.666666666666680000
        95.250000000000000000)
      FontSize = 10
    end
    inherited QRSysData3: TQRSysData
      Left = 925
      Size.Values = (
        44.979166666666670000
        2447.395833333333000000
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
      Left = 416
      Size.Values = (
        52.916666666666660000
        1100.666666666667000000
        232.833333333333400000
        391.583333333333400000)
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 444
      Size.Values = (
        50.270833333333330000
        1174.750000000000000000
        317.500000000000000000
        240.770833333333300000)
      Alignment = taCenter
      AlignToBand = True
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 489
      Width = 1
      Size.Values = (
        44.979166666666670000
        1293.812500000000000000
        370.416666666666700000
        2.645833333333333000)
      Caption = ''
      FontSize = 10
    end
  end
  object QRBand1: TQRBand [2]
    Left = 38
    Top = 202
    Width = 980
    Height = 23
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
      60.854166666666680000
      2592.916666666667000000)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 16
      Top = 0
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        0.000000000000000000
        232.833333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N'#176' Cta Erroneo'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 160
      Top = 0
      Width = 114
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        423.333333333333300000
        0.000000000000000000
        301.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de transacci'#243'n'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 304
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
        804.333333333333200000
        0.000000000000000000
        254.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Entidad / Tarjeta'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 448
      Top = 0
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1185.333333333333000000
        0.000000000000000000
        293.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Transacci'#243'n'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 648
      Top = 0
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1714.500000000000000000
        0.000000000000000000
        211.666666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo Rechazo'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited QryBase: TADOQuery
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TO_CHAR(CLIENTE) as cliente,'
      
        '       CASE WHEN COD_TRX = 7 THEN '#39'Alta'#39' WHEN COD_TRX = 8 THEN '#39 +
        'Baja'#39' END as TIPO_TRX,'
      '       COD_ENTIDAD,'
      '       TO_CHAR (FH_PROCESO, '#39'dd/mm/yyyy'#39') as FH_TRX,'
      '       CASE'
      '          WHEN COD_RECHAZO_GIRE = '#39'G0014'#39' THEN '#39'CE'#39
      '          WHEN COD_RECHAZO_GIRE IN ('#39'G0233'#39', '#39'G0299'#39') THEN '#39'D'#39
      '          ELSE '#39'O'#39
      '       END as TIPO_RECHAZO'
      '  FROM @01'
      ' WHERE     FH_PROCESO <= TO_DATE ( :P1, '#39'dd/mm/yyyy'#39')'
      'AND COD_RECHAZO_GIRE IS NOT NULL')
    Left = 134
    object QryBaseCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object QryBaseTIPO_TRX: TStringField
      FieldName = 'TIPO_TRX'
      Size = 10
    end
    object QryBaseCOD_ENTIDAD: TIntegerField
      FieldName = 'COD_ENTIDAD'
    end
    object QryBaseFH_TRX: TStringField
      FieldName = 'FH_TRX'
      Size = 15
    end
    object QryBaseTIPO_RECHAZO: TStringField
      FieldName = 'TIPO_RECHAZO'
      Size = 15
    end
  end
  inherited QryTotales: TADOQuery
    Parameters = <
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select * from('
      'SELECT Count(8) as CANTIDAD,'
      '               0 as IMPORTE   '
      'FROM @01'
      
        'WHERE FH_PROCESO <= :pFh_Proceso and cod_rechazo_gire is not nul' +
        'l)'
      'where cantidad > 0')
  end
end
