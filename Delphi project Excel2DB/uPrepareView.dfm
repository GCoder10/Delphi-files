object fPrepareView: TfPrepareView
  Left = 0
  Top = 0
  Caption = 'Przygotowanie danych do importu - analiza'
  ClientHeight = 646
  ClientWidth = 1121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 1121
    Height = 646
    Align = alClient
    ColumnCollection = <
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end
      item
        Value = 10.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = CancelButton
        Row = 9
      end
      item
        Column = 9
        Control = ImportButton
        Row = 9
      end
      item
        Column = 0
        ColumnSpan = 10
        Control = cxGrid1
        Row = 0
        RowSpan = 9
      end
      item
        Column = 7
        ColumnSpan = 2
        Control = SaveToExcelFileButton
        Row = 9
      end>
    RowCollection = <
      item
        Value = 2.898550724637686000
      end
      item
        Value = 2.898550724637686000
      end
      item
        Value = 13.043478260869560000
      end
      item
        Value = 13.043478260869560000
      end
      item
        Value = 13.043478260869560000
      end
      item
        Value = 13.043478260869560000
      end
      item
        Value = 13.043478260869560000
      end
      item
        Value = 13.043478260869560000
      end
      item
        Value = 13.043478260869560000
      end
      item
        Value = 2.898550724637686000
      end>
    TabOrder = 0
    object CancelButton: TcxButton
      Left = 1
      Top = 618
      Width = 111
      Height = 27
      Align = alClient
      Caption = 'Anuluj'
      TabOrder = 0
      OnClick = CancelButtonClick
    end
    object ImportButton: TcxButton
      Left = 1000
      Top = 618
      Width = 120
      Height = 27
      Align = alClient
      Caption = 'Importuj'
      TabOrder = 1
      OnClick = ImportButtonClick
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 1119
      Height = 617
      Align = alClient
      TabOrder = 2
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGrid1DBTableView1ArticleCodeColumn: TcxGridDBColumn
          Caption = 'Artykul_kod'
          DataBinding.ValueType = 'String'
          Width = 266
        end
        object cxGrid1DBTableView1PriceColumn: TcxGridDBColumn
          Caption = 'Cena'
          DataBinding.ValueType = 'Float'
          Width = 142
        end
        object cxGrid1DBTableViewStatusColumn: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.ValueType = 'String'
          Width = 2513
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object SaveToExcelFileButton: TcxButton
      Left = 778
      Top = 618
      Width = 222
      Height = 27
      Align = alClient
      Caption = 'Zapisz raport jako plik Excel'
      TabOrder = 3
      OnClick = SaveToExcelFileButtonClick
      ExplicitLeft = 240
      ExplicitTop = 640
      ExplicitWidth = 75
      ExplicitHeight = 25
    end
  end
  object qryCheckIfArticlesExistForClient: TIBQuery
    Database = fExcel2DB.dbToConnect
    Transaction = fExcel2DB.dbTransaction
    SQL.Strings = (
      
        'SELECT * FROM IMPORT_OFFER_CHECK_ARTICLE(:I_CLIENTS_ID, :I_ARTIC' +
        'LE_CODE)')
    Left = 1024
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'I_CLIENTS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I_ARTICLE_CODE'
        ParamType = ptUnknown
      end>
  end
end
