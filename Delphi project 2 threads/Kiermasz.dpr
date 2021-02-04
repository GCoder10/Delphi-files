program Kiermasz;

uses
  Vcl.Forms,
  uMainPanel in 'uMainPanel.pas' {fMainPanel},
  uListOfWorkers in 'uListOfWorkers.pas' {fListOfWorkers},
  uEditWorkerData in 'uEditWorkerData.pas' {fEditWorkerData},
  uInfoBox in 'uInfoBox.pas' {fInfoBox},
  GetWorkersDataThread in 'GetWorkersDataThread.pas',
  ImportDataFromCSVToDBThread in 'ImportDataFromCSVToDBThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMainPanel, fMainPanel);
  Application.CreateForm(TfListOfWorkers, fListOfWorkers);
  Application.CreateForm(TfEditWorkerData, fEditWorkerData);
  Application.CreateForm(TfInfoBox, fInfoBox);
  Application.Run;
end.
