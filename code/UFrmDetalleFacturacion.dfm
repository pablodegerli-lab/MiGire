inherited FrmDetalleFacturacion: TFrmDetalleFacturacion
  Left = 594
  Top = 137
  Caption = 'Detalle de Facturaci'#243'n a Empresa'
  ClientHeight = 283
  ClientWidth = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 245
    Width = 496
    inherited Panel3: TPanel
      Left = 310
      inherited BtnAceptar: TBitBtn
        Default = False
        ModalResult = 0
        Kind = bkCustom
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 496
    Height = 245
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 494
      Height = 56
      Align = alTop
      Caption = 'Panel4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 25
        Width = 63
        Height = 16
        Caption = 'Empresa: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLCias: TDBLookupComboBox
        Left = 69
        Top = 18
        Width = 281
        Height = 24
        KeyField = 'RAZONSOCIAL'
        ListField = 'RAZONSOCIAL'
        ListSource = DSCias
        TabOrder = 0
      end
    end
    object TPanel
      Left = 1
      Top = 191
      Width = 494
      Height = 53
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 44
        Top = 21
        Width = 86
        Height = 16
        Caption = 'Fecha Desde:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 257
        Top = 21
        Width = 82
        Height = 16
        Caption = 'Fecha Hasta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edFechaDesde: TDateEdit
        Left = 133
        Top = 14
        Width = 103
        Height = 21
        CheckOnExit = True
        DefaultToday = True
        DialogTitle = 'Elija una Fecha'
        NumGlyphs = 2
        StartOfWeek = Sun
        Weekends = [Sun, Sat]
        TabOrder = 0
      end
      object edFechaHasta: TDateEdit
        Left = 342
        Top = 14
        Width = 103
        Height = 21
        DefaultToday = True
        DialogTitle = 'Elija una Fecha'
        NumGlyphs = 2
        StartOfWeek = Sun
        Weekends = [Sun, Sat]
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 57
      Width = 494
      Height = 134
      Align = alClient
      Caption = 'Servicios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object CHLBServicios: TCheckListBox
        Left = 2
        Top = 18
        Width = 490
        Height = 114
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 128
    Top = 96
  end
  object DSCias: TDataSource
    DataSet = DMDetalleFacturacion.QryCiasGema
    OnDataChange = DSCiasDataChange
    Left = 24
    Top = 96
  end
  object DSServiciosXCia: TDataSource
    DataSet = DMDetalleFacturacion.QryServiciosXCia
    Left = 56
    Top = 96
  end
  object DsDetalle: TDataSource
    DataSet = DMDetalleFacturacion.QryDetalle
    Left = 89
    Top = 97
  end
end
