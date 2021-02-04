program Project2;

uses
  Forms,
  uExcel2DB in 'uExcel2DB.pas' {fExcel2DB},
  umVarOperator in 'umVarOperator.pas' {dmVarOperator: TDataModule},
  uPrepareView in 'uPrepareView.pas' {fPrepareView};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmVarOperator, dmVarOperator);
  Application.CreateForm(TfExcel2DB, fExcel2DB);
  Application.CreateForm(TfPrepareView, fPrepareView);
  Application.Run;
end.

