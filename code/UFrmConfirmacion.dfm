inherited FrmConfirmacion: TFrmConfirmacion
  Left = 168
  Top = 217
  Caption = 'Confirmaci'#243'n de la Generaci'#243'n y Emisi'#243'n de Archivos'
  ClientWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 232
    Top = 104
    Width = 68
    Height = 13
    Caption = 'fh_distribucion'
  end
  object Label6: TLabel [1]
    Left = 232
    Top = 80
    Width = 39
    Height = 13
    Caption = 'Proceso'
  end
  object Label7: TLabel [2]
    Left = 232
    Top = 56
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  inherited Panel1: TPanel
    Width = 536
    inherited Panel3: TPanel
      Left = 350
      inherited BtnAceptar: TBitBtn
        Width = 81
        Caption = '&Confirmar'
        Default = False
        Kind = bkCustom
      end
      inherited BtnCancelar: TBitBtn
        Caption = '&Salir'
      end
    end
  end
  object Panel2: TPanel [4]
    Left = 0
    Top = 0
    Width = 536
    Height = 164
    Align = alClient
    TabOrder = 1
    object Image1: TImage
      Left = 18
      Top = 64
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010002002020100000000000E80200002600000010101000
        00000000280100000E0300002800000020000000400000000100040000000000
        8002000000000000000000000000000000000000000000000000800000800000
        0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
        00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000000000000
        00000000000000000000BBBBBBBB000000000000000000000BBBBBB00BBBBBB0
        000000000000000BBBBBB000000BBBBBB0000000000000BBBBBBB000000BBBBB
        BB00000000000BBBBBBB00000000BBBBBBB000000000BBBBBBBB00000000BBBB
        BBBB0000000BBBBBBBBBB000000BBBBBBBBBB000000BBBBBBBBBB000000BBBBB
        BBBBB00000BBBBBBBBBBBBB00BBBBBBBBBBBBB0000BBBBBBBBBBBBBBBBBBBBBB
        BBBBBB0000BBBBBBBBBB00000000BBBBBBBBBB000BBBBBBBBBBB00000000BBBB
        BBBBBBB00BBBBBBBBBBB00000000BBBBBBBBBBB00BBBBBBBBBBB00000000BBBB
        BBBBBBB00BBBBBBBBBBB00000000BBBBBBBBBBB00BBBBBBBBBBB00000000BBBB
        BBBBBBB00BBBBBBBBBBB00000000BBBBBBBBBBB00BBBBBBBBBBB00000000BBBB
        BBBBBBB00BBBBBBBBBBB00000000BBBBBBBBBBB000BBBBBBBBBB00000000BBBB
        BBBBBB0000BBBBBBBBBB00000000BBBBBBBBBB0000BBBBBBBBBB00000000BBBB
        BBBBBB00000BBBBBBBBB00000000BBBBBBBBB000000BBBBBBBBB00000000BBBB
        BBBBB0000000BBBBBBBB00000000BBBBBBBB000000000BBBBBBB00000000BBBB
        BBB00000000000BBBBBB00000000BBBBBB0000000000000BBBBB00000000BBBB
        B0000000000000000BBBBBBBBBBBBBB000000000000000000000BBBBBBBB0000
        0000000000000000000000000000000000000000FFF00FFFFF8001FFFE00007F
        FC00003FF800001FF000000FE0000007C0000003C00000038000000180000001
        8000000100000000000000000000000000000000000000000000000000000000
        00000000800000018000000180000001C0000003C0000003E0000007F000000F
        F800001FFC00003FFE00007FFF8001FFFFF00FFF280000001000000020000000
        0100040000000000C00000000000000000000000000000000000000000000000
        00008000008000000080800080000000800080008080000080808000C0C0C000
        0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000
        0000000000000BBBBBB00000000BBBB00BBBB00000BBBB0000BBBB0000BBBB00
        00BBBB000BBBBBB00BBBBBB00BBBBBBBBBBBBBB00BBBBB0000BBBBB00BBBBB00
        00BBBBB00BBBBB0000BBBBB00BBBBB0000BBBBB000BBBB0000BBBB0000BBBB00
        00BBBB00000BBB0000BBB00000000BBBBBB000000000000000000000F81F0000
        E0070000C0030000800100008001000000010000000000000000000000000000
        00000000000000008001000080010000C0030000E0070000F81F0000}
      Stretch = True
    end
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 507
      Height = 16
      Caption = 
        #161' ATENCION !  -  Ud. est'#225' por efectuar la Generaci'#243'n y Emisi'#243'n d' +
        'e Archivos para:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 184
      Top = 55
      Width = 55
      Height = 16
      Caption = 'Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 184
      Top = 80
      Width = 345
      Height = 36
      AutoSize = False
      Caption = 'Proceso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
      Left = 117
      Top = 56
      Width = 59
      Height = 16
      Caption = 'Empresa:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 121
      Top = 81
      Width = 55
      Height = 16
      Caption = 'Proceso:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 18
      Top = 126
      Width = 158
      Height = 16
      Caption = 'Fecha de Proceso (tope):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DEFh_Proceso: TDateEdit
      Left = 184
      Top = 123
      Width = 123
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      StartOfWeek = Sun
      TabOrder = 0
    end
  end
  inherited ActionList1: TActionList
    Left = 496
    Top = 112
  end
end
