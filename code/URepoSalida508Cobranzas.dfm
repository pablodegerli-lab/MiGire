inherited RepoSalida508Cobranzas: TRepoSalida508Cobranzas
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
    Top = 242
    Size.Values = (
      63.500000000000000000
      1957.916666666667000000)
    object TARJ_GLOB: TQRDBText
      Left = 1
      Top = 4
      Width = 75
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2.645833333333330000
        10.583333333333300000
        198.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'TARJETA_GLOBAL'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object IMPORTE: TQRDBText
      Left = 90
      Top = 4
      Width = 59
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        238.125000000000000000
        10.583333333333300000
        156.104166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'IMPORTE_COBRADO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object FH_VENTA: TQRDBText
      Left = 160
      Top = 4
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        423.333333333333000000
        10.583333333333300000
        179.916666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_OPERACION'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object FH_PRESENT: TQRDBText
      Left = 240
      Top = 4
      Width = 86
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        635.000000000000000000
        10.583333333333300000
        227.541666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_PRESENTACION'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object COD_TARJE: TQRDBText
      Left = 340
      Top = 4
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        899.583333333333000000
        10.583333333333300000
        201.083333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_ENTIDAD'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object NRO_TARJE: TQRDBText
      Left = 420
      Top = 4
      Width = 91
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1111.250000000000000000
        10.583333333333300000
        240.770833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CBU_TARJETA'
      OnPrint = NRO_TARJEPrint
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object NRO_OPERAC: TQRDBText
      Left = 545
      Top = 4
      Width = 113
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1441.979166666670000000
        10.583333333333300000
        298.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'NRO_OPERACION'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object C_ACCION: TQRDBText
      Left = 662
      Top = 4
      Width = 66
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1751.541666666670000000
        10.583333333333300000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'COD_ACCION'
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
      Size.Values = (
        50.270833333333330000
        857.250000000000000000
        317.500000000000000000
        240.770833333333300000)
      FontSize = 11
    end
    inherited QRLTitulo2: TQRLabel
      Left = 369
      Width = 1
      Size.Values = (
        44.979166666666670000
        976.312500000000000000
        370.416666666666700000
        2.645833333333333000)
      Caption = ''
      FontSize = 10
    end
  end
  object QRBand1: TQRBand [2]
    Left = 38
    Top = 202
    Width = 740
    Height = 40
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
      105.833333333333300000
      1957.916666666667000000)
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 1
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
        2.645833333333333000
        21.166666666666670000
        198.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TARJ_GLOB'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 90
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
        238.125000000000000000
        21.166666666666670000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'IMPORTE'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 160
      Top = 8
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        423.333333333333300000
        21.166666666666670000
        179.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FH_VENTA'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 240
      Top = 8
      Width = 86
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        635.000000000000000000
        21.166666666666670000
        227.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FH_PRESENT'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 340
      Top = 8
      Width = 76
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
        201.083333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'COD_TARJE'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 420
      Top = 8
      Width = 76
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1111.250000000000000000
        21.166666666666700000
        201.083333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'NRO_TARJE'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 545
      Top = 8
      Width = 91
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1441.979166666670000000
        21.166666666666700000
        240.770833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'NRO_OPERAC'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 662
      Top = 8
      Width = 66
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1751.541666666670000000
        21.166666666666700000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C_ACCION'
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
      end>
    SQL.Strings = (
      'Select TARJETA_GLOBAL,'
      '           IMPORTE_COBRADO,'
      '           FH_OPERACION,'
      '           FH_PRESENTACION,'
      '           COD_ENTIDAD,'
      '           CBU_TARJETA,'
      '           NRO_OPERACION,'
      '           COD_ACCION'
      'From GEMA.COBRANZAS_00508'
      'Where FH_PROCESO <= :pFh_Proceso and'
      '             TIPO_COBRANZA = '#39'V'#39)
    Left = 134
    object QryBaseTARJETA_GLOBAL: TIntegerField
      FieldName = 'TARJETA_GLOBAL'
    end
    object QryBaseIMPORTE_COBRADO: TBCDField
      FieldName = 'IMPORTE_COBRADO'
      Precision = 11
      Size = 2
    end
    object QryBaseFH_OPERACION: TDateTimeField
      FieldName = 'FH_OPERACION'
    end
    object QryBaseFH_PRESENTACION: TDateTimeField
      FieldName = 'FH_PRESENTACION'
    end
    object QryBaseCOD_ENTIDAD: TIntegerField
      FieldName = 'COD_ENTIDAD'
    end
    object QryBaseCBU_TARJETA: TStringField
      FieldName = 'CBU_TARJETA'
      Size = 23
    end
    object QryBaseNRO_OPERACION: TBCDField
      FieldName = 'NRO_OPERACION'
      Precision = 10
      Size = 0
    end
    object QryBaseCOD_ACCION: TStringField
      FieldName = 'COD_ACCION'
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
      end>
    SQL.Strings = (
      'Select * from('
      'Select Count(8) as CANTIDAD,'
      
        '       Decode(SUM(NVL(IMPORTE_COBRADO,0)),null,0,SUM(NVL(IMPORTE' +
        '_COBRADO,0))) as IMPORTE      '#9'   '
      'FROM GEMA.COBRANZAS_00508'
      'WHERE FH_PROCESO <= :pFh_Proceso and TIPO_COBRANZA = '#39'V'#39')'
      'where cantidad > 0')
  end
end
