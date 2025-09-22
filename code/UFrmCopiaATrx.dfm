inherited FrmCopiaATrx: TFrmCopiaATrx
  Left = 32
  Top = 58
  Width = 747
  Height = 441
  BorderStyle = bsSizeable
  Caption = 'Copia a Transmisión'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 376
    Width = 739
    inherited Panel3: TPanel
      Left = 553
      inherited BtnAceptar: TBitBtn
        Caption = '&Copiar'
        Default = False
        ModalResult = 0
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
    Width = 739
    Height = 376
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 737
      Height = 195
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 62
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
      object Label2: TLabel
        Left = 14
        Top = 90
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
        Left = 78
        Top = 91
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
        Left = 115
        Top = 91
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
      object LRazonSocial: TLabel
        Left = 115
        Top = 63
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
      object LCia: TLabel
        Left = 78
        Top = 63
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
      object Label3: TLabel
        Left = 14
        Top = 117
        Width = 146
        Height = 16
        Caption = 'Fecha de Distribución: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFh_Distribucion: TLabel
        Left = 163
        Top = 117
        Width = 98
        Height = 16
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
        Top = 117
        Width = 89
        Height = 16
        Caption = 'Nº de Corrida:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lNro_Corrida: TLabel
        Left = 417
        Top = 117
        Width = 76
        Height = 16
        Caption = 'Nro_Corrida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 13
        Top = 168
        Width = 84
        Height = 16
        Caption = 'Ruta Destino:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LRutaDestino: TLabel
        Left = 102
        Top = 168
        Width = 80
        Height = 16
        Caption = 'Ruta Destino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 14
        Top = 143
        Width = 80
        Height = 16
        Caption = 'Ruta Origen:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LRutaOrigen: TLabel
        Left = 102
        Top = 143
        Width = 76
        Height = 16
        Caption = 'Ruta Origen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 264
        Top = 19
        Width = 211
        Height = 24
        Caption = 'Copia a Transmisión'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentFont = False
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 196
      Width = 737
      Height = 179
      Align = alClient
      TabOrder = 1
      object GrillaArchivos: TRxDBGrid
        Left = 1
        Top = 1
        Width = 735
        Height = 177
        Align = alClient
        Color = clBtnFace
        DataSource = DSGrillaArchivos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = GrillaArchivosDrawColumnCell
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 680
    Top = 272
  end
  object DSGrillaArchivos: TDataSource
    DataSet = DMCopiaATrx.QryArchivos
    OnDataChange = DSGrillaArchivosDataChange
    Left = 593
    Top = 270
  end
end
