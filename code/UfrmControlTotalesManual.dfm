inherited FrmCtrlTotalesManual: TFrmCtrlTotalesManual
  Left = 75
  Top = 77
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Control de Totales'
  ClientHeight = 433
  ClientWidth = 669
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 395
    Width = 669
    inherited Panel3: TPanel
      Left = 483
      inherited BtnAceptar: TBitBtn
        Left = 3
        Width = 91
        Caption = '&Recalcular'
        Default = False
        Kind = bkCustom
      end
    end
    object BtnMostrarTotales: TBitBtn
      Left = 8
      Top = 6
      Width = 107
      Height = 28
      Action = MostrarTotales
      Caption = '&Mostrar Totales'
      TabOrder = 1
      Kind = bkRetry
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 669
    Height = 147
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 106
      Top = 16
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
      Left = 110
      Top = 47
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
    object LCia: TLabel
      Left = 175
      Top = 17
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
      Left = 213
      Top = 17
      Width = 448
      Height = 28
      AutoSize = False
      Caption = 'LRazonSocial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LProc: TLabel
      Left = 175
      Top = 48
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
    object LDescProceso: TLabel
      Left = 213
      Top = 48
      Width = 449
      Height = 36
      AutoSize = False
      Caption = 'LRazonSocial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label3: TLabel
      Left = 8
      Top = 85
      Width = 162
      Height = 16
      Caption = 'Fecha de Proceso (tope): '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LFh_Proceso: TLabel
      Left = 175
      Top = 86
      Width = 74
      Height = 16
      Caption = 'Fh_Proceso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lLeyenda: TLabel
      Left = 157
      Top = 116
      Width = 339
      Height = 16
      Alignment = taCenter
      Caption = '  INGRESE LOS TOTALES DE CANTIDAD E IMPORTE  '
      Color = clScrollBar
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 147
    Width = 669
    Height = 248
    Align = alClient
    TabOrder = 2
    object GrillaTotales: TRxDBGrid
      Left = 1
      Top = 1
      Width = 667
      Height = 246
      Align = alClient
      Color = clBtnFace
      DataSource = DSGrillaTotales
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = GrillaTotalesDrawColumnCell
      Columns = <
        item
          Color = 45059846
          Expanded = False
          FieldName = 'DESCRIPCION'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Descripcion'
          Visible = True
        end
        item
          Color = 45059846
          Expanded = False
          FieldName = 'FH_PROCESO'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Fecha de Proceso'
          Width = 64
          Visible = True
        end
        item
          Color = 45059846
          Expanded = False
          FieldName = 'CANTIDAD'
          Title.Alignment = taCenter
          Title.Caption = 'Cantidad'
          Width = 64
          Visible = True
        end
        item
          Color = 45059846
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Width = 64
          Visible = True
        end
        item
          Color = 45068038
          Expanded = False
          FieldName = 'CANTIDAD_CTRL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Color = 45068038
          Expanded = False
          FieldName = 'IMPORTE_CTRL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ReadOnly = True
          Title.Alignment = taCenter
          Visible = False
        end>
    end
  end
  inherited ActionList1: TActionList
    Left = 520
    Top = 320
    object MostrarTotales: TAction
      Caption = '&Mostrar Totales'
      OnExecute = MostrarTotalesExecute
    end
  end
  object DSGrillaTotales: TDataSource
    DataSet = DMControlTotalManual.MDTotalesControl
    OnStateChange = DSGrillaTotalesStateChange
    OnDataChange = DSGrillaTotalesDataChange
    Left = 560
    Top = 320
  end
  object ADOCtrlMenu1: TADOCtrlMenu
    ActionList = ActionList1
    Referencia = 'TOTALES'
    Conexion = GemaConexion.ADOConec
    CodigoProceso = 100
    Left = 600
    Top = 320
  end
end
