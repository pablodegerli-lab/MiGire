inherited RepoSalida056Contracargos: TRepoSalida056Contracargos
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
    Height = 34
    Size.Values = (
      89.958333333333340000
      1957.916666666667000000)
    object TARJ_GLOB: TQRDBText
      Left = 1
      Top = 4
      Width = 47
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
        124.354166666667000000)
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
    object IMPORTE: TQRDBText
      Left = 60
      Top = 4
      Width = 85
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        158.750000000000000000
        10.583333333333300000
        224.895833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CLIENTE'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object FH_VENTA: TQRDBText
      Left = 150
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
        396.875000000000000000
        10.583333333333300000
        179.916666666667000000)
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
    object FH_PRESENT: TQRDBText
      Left = 225
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
        595.312500000000000000
        10.583333333333300000
        227.541666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_CONTRACARGO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object COD_TARJE: TQRDBText
      Left = 320
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
        846.666666666667000000
        10.583333333333300000
        201.083333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'FH_VENCIMIENTO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object NRO_TARJE: TQRDBText
      Left = 410
      Top = 4
      Width = 181
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1084.791666666670000000
        10.583333333333300000
        478.895833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'CBU_TARJETA'
      Mask = '"AAAAAAAAAAAAAAAAAAAAAAA"'
      OnPrint = NRO_TARJEPrint
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object NRO_OPERAC: TQRDBText
      Left = 596
      Top = 4
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1576.916666666670000000
        10.583333333333300000
        137.583333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'MONEDA_FACTURACION'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object C_ACCION: TQRDBText
      Left = 651
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
        1722.437500000000000000
        10.583333333333300000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = QryBase
      DataField = 'ID_TIPO_DEBITO'
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
      Width = 264
      Size.Values = (
        50.270833333333330000
        857.250000000000000000
        317.500000000000000000
        698.500000000000000000)
      Text = 'Planilla de Contracargos'
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
      Width = 45
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
    object QRLabel2: TQRLabel
      Left = 60
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
        158.750000000000000000
        21.166666666666670000
        137.583333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Abonado'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 150
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
        396.875000000000000000
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
    object QRLabel4: TQRLabel
      Left = 225
      Top = 8
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        595.312500000000000000
        21.166666666666670000
        230.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F. Contracargo'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 320
      Top = 8
      Width = 85
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
        224.895833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'F.Vencimiento'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 410
      Top = 8
      Width = 40
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1084.791666666670000000
        21.166666666666700000
        105.833333333333000000)
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
    object QRLabel7: TQRLabel
      Left = 596
      Top = 8
      Width = 47
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1576.916666666670000000
        21.166666666666700000
        124.354166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Moneda'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 651
      Top = 8
      Width = 84
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1722.437500000000000000
        21.166666666666700000
        222.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de D'#233'bito'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand2: TQRBand [3]
    Left = 38
    Top = 276
    Width = 740
    Height = 31
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
      82.020833333333340000
      1957.916666666667000000)
    BandType = rbSummary
    object QRLabel9: TQRLabel
      Left = 1
      Top = 8
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        2.645833333333330000
        21.166666666666700000
        76.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRECount: TQRExpr
      Left = 60
      Top = 8
      Width = 85
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        158.750000000000000000
        21.166666666666700000
        224.895833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'COUNT'
      FontSize = 10
    end
    object QRESum: TQRExpr
      Left = 150
      Top = 8
      Width = 67
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        396.875000000000000000
        21.166666666666700000
        177.270833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'SUM(QryBase.IMPORTE_COBRADO)'
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
        Name = 'pIncosistencia'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'From GEMA.CONTRACARGOS_00056'
      'Where FH_PROCESO <= :pFh_Proceso and'
      '             INCONSISTENCIA = :pIncosistencia'
      'Order By COD_ENTIDAD,CLIENTE'
      '')
    object QryBaseCOD_ENTIDAD: TIntegerField
      FieldName = 'COD_ENTIDAD'
    end
    object QryBaseCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 30
    end
    object QryBaseIMPORTE_COBRADO: TBCDField
      FieldName = 'IMPORTE_COBRADO'
      Precision = 11
      Size = 2
    end
    object QryBaseFH_CONTRACARGO: TDateTimeField
      FieldName = 'FH_CONTRACARGO'
    end
    object QryBaseFH_VENCIMIENTO: TDateTimeField
      FieldName = 'FH_VENCIMIENTO'
    end
    object QryBaseCBU_TARJETA: TStringField
      FieldName = 'CBU_TARJETA'
      Size = 23
    end
    object QryBaseMONEDA_FACTURACION: TStringField
      FieldName = 'MONEDA_FACTURACION'
      Size = 3
    end
    object QryBaseID_TIPO_DEBITO: TStringField
      FieldName = 'ID_TIPO_DEBITO'
      FixedChar = True
      Size = 1
    end
    object QryBaseINCONSISTENCIA: TStringField
      FieldName = 'INCONSISTENCIA'
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
        Name = 'pInconsistencia'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select * from('
      'Select Count(8) as CANTIDAD,'
      
        '       Decode(SUM(NVL(IMPORTE_COBRADO,0)),null,0,SUM(NVL(IMPORTE' +
        '_COBRADO,0))) as IMPORTE      '#9'   '
      'FROM GEMA.CONTRACARGOS_00056'
      'WHERE FH_PROCESO <= :pFh_Proceso and '
      '                INCONSISTENCIA = :pInconsistencia)'
      'where cantidad > 0'
      '')
  end
end
