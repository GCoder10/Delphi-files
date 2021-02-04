object fExit: TfExit
  Left = 0
  Top = 0
  Caption = 'fExit'
  ClientHeight = 203
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 402
    Height = 203
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
        ColumnSpan = 10
        Control = cxLabel1
        Row = 0
        RowSpan = 3
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = TakButton
        Row = 7
        RowSpan = 2
      end
      item
        Column = 7
        ColumnSpan = 3
        Control = NieButton
        Row = 7
        RowSpan = 2
      end>
    RowCollection = <
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
    TabOrder = 0
    DesignSize = (
      402
      203)
    object cxLabel1: TcxLabel
      Left = 26
      Top = 17
      Anchors = []
      Caption = 'Czy na pewno chcesz wyjsc z aplikacji?'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -20
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object TakButton: TcxButton
      Left = 3
      Top = 141
      Width = 116
      Height = 40
      Anchors = []
      Caption = 'TAK'
      ModalResult = 1
      TabOrder = 1
    end
    object NieButton: TcxButton
      Left = 281
      Top = 141
      Width = 120
      Height = 40
      Anchors = []
      Cancel = True
      Caption = 'NIE'
      ModalResult = 3
      TabOrder = 2
    end
  end
end
