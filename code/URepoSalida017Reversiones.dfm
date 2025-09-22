inherited RepoSalida017Reversiones: TRepoSalida017Reversiones
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
    Top = 259
    Size.Values = (
      63.500000000000000000
      1957.916666666667000000)
    object QRDBText3: TQRDBText
      Left = 39
      Top = 4
      Width = 54
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        103.187500000000000000
        10.583333333333300000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CLIENTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 194
      Top = 4
      Width = 91
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        513.291666666667000000
        10.583333333333300000
        240.770833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CBU_TARJETA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 378
      Top = 4
      Width = 59
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1000.125000000000000000
        10.583333333333300000
        156.104166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMPORTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '#,###,##0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 466
      Top = 4
      Width = 113
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1232.958333333330000000
        10.583333333333300000
        298.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_VENCIMIENTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 618
      Top = 4
      Width = 109
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1635.125000000000000000
        10.583333333333300000
        288.395833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_DEVOLUCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  inherited BandaEncabezado: TQRBand
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
      Left = 252
      Top = 118
      Width = 331
      Size.Values = (
        50.270833333333330000
        666.750000000000000000
        312.208333333333400000
        875.770833333333400000)
      Text = 'Listado de Reversiones en Banco'
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 288
      Width = 163
      Size.Values = (
        44.979166666666670000
        762.000000000000000000
        370.416666666666700000
        431.270833333333400000)
      Caption = 'Fecha de proceso: 99/99/99'
      FontSize = 10
    end
  end
  object QRGEntidad: TQRGroup [2]
    Left = 38
    Top = 202
    Width = 740
    Height = 57
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
      150.812500000000000000
      1957.916666666667000000)
    Expression = 'QryBase.ENTIDAD'
    FooterBand = BandaPiedeGrupo
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel1: TQRLabel
      Left = 16
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
        42.333333333333340000
        21.166666666666670000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Entidad: '
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
      Left = 40
      Top = 35
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        105.833333333333300000
        92.604166666666680000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cliente'
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
      Left = 193
      Top = 35
      Width = 28
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        510.645833333333300000
        92.604166666666680000
        74.083333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CBU'
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
      Left = 388
      Top = 35
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1026.583333333330000000
        92.604166666666700000
        132.291666666667000000)
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
    object QRLabel2: TQRLabel
      Left = 454
      Top = 35
      Width = 124
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1201.208333333330000000
        92.604166666666700000
        328.083333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Vencimiento'
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
      Left = 606
      Top = 35
      Width = 115
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1603.375000000000000000
        92.604166666666700000
        304.270833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Devolucion'
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
    object QRDBText1: TQRDBText
      Left = 75
      Top = 8
      Width = 42
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        198.437500000000000000
        21.166666666666700000
        111.125000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'ENTIDAD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 120
      Top = 8
      Width = 92
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        317.500000000000000000
        21.166666666666670000
        243.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'RAZONSOCIAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object BandaPiedeGrupo: TQRBand [3]
    Left = 38
    Top = 283
    Width = 740
    Height = 41
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
      108.479166666666700000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRSImporte: TQRExpr
      Left = 287
      Top = 5
      Width = 151
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        759.354166666667000000
        13.229166666666700000
        399.520833333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE)'
      Mask = '#,###,##0.00'
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 226
      Top = 5
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        597.958333333333000000
        13.229166666666700000
        153.458333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Subtotal:'
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
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT A.COD_ENTIDAD as ENTIDAD,'
      '               B.DESCRIPCION as RAZONSOCIAL,'
      '               NVL(A.IMPORTE_COBRADO,0) as IMPORTE,'
      '               A.CBU_TARJETA,'
      '               A.CLIENTE,'
      '               A.FH_VENCIMIENTO,'
      '               A.FH_DEVOLUCION      '
      'FROM GEMA.CONTRACARGOS_00017 A,'
      '           GIRE.ENTIDADES B'
      'WHERE A.COD_ENTIDAD = B.COD_ENTIDAD and'
      
        '                A.FH_PROCESO <= :pFh_Proceso and A.ID_TIPO_DEBIT' +
        'O = '#39'D'#39' '
      'ORDER BY ENTIDAD'
      '')
    Left = 158
    Top = 52
    object QryBaseENTIDAD: TIntegerField
      FieldName = 'ENTIDAD'
    end
    object QryBaseRAZONSOCIAL: TStringField
      FieldName = 'RAZONSOCIAL'
      Size = 40
    end
    object QryBaseIMPORTE: TBCDField
      FieldName = 'IMPORTE'
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object QryBaseCBU_TARJETA: TStringField
      FieldName = 'CBU_TARJETA'
      Size = 23
    end
    object QryBaseCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object QryBaseFH_VENCIMIENTO: TDateTimeField
      FieldName = 'FH_VENCIMIENTO'
    end
    object QryBaseFH_DEVOLUCION: TDateTimeField
      FieldName = 'FH_DEVOLUCION'
    end
  end
  inherited QryTotales: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pFh_Proceso'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select * from('
      'Select Count(8) as CANTIDAD,'
      
        '       Decode(SUM(NVL(IMPORTE_COBRADO,0)),null,0,SUM(NVL(IMPORTE' +
        '_COBRADO,0))) as IMPORTE      '#9'   '
      'FROM GEMA.CONTRACARGOS_00017'
      'WHERE FH_PROCESO <= :pFh_Proceso and ID_TIPO_DEBITO = '#39'D'#39')'
      'where cantidad > 0')
    Left = 214
    Top = 54
  end
end
