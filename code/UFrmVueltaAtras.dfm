inherited FrmVueltaAtras: TFrmVueltaAtras
  Left = 326
  Top = 172
  Caption = 'Vuelta Atr'#225's'
  ClientHeight = 420
  ClientWidth = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 382
    Width = 537
    inherited Panel3: TPanel
      Left = 351
      inherited BtnAceptar: TBitBtn
        Left = 0
        Width = 95
        Caption = '&Volver Atr'#225's'
        Default = False
        Kind = bkCustom
      end
      inherited BtnCancelar: TBitBtn
        Caption = '&Salir'
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 537
    Height = 153
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 70
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
    object LCia: TLabel
      Left = 83
      Top = 71
      Width = 29
      Height = 16
      Alignment = taRightJustify
      Caption = 'LCia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LRazonSocial: TLabel
      Left = 118
      Top = 71
      Width = 88
      Height = 16
      Caption = 'LRazonSocial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 98
      Width = 59
      Height = 16
      Caption = 'Proceso: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LProc: TLabel
      Left = 82
      Top = 99
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'LPro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LDescProceso: TLabel
      Left = 118
      Top = 99
      Width = 82
      Height = 16
      Caption = 'LDescripcion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 18
      Top = 125
      Width = 146
      Height = 16
      Caption = 'Fecha de Distribuci'#243'n: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LFh_Distribucion: TLabel
      Left = 168
      Top = 125
      Width = 103
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fh_Distribucion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 321
      Top = 125
      Width = 89
      Height = 16
      Caption = 'N'#186' de Corrida:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lNro_Corrida: TLabel
      Left = 417
      Top = 125
      Width = 25
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nro_Corrida'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 211
      Top = 19
      Width = 124
      Height = 24
      Caption = 'Vuelta Atr'#225's'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
    end
    object ImageCheck: TImage
      Left = 408
      Top = 16
      Width = 17
      Height = 17
      Picture.Data = {
        07544269746D61703E020000424D3E0200000000000036000000280000000D00
        00000D000000010018000000000008020000C40E0000C40E0000000000000000
        00003838384D4D4D4B4B4B4B4B4B4B4B4B4B4B4B4949494A4A4A4B4B4B4B4B4B
        4B4B4B505050252525008E8E8ED3D3D3CDCDCDCDCDCDCDCDCDCBCBCBDFE8E8D6
        DCDCCBCBCBCDCDCDCDCDCDDADADA50505000858585C6C6C6C0C0C0C0C0C0BFBF
        BFC6D5D5B35F5FC79696BFC5C5BFBFBFC0C0C0CDCDCD4B4B4B00858585CECECE
        C6C6C6C5C5C5C9D5D5CBA2A26F0000921414E6F4F4BCBDBDC0C0C0CDCDCD4B4B
        4B008D8D8D7070707E7E7E858B8B9867676F00009E4A4A551818BC6666C4D1D1
        BFBFBFCDCDCD4B4B4B008E8E8E656565FFFFFFDAE3E3913E3EA64343FFFFFF5D
        6262730000D9C0C0BDC3C3CDCDCD4B4B4B008E8E8E666666FFFFFFD7D7D7DFE5
        E5E1E7E7F1F1F1757777B7C0C0821212D8D4D4CBCECE4B4B4B008E8E8E666666
        FFFFFFD6D6D6DBDBDBE7E7E7FFFFFF707070CCCECEACAFAF8C2E2ED7CECE4A4C
        4C008E8E8E666666FFFFFFD9D9D9D7D7D73838385353537D7D7DC7C7C7C2C4C4
        BFC7C7BA95954C4F4F008E8E8E666666FFFFFFD5D5D5BABABA9B9B9B838383CD
        CDCDC0C0C0C0C0C0C0C0C0CED1D14B4B4B009191916E6E6E8383838D8D8D7878
        78494949CFCFCFC2C2C2C2C2C2C2C2C2C2C2C2CFCFCF4B4B4B00757575D3D3D3
        C9C9C9C8C8C8CBCBCBCECECEC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3CECECE5252
        5200000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
      Visible = False
    end
    object Label6: TLabel
      Left = 213
      Top = 100
      Width = 8
      Height = 16
      Caption = '- '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object ComboBoxEx1: TComboBoxEx
      Left = 228
      Top = 97
      Width = 145
      Height = 22
      ItemsEx = <>
      ItemHeight = 16
      TabOrder = 0
      Text = 'ComboBoxEx1'
      Visible = False
      DropDownCount = 8
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 153
    Width = 537
    Height = 229
    Align = alClient
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 535
      Height = 227
      Align = alClient
      Caption = 'Se realizar'#225' la vuelta atr'#225's de los siguientes servicios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object LBServicios: TListBox
        Left = 2
        Top = 18
        Width = 531
        Height = 207
        Style = lbOwnerDrawFixed
        Align = alClient
        ItemHeight = 20
        TabOrder = 0
        OnDrawItem = LBServiciosDrawItem
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 504
    Top = 16
  end
end
