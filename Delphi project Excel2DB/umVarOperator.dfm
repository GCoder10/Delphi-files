object dmVarOperator: TdmVarOperator
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 97
  Width = 384
  object VarOperator: TVarOperatorNew
    HeaderSearchColor = clBlack
    ReceiveEvents = False
    ShowSavedInfo = False
    ShowPicture = False
    PlaySounds = False
    WareHouseID = 0
    NextOnEnter = False
    FocusedColor = clYellow
    RequiredColor = clBlack
    ReminderActive = False
    ReminderStyle = 0
    CaseInsensitive = True
    Containing = True
    CheckDataBeforeInsert = False
    DeliveryWeekDelay = 0
    GetDiscountWithPromo = False
    IniApp = 'Saturn.ini'
    Left = 56
    Top = 24
  end
  object cdsUwagiSlownik: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 24
    object cdsUwagiSlownikUWAGI_SLOWNIK_KOD: TStringField
      FieldName = 'UWAGI_SLOWNIK_KOD'
    end
    object cdsUwagiSlownikTEXT: TStringField
      FieldName = 'TEXT'
      Size = 2048
    end
  end
  object cdsUwagiSlownikJez: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 24
    object cdsUwagiSlownikJezJEZYK_KOD: TStringField
      FieldName = 'JEZYK_KOD'
    end
    object cdsUwagiSlownikJezUWAGI_SLOWNIK_KOD: TStringField
      FieldName = 'UWAGI_SLOWNIK_KOD'
    end
    object cdsUwagiSlownikJezTEXT: TStringField
      FieldName = 'TEXT'
      Size = 2048
    end
  end
end
