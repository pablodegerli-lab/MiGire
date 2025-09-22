object FrmProgresoConversion: TFrmProgresoConversion
  Left = 224
  Top = 258
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Progreso de la Conversión Inicial'
  ClientHeight = 82
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 41
    Align = alTop
    TabOrder = 0
    object LConvirtiendoTabla: TLabel
      Left = 11
      Top = 16
      Width = 73
      Height = 15
      Caption = 'Convirtiendo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 370
    Height = 41
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 368
      Height = 39
      Align = alClient
      Caption = 'Progreso de la Conversión'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object ProgressBar1: TProgressBar
        Left = 2
        Top = 16
        Width = 364
        Height = 21
        Align = alClient
        Min = 0
        Max = 100
        Smooth = True
        TabOrder = 0
      end
    end
  end
end
