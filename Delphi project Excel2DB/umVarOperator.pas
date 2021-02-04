unit umVarOperator;

interface

uses
  SysUtils, Classes, VarOperatorNew, cVarOperator, DB, DBClient, Variants;

type
  TdmVarOperator = class(TDataModule)
    VarOperator: TVarOperatorNew;
    cdsUwagiSlownik: TClientDataSet;
    cdsUwagiSlownikJez: TClientDataSet;
    cdsUwagiSlownikUWAGI_SLOWNIK_KOD: TStringField;
    cdsUwagiSlownikTEXT: TStringField;
    cdsUwagiSlownikJezJEZYK_KOD: TStringField;
    cdsUwagiSlownikJezUWAGI_SLOWNIK_KOD: TStringField;
    cdsUwagiSlownikJezTEXT: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function _GetRemarks(code : string):string;
    function _GetRemarksLang(code : string; lang_code : string):string;
  end;

var
  dmVarOperator: TdmVarOperator;

implementation

{$R *.dfm}

procedure TdmVarOperator.DataModuleCreate(Sender: TObject);
begin
  cdsUwagiSlownik.CreateDataSet;
  cdsUwagiSlownikJez.CreateDataSet;
end;

function TdmVarOperator._GetRemarks(code : string): string;
begin
  Result := '';
  if cdsUwagiSlownik.RecordCount > 0 then
  begin
    if cdsUwagiSlownik.Locate('UWAGI_SLOWNIK_KOD', code, []) then
      Result := cdsUwagiSlownik.FieldByName('TEXT').AsString;
  end;
end;

function TdmVarOperator._GetRemarksLang(code : string; lang_code : string): string;
begin
  Result := '';
  if cdsUwagiSlownikJez.RecordCount > 0 then
  begin
    if cdsUwagiSlownikJez.Locate('UWAGI_SLOWNIK_KOD; JEZYK_KOD', VarArrayOf([code, lang_code]), []) then
      Result := cdsUwagiSlownikJez.FieldByName('TEXT').AsString;
  end;
end;

end.
