inherited FrmGireAbmOnLineConsulta: TFrmGireAbmOnLineConsulta
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Registros'
  ClientHeight = 252
  ClientWidth = 368
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 368
    Height = 188
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 366
      Height = 186
      Align = alClient
      TabOrder = 0
      object Label1: TLabel
        Left = 39
        Top = 17
        Width = 290
        Height = 16
        Caption = 'Indique a continuaci�n la clave de b�squeda:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 188
    Width = 368
    Height = 64
    Align = alBottom
    TabOrder = 1
    object StatusBar1: TStatusBar
      Left = 1
      Top = 44
      Width = 366
      Height = 19
      Panels = <>
      SimplePanel = False
    end
    object BtnAceptar: TBitBtn
      Left = 56
      Top = 12
      Width = 83
      Height = 25
      Caption = '&Buscar'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = BtnAceptarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BtnNoBuscar: TBitBtn
      Left = 240
      Top = 12
      Width = 83
      Height = 25
      Caption = '&No buscar'
      TabOrder = 2
      OnClick = BtnNoBuscarClick
      Kind = bkCancel
    end
  end
  inherited ActionList1: TActionList
    Left = 288
    Top = 152
  end
  object DSConsulta: TDataSource
    Left = 321
    Top = 153
  end
end
