inherited RepoSalida008AltasBajas: TRepoSalida008AltasBajas
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
    Top = 231
    Size.Values = (
      63.500000000000000000
      1957.916666666667000000)
    object QRDBText3: TQRDBText
      Left = 5
      Top = 4
      Width = 47
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        13.229166666666670000
        10.583333333333330000
        124.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'BANCO'
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
      Left = 76
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
        201.083333333333300000
        10.583333333333330000
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
    object QRDBText5: TQRDBText
      Left = 300
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
        793.750000000000000000
        10.583333333333330000
        240.770833333333300000)
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
    object QRDBText6: TQRDBText
      Left = 473
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
        1251.479166666670000000
        10.583333333333300000
        298.979166666667000000)
      Alignment = taRightJustify
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
    object QRDBText1: TQRDBText
      Left = 251
      Top = 4
      Width = 30
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        664.104166666666800000
        10.583333333333330000
        79.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TIPO'
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
      Left = 607
      Top = 4
      Width = 126
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1606.020833333330000000
        10.583333333333300000
        333.375000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_PRESENTACION'
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
      Left = 260
      Top = 116
      Width = 280
      Size.Values = (
        50.270833333333330000
        687.916666666666800000
        306.916666666666700000
        740.833333333333400000)
      Alignment = taCenter
      Text = 'Altas y Bajas de Debito A/D'
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
  object ChildBand1: TQRChildBand [2]
    Left = 38
    Top = 202
    Width = 740
    Height = 29
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
      76.729166666666680000
      1957.916666666667000000)
    ParentBand = BandaEncabezado
    object QRLabel3: TQRLabel
      Left = 5
      Top = 6
      Width = 41
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        15.875000000000000000
        108.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Banco'
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
      Left = 300
      Top = 6
      Width = 80
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        793.750000000000000000
        15.875000000000000000
        211.666666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CBU_Tarjeta'
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
      Left = 473
      Top = 6
      Width = 124
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1251.479166666670000000
        15.875000000000000000
        328.083333333333000000)
      Alignment = taRightJustify
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
      Left = 607
      Top = 6
      Width = 127
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1606.020833333330000000
        15.875000000000000000
        336.020833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Presentacion'
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
    object QRLabel1: TQRLabel
      Left = 76
      Top = 6
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        201.083333333333300000
        15.875000000000000000
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
    object QRLabel7: TQRLabel
      Left = 251
      Top = 6
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        664.104166666666800000
        15.875000000000000000
        76.729166666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo'
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
      end
      item
        Name = 'pId_TipoDeb'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT A.COD_ENTIDAD_SEGUN_CIA as BANCO,'
      '               B.DESCRIPCION as RAZONSOCIAL,'
      '               A.CLIENTE,'
      '               Decode(A.COD_TRX,7,'#39'A'#39','#39'B'#39') as TIPO,'
      '               A.CBU_TARJETA,'
      '               A.FH_VENCIMIENTO,'
      '               A.FH_PRESENTACION,'
      '               A.FH_PROCESO,'
      '               A.ID_TIPO_DEBITO'
      'FROM @01 A,'
      '           GIRE.ENTIDADES B'
      'WHERE A.COD_ENTIDAD_SEGUN_CIA = B.COD_ENTIDAD and'
      '                A.FH_PROCESO <= :pFh_Proceso  and '
      '                 A.ID_TIPO_DEBITO = :pId_TipoDeb and'
      
        '                  (Trim(A.COD_TRX) = '#39'7'#39' or Trim(A.COD_TRX) = '#39'8' +
        #39')'
      'ORDER BY A.COD_ENTIDAD_SEGUN_CIA')
    object QryBaseBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object QryBaseRAZONSOCIAL: TStringField
      FieldName = 'RAZONSOCIAL'
      Size = 40
    end
    object QryBaseCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object QryBaseTIPO: TStringField
      FieldName = 'TIPO'
      ReadOnly = True
      Size = 1
    end
    object QryBaseCBU_TARJETA: TStringField
      FieldName = 'CBU_TARJETA'
      Size = 23
    end
    object QryBaseFH_VENCIMIENTO: TDateTimeField
      FieldName = 'FH_VENCIMIENTO'
    end
    object QryBaseFH_PRESENTACION: TDateTimeField
      FieldName = 'FH_PRESENTACION'
    end
    object QryBaseFH_PROCESO: TDateTimeField
      FieldName = 'FH_PROCESO'
    end
    object QryBaseID_TIPO_DEBITO: TStringField
      FieldName = 'ID_TIPO_DEBITO'
      FixedChar = True
      Size = 1
    end
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
        Name = 'pId_TipoDeb'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select * from('
      'SELECT Count(8) as CANTIDAD,'
      '               0 as IMPORTE   '
      'FROM @01'
      'WHERE FH_PROCESO <= :pFh_Proceso  and '
      '                 ID_TIPO_DEBITO = :pId_TipoDeb and'
      '                  (Trim(COD_TRX) = '#39'7'#39' or Trim(COD_TRX) = '#39'8'#39'))'
      'where CANTIDAD > 0')
  end
end
