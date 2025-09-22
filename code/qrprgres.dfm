object QRProgressForm: TQRProgressForm
  Left = 504
  Top = 262
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Progreso de Impresi'#243'n'
  ClientHeight = 69
  ClientWidth = 149
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Info: TLabel
    Left = 0
    Top = 44
    Width = 145
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object CancelButton: TButton
    Left = 36
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Enabled = False
    TabOrder = 0
    Visible = False
    OnClick = CancelButtonClick
  end
  object Gauge: TProgressBar
    Left = 16
    Top = 18
    Width = 114
    Height = 16
    TabOrder = 1
  end
end
