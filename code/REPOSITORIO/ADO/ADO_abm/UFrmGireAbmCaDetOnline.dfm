inherited FrmGIREAbmCabDetOnline: TFrmGIREAbmCabDetOnline
  Left = 120
  Top = 54
  Caption = 'FrmGIREAbmCabDetOnline'
  ClientHeight = 426
  ClientWidth = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 407
    Width = 675
  end
  inherited Panel1: TPanel
    Width = 675
    inherited ToolBarEspecifica: TToolBar
      Width = 645
    end
    inherited ToolBarGeneral: TToolBar
      Left = 645
    end
  end
  inherited ToolNavegar: TToolBar
    Top = 382
    Width = 675
  end
  inherited PanelGeneral: TPanel
    Width = 675
    Height = 353
    object PageDatos: TPageControl
      Left = 1
      Top = 1
      Width = 673
      Height = 351
      ActivePage = PanelGrilla
      Align = alClient
      MultiLine = True
      TabOrder = 0
      OnChange = PageDatosChange
      object PanelDatos: TTabSheet
        Caption = 'Cab - Detalle'
        OnShow = PanelDatosShow
        object Degrade1: TDegrade
          Left = 0
          Top = 89
          Width = 665
          Height = 234
          ColorDesde = clBtnFace
          ColorHasta = clBtnFace
          Align = alClient
        end
        object PanelCabecera: TPanel
          Left = 0
          Top = 0
          Width = 665
          Height = 89
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 0
          Top = 89
          Width = 665
          Height = 234
          Align = alClient
          Caption = 'Panel4'
          TabOrder = 1
          object DBGridDet: TRxDBGrid
            Left = 1
            Top = 34
            Width = 663
            Height = 199
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = DBGridDetDrawColumnCell
            OnKeyPress = DBGridDetKeyPress
          end
          object ToolBarDetalleCab: TToolBar
            Left = 1
            Top = 1
            Width = 663
            Height = 33
            Cursor = crHandPoint
            Hint = 'Barra de Tareas Detalle'
            AutoSize = True
            BorderWidth = 1
            ButtonHeight = 25
            ButtonWidth = 28
            Caption = 'ToolBarDetalle'
            EdgeBorders = [ebTop, ebBottom]
            Flat = True
            Images = Imagenes.Chicas
            TabOrder = 1
            object ToolButton13: TToolButton
              Left = 0
              Top = 0
              Action = XDataSetInsert2
            end
            object ToolButton14: TToolButton
              Left = 28
              Top = 0
              Action = XDataSetEdit2
            end
            object ToolButton15: TToolButton
              Left = 56
              Top = 0
              Action = DataSetPost2
            end
            object ToolButton16: TToolButton
              Left = 84
              Top = 0
              Action = DataSetCancel2
            end
            object ToolButton17: TToolButton
              Left = 112
              Top = 0
              Action = XDataSetDelete2
            end
            object ToolButton18: TToolButton
              Left = 140
              Top = 0
              Action = DataSetRefresh2
            end
            object ToolButton19: TToolButton
              Left = 168
              Top = 0
              Width = 35
              Caption = 'ToolButton19'
              ImageIndex = 27
              Style = tbsDivider
            end
            object ToolButton20: TToolButton
              Left = 203
              Top = 0
              Action = XDataSetFirst2
            end
            object ToolButton21: TToolButton
              Left = 231
              Top = 0
              Action = XDataSetPrior2
            end
            object ToolButton22: TToolButton
              Left = 259
              Top = 0
              Action = XDataSetNext2
            end
            object ToolButton23: TToolButton
              Left = 287
              Top = 0
              Action = XDataSetLast2
            end
          end
        end
      end
      object PanelGrilla: TTabSheet
        Caption = 'Grilla'
        ImageIndex = 1
        OnShow = PanelGrillaShow
        object Splitter1: TSplitter
          Left = 0
          Top = 79
          Width = 665
          Height = 6
          Cursor = crVSplit
          Align = alTop
        end
        object DBGridCab: TRxDBGrid
          Left = 0
          Top = 0
          Width = 665
          Height = 79
          Align = alTop
          DataSource = dsCab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGridCabDrawColumnCell
          OnDblClick = DBGridCabDblClick
          OnKeyPress = DBGridCabKeyPress
        end
        object ToolBarDetalle: TToolBar
          Left = 0
          Top = 85
          Width = 665
          Height = 29
          Cursor = crHandPoint
          Hint = 'Barra de Tareas Detalle'
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = True
          ButtonHeight = 25
          ButtonWidth = 28
          Caption = 'ToolBarDetalle'
          EdgeBorders = [ebTop, ebBottom]
          Flat = True
          Images = Imagenes.Chicas
          TabOrder = 1
          object ToolButton6: TToolButton
            Left = 0
            Top = 0
            Action = XDataSetInsert2
          end
          object ToolButton7: TToolButton
            Left = 28
            Top = 0
            Action = XDataSetEdit2
          end
          object ToolButton8: TToolButton
            Left = 56
            Top = 0
            Action = DataSetPost2
          end
          object ToolButton10: TToolButton
            Left = 84
            Top = 0
            Action = DataSetCancel2
          end
          object ToolButton11: TToolButton
            Left = 112
            Top = 0
            Action = XDataSetDelete2
          end
          object ToolButton12: TToolButton
            Left = 140
            Top = 0
            Action = DataSetRefresh2
          end
          object ToolButton24: TToolButton
            Left = 168
            Top = 0
            Width = 35
            Caption = 'ToolButton24'
            ImageIndex = 6
            Style = tbsDivider
          end
          object ToolButton25: TToolButton
            Left = 203
            Top = 0
            Action = XDataSetFirst2
          end
          object ToolButton26: TToolButton
            Left = 231
            Top = 0
            Action = XDataSetPrior2
          end
          object ToolButton27: TToolButton
            Left = 259
            Top = 0
            Action = XDataSetNext2
          end
          object ToolButton28: TToolButton
            Left = 287
            Top = 0
            Action = XDataSetLast2
          end
        end
        object DBGridDetDet: TRxDBGrid
          Left = 0
          Top = 114
          Width = 665
          Height = 209
          Align = alClient
          DataSource = dsDet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGridDetDetDrawColumnCell
          OnKeyPress = DBGridDetDetKeyPress
        end
      end
    end
  end
  inherited ActionList1: TActionList
    inherited Imprimir: TAction
      OnExecute = ImprimirExecute
    end
    inherited Consultar: TAction
      OnExecute = ConsultarExecute
    end
    object XDataSetDelete2: TXDataSetDelete
      Category = 'XDataSet'
      Caption = '&Eliminar'
      Hint = 'Eliminar'
      ImageIndex = 28
      DataSource = dsDet
    end
    object XDataSetEdit2: TXDataSetEdit
      Category = 'XDataSet'
      Caption = '&Modificar'
      Hint = 'Modificar'
      ImageIndex = 18
      DataSource = dsDet
    end
    object XDataSetInsert2: TXDataSetInsert
      Category = 'XDataSet'
      Caption = '&Agregar'
      Hint = 'Agregar'
      ImageIndex = 81
      DataSource = dsDet
    end
    object DataSetCancel2: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 29
      DataSource = dsDet
    end
    object DataSetPost2: TDataSetPost
      Category = 'Dataset'
      Caption = '&Aceptar'
      Hint = 'Aceptar'
      ImageIndex = 27
      DataSource = dsDet
    end
    object DataSetRefresh2: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Refrescar Datos'
      Hint = 'Refrescar Datos'
      ImageIndex = 26
      OnExecute = DataSetRefreshExecute
      DataSource = dsDet
    end
    object XDataSetPrior2: TXDataSetPrior
      Category = 'XDataSet'
      Caption = 'A&Nterior'
      Hint = 'Anterior'
      ImageIndex = 3
      DataSource = dsDet
    end
    object XDataSetNext2: TXDataSetNext
      Category = 'XDataSet'
      Caption = '&Próximo'
      Hint = 'Próximo'
      ImageIndex = 6
      DataSource = dsDet
    end
    object XDataSetLast2: TXDataSetLast
      Category = 'XDataSet'
      Caption = '&Último'
      Hint = 'Último'
      ImageIndex = 24
      DataSource = dsDet
    end
    object XDataSetFirst2: TXDataSetFirst
      Category = 'XDataSet'
      Caption = 'P&Rimero'
      Hint = 'Primero'
      ImageIndex = 25
      DataSource = dsDet
    end
  end
  inherited dsCab: TDataSource
    OnDataChange = dsCabDataChange
  end
  object dsDet: TDataSource
    OnStateChange = dsDetStateChange
    OnDataChange = dsDetDataChange
    Left = 478
  end
end
