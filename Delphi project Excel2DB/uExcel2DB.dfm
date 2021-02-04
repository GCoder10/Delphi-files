object fExcel2DB: TfExcel2DB
  Left = 0
  Top = 0
  Caption = 'Importowanie pliku Excel do wybranej bazy'
  ClientHeight = 748
  ClientWidth = 1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 1086
    Height = 748
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
        Control = Excel2DbCxSpreadSheetBook
        Row = 2
        RowSpan = 5
      end
      item
        Column = 0
        Control = PathCxLabel
        Row = 0
      end
      item
        Column = 2
        Control = LoginCxLabel
        Row = 0
      end
      item
        Column = 4
        Control = PasswordCxLabel
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = DatabasePathCxTextEdit
        Row = 1
      end
      item
        Column = 2
        ColumnSpan = 2
        Control = LoginCxTextEdit
        Row = 1
      end
      item
        Column = 4
        ColumnSpan = 2
        Control = PasswordCxTextEdit
        Row = 1
      end
      item
        Column = 6
        ColumnSpan = 2
        Control = ConnectButton
        Row = 1
      end
      item
        Column = 8
        ColumnSpan = 2
        Control = LoadExcelFileButton
        Row = 1
      end
      item
        Column = 0
        Control = ClientsCxLabel
        Row = 9
      end
      item
        Column = 1
        ColumnSpan = 2
        Control = ClientsCodeChipsEdit
        Row = 9
      end
      item
        Column = 4
        Control = DateFromCxLabel
        Row = 7
      end
      item
        Column = 7
        Control = DateToCxLabel
        Row = 7
      end
      item
        Column = 5
        ColumnSpan = 2
        Control = deDateFrom
        Row = 7
      end
      item
        Column = 8
        ColumnSpan = 2
        Control = deDateTo
        Row = 7
      end
      item
        Column = 4
        Control = AmountFromCxLabel
        Row = 8
      end
      item
        Column = 7
        Control = AmountToCxLabel
        Row = 8
      end
      item
        Column = 5
        ColumnSpan = 2
        Control = AmountFromCxMaskEdit
        Row = 8
      end
      item
        Column = 8
        ColumnSpan = 2
        Control = AmountToCxMaskEdit
        Row = 8
      end
      item
        Column = 2
        ColumnSpan = 2
        Control = DatabaseNameCxLabel
        Row = 7
      end
      item
        Column = 9
        Control = Prepare2ImportButton
        Row = 9
      end
      item
        Column = 6
        Control = CurrencyCxLabel
        Row = 9
      end
      item
        Column = 7
        ColumnSpan = 2
        Control = CurrencyCodeChipsEdit
        Row = 9
      end
      item
        Column = 0
        Control = DeliveryTimeCxLabel
        Row = 8
      end
      item
        Column = 1
        ColumnSpan = 2
        Control = DeliveryTimeCxMaskEdit
        Row = 8
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = ConnectedToDbPathCxLabel
        Row = 7
      end
      item
        Column = 3
        Control = MaturityCxLabel
        Row = 9
      end
      item
        Column = 4
        ColumnSpan = 2
        Control = MaturityCxMaskEdit
        Row = 9
      end
      item
        Column = 0
        Control = StatusCxLabel
        Row = 10
      end
      item
        Column = 2
        Control = UpdateDbModeCxLabel
        Row = 10
      end
      item
        Column = 1
        Control = StatusForOfferCxImageComboBox
        Row = 10
      end
      item
        Column = 3
        Control = UpdateModeCxImageComboBox
        Row = 10
      end>
    RowCollection = <
      item
        Value = 2.912621359223301000
      end
      item
        Value = 2.912621359223301000
      end
      item
        Value = 16.504854368932040000
      end
      item
        Value = 16.504854368932040000
      end
      item
        Value = 16.504854368932040000
      end
      item
        Value = 16.504854368932040000
      end
      item
        Value = 16.504854368932040000
      end
      item
        Value = 2.912621359223301000
      end
      item
        Value = 2.912621359223301000
      end
      item
        Value = 2.912621359223301000
      end
      item
        Value = 2.912621359223301000
      end
      item
        SizeStyle = ssAuto
      end>
    TabOrder = 0
    DesignSize = (
      1086
      748)
    object Excel2DbCxSpreadSheetBook: TcxSpreadSheetBook
      Left = 1
      Top = 43
      Width = 1084
      Height = 615
      Align = alClient
      DefaultStyle.Font.Name = 'Tahoma'
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = []
    end
    object PathCxLabel: TcxLabel
      Left = 1
      Top = 1
      Align = alClient
      Caption = 'Sciezka'
    end
    object LoginCxLabel: TcxLabel
      Left = 217
      Top = 1
      Align = alClient
      Caption = 'Login'
    end
    object PasswordCxLabel: TcxLabel
      Left = 433
      Top = 1
      Align = alClient
      Caption = 'Haslo'
    end
    object DatabasePathCxTextEdit: TcxTextEdit
      Left = 1
      Top = 22
      TabOrder = 0
      Width = 176
    end
    object LoginCxTextEdit: TcxTextEdit
      Left = 217
      Top = 22
      TabOrder = 1
      Width = 176
    end
    object PasswordCxTextEdit: TcxTextEdit
      Left = 433
      Top = 22
      Properties.EchoMode = eemPassword
      TabOrder = 2
      Width = 174
    end
    object ConnectButton: TcxButton
      Left = 649
      Top = 22
      Width = 216
      Height = 21
      Align = alClient
      Caption = 'Polacz'
      TabOrder = 3
      OnClick = ConnectButtonClick
    end
    object LoadExcelFileButton: TcxButton
      Left = 865
      Top = 22
      Width = 220
      Height = 21
      Align = alClient
      Caption = 'Wczytaj plik Excel'
      TabOrder = 4
      OnClick = LoadExcelFileButtonClick
    end
    object ClientsCxLabel: TcxLabel
      Left = 1
      Top = 700
      Align = alClient
      Caption = 'Klienci'
    end
    object ClientsCodeChipsEdit: TChipsTextEdit
      Left = 109
      Top = 700
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 113
      TabOrder = 5
      DataField = 'KLIENCI_KOD'
      DataSource = dsClientsCodeList
      ClauseWhereExistsInQry = False
      Form = Owner
      _FocusedColor = clBlack
      Width = 176
    end
    object DateFromCxLabel: TcxLabel
      Left = 433
      Top = 658
      Align = alClient
      Caption = 'Data od'
    end
    object DateToCxLabel: TcxLabel
      Left = 757
      Top = 658
      Align = alClient
      Caption = 'Data do'
    end
    object deDateFrom: TcxDateEdit
      Left = 541
      Top = 658
      TabOrder = 6
      Width = 176
    end
    object deDateTo: TcxDateEdit
      Left = 865
      Top = 658
      TabOrder = 7
      Width = 179
    end
    object AmountFromCxLabel: TcxLabel
      Left = 433
      Top = 679
      Align = alClient
      Caption = 'Ilosc od'
    end
    object AmountToCxLabel: TcxLabel
      Left = 757
      Top = 679
      Align = alClient
      Caption = 'Ilosc do'
    end
    object AmountFromCxMaskEdit: TcxMaskEdit
      Left = 541
      Top = 679
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d{1,1000}'
      Properties.MaxLength = 0
      TabOrder = 8
      Width = 176
    end
    object AmountToCxMaskEdit: TcxMaskEdit
      Left = 865
      Top = 679
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d{1,1000}'
      Properties.MaxLength = 0
      TabOrder = 9
      Width = 179
    end
    object DatabaseNameCxLabel: TcxLabel
      Left = 217
      Top = 658
      Align = alClient
    end
    object Prepare2ImportButton: TcxButton
      Left = 973
      Top = 700
      Width = 112
      Height = 21
      Align = alClient
      Caption = 'Przygotuj'
      TabOrder = 10
      OnClick = Prepare2ImportButtonClick
    end
    object CurrencyCxLabel: TcxLabel
      Left = 649
      Top = 700
      Align = alClient
      Caption = 'Waluta'
    end
    object CurrencyCodeChipsEdit: TChipsTextEdit
      Left = 757
      Top = 700
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 113
      TabOrder = 22
      DataField = 'WALUTA_KOD'
      DataSource = dsCurrencyCodeList
      ClauseWhereExistsInQry = False
      Form = Owner
      _FocusedColor = clBlack
      Width = 176
    end
    object DeliveryTimeCxLabel: TcxLabel
      Left = 1
      Top = 679
      Align = alClient
      Caption = 'Czas dostawy'
    end
    object DeliveryTimeCxMaskEdit: TcxMaskEdit
      Left = 109
      Top = 679
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d{1,1000}'
      Properties.MaxLength = 0
      TabOrder = 24
      Width = 176
    end
    object ConnectedToDbPathCxLabel: TcxLabel
      Left = 1
      Top = 658
      Align = alClient
      Caption = 'Jestes podlaczony do bazy: '
    end
    object MaturityCxLabel: TcxLabel
      Left = 325
      Top = 700
      Align = alClient
      Caption = 'Termin platnosci: '
    end
    object MaturityCxMaskEdit: TcxMaskEdit
      Left = 433
      Top = 700
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d{1,1000}'
      Properties.MaxLength = 0
      TabOrder = 27
      Width = 176
    end
    object StatusCxLabel: TcxLabel
      Left = 1
      Top = 721
      Align = alClient
      Caption = 'Wybierz status:'
    end
    object UpdateDbModeCxLabel: TcxLabel
      Left = 217
      Top = 721
      Align = alClient
      Caption = 'Wybierz tryb pracy:'
    end
    object StatusForOfferCxImageComboBox: TcxImageComboBox
      Left = 109
      Top = 721
      Anchors = []
      Properties.Items = <
        item
          Description = 'Brak'
          ImageIndex = 0
          Value = 'Brak'
        end
        item
          Description = 'Domyslna'
          Tag = 1
          Value = 'Domyslna'
        end
        item
          Description = 'Aktywna'
          Tag = 2
          Value = 'Aktywna'
        end
        item
          Description = 'Nieaktywna'
          Tag = 3
          Value = 'Nieaktywna'
        end>
      TabOrder = 30
      Width = 108
    end
    object UpdateModeCxImageComboBox: TcxImageComboBox
      Left = 325
      Top = 721
      Anchors = []
      Properties.Items = <
        item
          Description = 'Insert'
          Value = 'Insert'
        end
        item
          Description = 'Update'
          Tag = 1
          Value = 'Update'
        end
        item
          Description = 'Smart'
          ImageIndex = 0
          Tag = 2
          Value = 'Smart'
        end>
      TabOrder = 31
      Width = 108
    end
  end
  object dbToConnect: TIBDatabase
    Connected = True
    DatabaseName = 'dev/3022:WZOR'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = dbTransaction
    SQLDialect = 1
    Left = 120
    Top = 240
  end
  object dbTransaction: TIBTransaction
    Active = True
    DefaultDatabase = dbToConnect
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 192
  end
  object qClientsCodeList: TIBQuery
    Database = dbToConnect
    Transaction = dbTransaction
    CachedUpdates = True
    SQL.Strings = (
      'select'
      '          klienci.klienci_id,'
      '          klienci.klienci_kod,'
      '          klienci.klienci_opis'
      'from'
      '          klienci')
    Left = 552
    Top = 136
    object qClientsCodeListKLIENCI_ID: TIntegerField
      FieldName = 'KLIENCI_ID'
      Origin = 'KLIENCI.KLIENCI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qClientsCodeListKLIENCI_KOD: TIBStringField
      FieldName = 'KLIENCI_KOD'
      Origin = 'KLIENCI.KLIENCI_KOD'
      FixedChar = True
      Size = 15
    end
    object qClientsCodeListKLIENCI_OPIS: TIBStringField
      FieldName = 'KLIENCI_OPIS'
      Origin = 'KLIENCI.KLIENCI_OPIS'
      Size = 50
    end
  end
  object dsClientsCodeList: TDataSource
    DataSet = qClientsCodeList
    Left = 552
    Top = 184
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xls'
    FileName = '*.xls'
    Filter = '*.xls'
    Left = 808
    Top = 240
  end
  object spExcelImport: TIBStoredProc
    Database = dbToConnect
    Transaction = dbTransaction
    StoredProcName = 'IMPORT_OFFERS_FROM_EXCEL'
    Left = 648
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'I_AMOUNT_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'I_AMOUNT_TO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'I_DELIVERY_TIME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'I_MATURITY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'I_PRICE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'I_DATE_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'I_DATE_TO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'I_CLIENTS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'I_CURRENCY_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'I_ARTICLE_CODE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'I_STATUS_FOR_OFFER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'I_UPDATE_MODE'
        ParamType = ptInput
      end>
  end
  object qCurrencyCodeList: TIBQuery
    Database = dbToConnect
    Transaction = dbTransaction
    CachedUpdates = True
    SQL.Strings = (
      'select'
      '          waluta.waluta_id,'
      '          waluta.waluta_kod,'
      '          waluta.waluta_opis'
      'from'
      '          waluta')
    Left = 440
    Top = 136
    object qCurrencyCodeListWALUTA_ID: TIntegerField
      FieldName = 'WALUTA_ID'
      Origin = 'WALUTA.WALUTA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCurrencyCodeListWALUTA_KOD: TIBStringField
      FieldName = 'WALUTA_KOD'
      Origin = 'WALUTA.WALUTA_KOD'
      FixedChar = True
      Size = 15
    end
    object qCurrencyCodeListWALUTA_OPIS: TIBStringField
      FieldName = 'WALUTA_OPIS'
      Origin = 'WALUTA.WALUTA_OPIS'
      FixedChar = True
      Size = 50
    end
  end
  object dsCurrencyCodeList: TDataSource
    DataSet = qCurrencyCodeList
    Left = 440
    Top = 184
  end
end
