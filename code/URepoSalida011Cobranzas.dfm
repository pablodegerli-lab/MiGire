inherited RepoSalida011Cobranzas: TRepoSalida011Cobranzas
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
    Top = 281
    Height = 19
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    object Nombre_Archivo: TQRDBText
      Left = 1
      Top = 1
      Width = 56
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2.645833333333333000
        2.645833333333333000
        148.166666666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_ENTIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object IMPORTE_ACEPTADOS: TQRDBText
      Left = 365
      Top = 1
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        965.729166666666800000
        2.645833333333333000
        198.437500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMPORTE_APROBADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#########0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object IMPORTE_REVERSIONES: TQRDBText
      Left = 661
      Top = 1
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1748.895833333334000000
        2.645833333333333000
        198.437500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMPORTE_RECHAZADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#########0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object CANTIDAD_ACEPTADOS: TQRDBText
      Left = 288
      Top = 1
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        762.000000000000000000
        2.645833333333333000
        140.229166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CANTIDAD_APROBADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object CANTIDAD_REVERSIONES: TQRDBText
      Left = 553
      Top = 1
      Width = 63
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1463.145833333333000000
        2.645833333333333000
        166.687500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CANTIDAD_RECHAZADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 65
      Top = 1
      Width = 128
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        171.979166666666700000
        2.645833333333333000
        338.666666666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  inherited BandaEncabezado: TQRBand
    Height = 219
    Size.Values = (
      579.437500000000000000
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
      Left = 245
      Top = 104
      Width = 249
      Enabled = False
      Size.Values = (
        52.916666666666660000
        648.229166666666800000
        275.166666666666700000
        658.812500000000000000)
      Caption = 'Totales de Facturaci'#243'n por Entidad'
      Font.Height = -15
      Font.Style = [fsBold]
      FontSize = 11
    end
    inherited lbltitulo: TQRSysData
      Left = 243
      Top = 40
      Width = 254
      Height = 20
      Size.Values = (
        52.916666666666660000
        642.937500000000000000
        105.833333333333300000
        672.041666666666800000)
      Alignment = taCenter
      AlignToBand = True
      Font.Height = -16
      Text = '11 - AMX PARAGUAY'
      FontSize = 12
    end
    inherited QRLTitulo2: TQRLabel
      Left = 315
      Top = 131
      Width = 109
      Size.Values = (
        44.979166666666670000
        833.437500000000000000
        346.604166666666700000
        288.395833333333400000)
      Caption = 'Fecha de proceso:'
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 346
      Top = 71
      Width = 48
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        915.458333333333200000
        187.854166666666700000
        127.000000000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'D'#233'bito'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel13: TQRLabel
      Left = 262
      Top = 155
      Width = 216
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        693.208333333333400000
        410.104166666666700000
        571.500000000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de Transacci'#243'n: FACTURACION'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 308
      Top = 179
      Width = 124
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        814.916666666666800000
        473.604166666666700000
        328.083333333333400000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Por fecha de proceso'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 245
      Top = 104
      Width = 249
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        648.229166666666800000
        275.166666666666700000
        658.812500000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Totales de Facturaci'#243'n por Entidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object QRBand1: TQRBand [2]
    Left = 38
    Top = 257
    Width = 740
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      63.500000000000000000
      1957.916666666667000000)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 2
      Top = 1
      Width = 127
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        2.645833333333333000
        336.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Entidad/Descripci'#243'n'
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
      Left = 215
      Top = 1
      Width = 128
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        568.854166666666800000
        2.645833333333333000
        338.666666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad Aceptados'
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
      Left = 392
      Top = 1
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1037.166666666667000000
        2.645833333333333000
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
    object QRLabel6: TQRLabel
      Left = 494
      Top = 1
      Width = 123
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1307.041666666667000000
        2.645833333333333000
        325.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad Rechazos'
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
      Left = 688
      Top = 1
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1820.333333333333000000
        2.645833333333333000
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
  end
  object QRBand2: TQRBand [3]
    Left = 38
    Top = 300
    Width = 740
    Height = 31
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clSilver
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      82.020833333333340000
      1957.916666666667000000)
    BandType = rbSummary
    object QRLabel9: TQRLabel
      Left = 1
      Top = 8
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
        21.166666666666670000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTALES:'
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
    object QRESum: TQRExpr
      Left = 274
      Top = 8
      Width = 67
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        724.958333333333400000
        21.166666666666670000
        177.270833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qryBase.CANTIDAD_APROBADOS)'
      FontSize = 8
    end
    object QRExpr1: TQRExpr
      Left = 366
      Top = 8
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        968.375000000000000000
        21.166666666666670000
        198.437500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qrybase.IMPORTE_APROBADOS)'
      Mask = '#########0.00'
      FontSize = 8
    end
    object QRExpr2: TQRExpr
      Left = 550
      Top = 8
      Width = 67
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1455.208333333333000000
        21.166666666666670000
        177.270833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qrybase.CANTIDAD_RECHAZADOS)'
      FontSize = 8
    end
    object QRExpr3: TQRExpr
      Left = 662
      Top = 8
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1751.541666666667000000
        21.166666666666670000
        198.437500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = True
      WordWrap = True
      Expression = 'SUM(qrybase.IMPORTE_RECHAZADOS)'
      Mask = '#########0.00'
      FontSize = 8
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
      
        'select COD_ENTIDAD, DESCRIPCION, SUM(CANTA) as CANTIDAD_APROBADO' +
        'S, SUM(IMPA) as IMPORTE_APROBADOS, '
      
        '        SUM(CANTR) as CANTIDAD_RECHAZADOS, SUM(IMPR) as IMPORTE_' +
        'RECHAZADOS'
      'from ('
      '        select a.COD_ENTIDAD, DESCRIPCION,'
      '        case when RESPUESTA = '#39'A'#39' then 1 else 0 end as CANTA,'
      
        '        case when RESPUESTA = '#39'A'#39' then IMPORTE_COBRADO else 0 en' +
        'd as IMPA,'
      '        case when RESPUESTA <> '#39'A'#39' then 1 else 0 end as CANTR,'
      
        '        case when RESPUESTA <> '#39'A'#39' then IMPORTE_COBRADO else 0 e' +
        'nd as IMPR '
      
        '        from GEMA.COBRANZAS_00011 a inner join GIRE.ENTIDADES b ' +
        'on A.COD_ENTIDAD = B.COD_ENTIDAD '
      '        where FH_PROCESO <= To_Date(:p1,'#39'dd/mm/yyyy'#39') '
      '    )'
      'group by COD_ENTIDAD, DESCRIPCION    ')
  end
  inherited QryTotales: TADOQuery
    Parameters = <
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'pInconsistencia'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      '')
  end
end
