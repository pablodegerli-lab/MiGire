inherited RepoGemaBaseEmpresa: TRepoGemaBaseEmpresa
  DataSet = QryBase
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
  PrintIfEmpty = False
  ShowProgress = False
  inherited BandaDetalle: TQRBand
    Top = 202
    BeforePrint = BandaDetalleBeforePrint
    Size.Values = (
      63.500000000000000000
      1957.916666666667000000)
  end
  inherited BandaEncabezado: TQRBand
    Height = 164
    BeforePrint = BandaEncabezadoBeforePrint
    Size.Values = (
      433.916666666666700000
      1957.916666666667000000)
    object QRLGire: TQRLabel [0]
      Left = 18
      Top = 24
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        63.500000000000000000
        164.041666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'GIRE S.A.'
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
    inherited QRImage1: TQRImage
      Width = 65
      Height = 33
      Size.Values = (
        87.312500000000000000
        42.333333333333300000
        21.166666666666700000
        171.979166666667000000)
    end
    inherited lblNombreSistema: TQRLabel
      Width = 86
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        127.000000000000000000
        227.541666666666700000)
      Font.Height = -11
      ParentFont = False
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
        121.708333333333400000)
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
      Left = 296
      Width = 148
      Height = 20
      Size.Values = (
        52.916666666666660000
        783.166666666666700000
        232.833333333333400000
        391.583333333333400000)
      Font.Height = -16
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      FontSize = 12
    end
    inherited lbltitulo: TQRSysData
      Left = 324
      Top = 120
      Width = 91
      Height = 19
      Size.Values = (
        50.270833333333330000
        857.250000000000000000
        317.500000000000000000
        240.770833333333300000)
      Font.Height = -15
      Font.Style = [fsBold]
      ParentFont = False
      FontSize = 11
    end
    object QRLTitulo2: TQRLabel
      Left = 297
      Top = 140
      Width = 145
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        785.812500000000000000
        370.416666666666700000
        383.645833333333400000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Otro titulo para el reporte'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QryBase: TADOQuery
    Connection = GemaConexion.ADOConec
    CursorType = ctOpenForwardOnly
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 182
    Top = 46
  end
  object QryTotales: TADOQuery
    Connection = GemaConexion.ADOConec
    Parameters = <>
    Left = 230
    Top = 46
  end
end
