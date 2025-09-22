inherited FrmDlgBusqueda: TFrmDlgBusqueda
  Left = 336
  Top = 169
  Caption = 'Busqueda avanzada'
  ClientHeight = 452
  ClientWidth = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 414
    Width = 358
    inherited Panel3: TPanel
      Left = 172
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 358
    Height = 414
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 77
      Height = 16
      Caption = 'Buscar Por'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 128
      Width = 34
      Height = 16
      Caption = 'Dato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 1
      Top = 168
      Width = 356
      Height = 245
      Align = alBottom
      TabOrder = 3
      object DBGrid1: TDBGrid
        Left = 1
        Top = 49
        Width = 354
        Height = 195
        Align = alClient
        DataSource = dsDato
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 354
        Height = 48
        Align = alTop
        Caption = 'Dato a devolver'
        TabOrder = 1
        object DBEdit1: TDBEdit
          Left = 8
          Top = 16
          Width = 337
          Height = 21
          DataSource = dsDato
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object EDato: TEdit
      Left = 48
      Top = 128
      Width = 289
      Height = 21
      TabOrder = 2
      OnChange = EDatoChange
    end
    object CBCampos: TComboBox
      Left = 88
      Top = 24
      Width = 249
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnClick = CBCamposClick
    end
    object RGEleccion: TRadioGroup
      Left = 24
      Top = 56
      Width = 313
      Height = 57
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Igual a '
        'Empieza con '
        'Contiene a')
      TabOrder = 1
      OnClick = RGEleccionClick
    end
  end
  inherited ActionList1: TActionList
    Left = 320
    Top = 72
  end
  object dsDato: TDataSource
    Left = 113
    Top = 224
  end
end
