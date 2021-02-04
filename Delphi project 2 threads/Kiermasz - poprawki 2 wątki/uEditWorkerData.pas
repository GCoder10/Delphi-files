unit uEditWorkerData;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  cxLabel,
  Vcl.StdCtrls,
  System.ImageList,
  Vcl.ImgList,
  cxImageList,
  MidasLib;

type
  TfEditWorkerData = class(TForm)
    gpEditWorkerDataForm:       TGridPanel;
    AddressCxLabel:             TcxLabel;
    PostCodeCxLabel:            TcxLabel;
    StreetCxLabel:              TcxLabel;
    InstitutionCxLabel:         TcxLabel;
    CancelButton:               TButton;
    SaveChangesButton:          TButton;
    fEditWorkerDataCxImageList: TcxImageList;
    AddressEdit:                TEdit;
    PostCodeEdit:               TEdit;
    StreetEdit:                 TEdit;
    OlReInstitutionRadioButton: TRadioButton;
    DbInstitutionRadioButton:   TRadioButton;


    procedure CancelButtonClick        (Sender: TObject);
    procedure FormShow                 (Sender: TObject);
    procedure SaveChangesButtonClick   (Sender: TObject);



  private
    { Private declarations }
    referenceNumber:               integer;
    referenceNumberFromFMainPanel: string;


    procedure WMSysCommand (var message:twmsyscommand); message WM_SYSCOMMAND;


  public
    { Public declarations }
  end;

var
  fEditWorkerData: TfEditWorkerData;

implementation

{$R *.dfm}

uses uListOfWorkers,
     uMainPanel;

// Funkcja do generowania w³asnych okien dialogowych.
function MyMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; Captions: array of string): Integer;
var
  aMsgDlg:      TForm;
  i:            Integer;
  dlgButton:    TButton;
  CaptionIndex: Integer;
begin

  aMsgDlg      := CreateMessageDialog(Msg, DlgType, Buttons);
  captionIndex := 0;

  for i := 0 to aMsgDlg.ComponentCount - 1 do
  begin

    if (aMsgDlg.Components[i] is TButton) then
    begin
      dlgButton := TButton(aMsgDlg.Components[i]);
      if CaptionIndex > High(Captions) then Break;

      dlgButton.Caption := Captions[CaptionIndex];
      Inc(CaptionIndex);
    end;
  end;
  Result := aMsgDlg.ShowModal;
end;

procedure TfEditWorkerData.WMSysCommand(var message: TWMSysCommand);
begin
       if message.CmdType and $fff0=SC_CLOSE then
       begin
          fListOfWorkers.IfEditDataOfChoosenWorkerButtonClickInFListOfWorkers := false;
          fMainPanel.IfFinalizeSellButtonClickInFMainPanel                    := false;
          fMainPanel.delayInFinalizeSellButtonClickInFMainPanel               := true;
          fEditWorkerData.Close;
       end;

       if message.CmdType and $fff0<>SC_CLOSE then
          inherited;
end;

procedure TfEditWorkerData.CancelButtonClick(Sender: TObject);
begin
      fListOfWorkers.IfEditDataOfChoosenWorkerButtonClickInFListOfWorkers := false;
      fMainPanel.IfFinalizeSellButtonClickInFMainPanel                    := false;
      fMainPanel.delayInFinalizeSellButtonClickInFMainPanel               := true;
      fEditWorkerData.Close;
end;

procedure TfEditWorkerData.FormShow(Sender: TObject);
begin
    // Je¿eli edycja danych pracownika pochodzi z TfListOfWorkers.EditDataOfChoosenWorkerButtonClick(Sender: TObject);
    // Dane adresowe pracownika zostaj¹ za³adowane wtedy z formatki "uListOfWorkers".
    if (fListOfWorkers.IfEditDataOfChoosenWorkerButtonClickInFListOfWorkers) then
    begin

            AddressEdit.Text                        := fListOfWorkers.cdsDataOfChoosedWorkerADRES.AsString;
            PostCodeEdit.Text                       := fListOfWorkers.cdsDataOfChoosedWorkerKOD_POCZTOWY.AsString;
            StreetEdit.Text                         := fListOfWorkers.cdsDataOfChoosedWorkerULICA.AsString;

            if (fListOfWorkers.cdsDataOfChoosedWorkerZAK£AD.AsString = 'OL,RE') then
            begin
                 OlReInstitutionRadioButton.Checked := true;
            end;
            if (fListOfWorkers.cdsDataOfChoosedWorkerZAK£AD.AsString = 'DB') then
            begin
                 DbInstitutionRadioButton.Checked   := true;
            end;

            referenceNumber                         := fListOfWorkers.referenceNumber;

    end;
    // Je¿eli edycja danych pracownika pochodzi z TfMainPanel.FinalizeSellButtonClick(Sender: TObject);
    // Dane adresowe pracownika zostaj¹ za³adowane wtedy z formatki "uMainPanel".
    // Je¿eli na pocz¹tku finalizacji sprzeda¿y oka¿e siê, ¿e dany pracownik nie posiada danych adresowych,
    // wtedy wyœwietlenie tej formatki.
    if (fMainPanel.IfFinalizeSellButtonClickInFMainPanel) then
    begin

            AddressEdit.Text                        := fMainPanel.cdsAllWorkersDataADRES.AsString;
            PostCodeEdit.Text                       := fMainPanel.cdsAllWorkersDataKOD_POCZTOWY.AsString;
            StreetEdit.Text                         := fMainPanel.cdsAllWorkersDataULICA.AsString;

            if (fMainPanel.cdsAllWorkersDataZAK£AD.AsString = 'OL,RE') then
            begin
                 OlReInstitutionRadioButton.Checked := true;
            end;
            if (fMainPanel.cdsAllWorkersDataZAK£AD.AsString = 'DB') then
            begin
                 DbInstitutionRadioButton.Checked   := true;
            end;

            referenceNumberFromFMainPanel           := fMainPanel.WorkerIDEditInSellTabPanel.Text;

    end;
end;

procedure TfEditWorkerData.SaveChangesButtonClick(Sender: TObject);
begin
    // Je¿eli formatka zosta³a wywo³ana po naciœniêciu "Edytuj dane pracownika" z formatki "uListOfWorkers".
    // Szukanie pracownika po numerze referencyjnym lub kodzie z przepustki z fMainPanel.cdsAllWorkersData.
    // Zapisanie zmian w danych adresowych pracownika w tabeli przechowuj¹cej dane pracowników w formatce "uMainPanel":
    // cdsAllWorkersData.
    // Za³adowanie nowych danych adresowych do grida w formatce "uListOfWorkers" (poprzez zaktualizowanie tabeli
    // cdsDataOfChoosedWorker).
    if (fListOfWorkers.IfEditDataOfChoosenWorkerButtonClickInFListOfWorkers) then
    begin
          if MyMessageDialog('Czy na pewno zapisaæ wprowadzone zmiany?', mtConfirmation, mbYesNo, ['TAK','NIE']) = mrYes then
          begin


                fListOfWorkers.cdsDataOfChoosedWorker.Edit;
                fListOfWorkers.cdsDataOfChoosedWorker.DisableControls;
                fListOfWorkers.cdsDataOfChoosedWorkerADRES.AsString        := AddressEdit.Text;
                fListOfWorkers.cdsDataOfChoosedWorkerKOD_POCZTOWY.AsString := PostCodeEdit.Text;
                fListOfWorkers.cdsDataOfChoosedWorkerULICA.AsString        := StreetEdit.Text;
                if (OlReInstitutionRadioButton.Checked) then
                begin
                    fListOfWorkers.cdsDataOfChoosedWorkerZAK£AD.AsString   := 'OL,RE'
                end;
                if (DbInstitutionRadioButton.Checked) then
                begin
                    fListOfWorkers.cdsDataOfChoosedWorkerZAK£AD.AsString   := 'DB'
                end;
                fListOfWorkers.cdsDataOfChoosedWorker.Post;
                fListOfWorkers.cdsDataOfChoosedWorker.EnableControls;


                fMainPanel.cdsAllWorkersData.First;
                while not fMainPanel.cdsAllWorkersData.Eof do
                begin

                      if (fMainPanel.cdsAllWorkersDataHAS£O.AsString           = fListOfWorkers.cdsDataOfChoosedWorkerHAS£O.AsString) OR
                         (fMainPanel.cdsAllWorkersDataNR_EWIDENCYJNY.AsInteger = fListOfWorkers.cdsDataOfChoosedWorkerNR_EWIDENCYJNY.AsInteger) then
                      begin
                                fMainPanel.cdsAllWorkersData.Edit;
                                fMainPanel.cdsAllWorkersData.DisableControls;
                                fMainPanel.cdsAllWorkersDataADRES.AsString        := AddressEdit.Text;
                                fMainPanel.cdsAllWorkersDataKOD_POCZTOWY.AsString := PostCodeEdit.Text;
                                fMainPanel.cdsAllWorkersDataULICA.AsString        := StreetEdit.Text;
                                if (OlReInstitutionRadioButton.Checked) then
                                begin
                                    fMainPanel.cdsAllWorkersDataZAK£AD.AsString   := 'OL,RE'
                                end;
                                if (DbInstitutionRadioButton.Checked) then
                                begin
                                    fMainPanel.cdsAllWorkersDataZAK£AD.AsString   := 'DB'
                                end;
                                fMainPanel.cdsAllWorkersData.Post;
                                fMainPanel.cdsAllWorkersData.EnableControls;
                      end;
                      fMainPanel.cdsAllWorkersData.Next;
                end;
                fListOfWorkers.IfEditDataOfChoosenWorkerButtonClickInFListOfWorkers := false;
                fEditWorkerData.Close;
          end;
    end;
    // Je¿eli podczas finalizacji sprzeda¿y oka¿e siê, ¿e dany pracownik nie ma wszystkich danych adresowych.
    // Finalizacja sprzeda¿y, czyli: TfMainPanel.FinalizeSellButtonClick(Sender: TObject);
    // Szukanie pracownika po numerze referencyjnym lub zeskanowanym kodzie z przepustki.
    // Zapisanie zmian w danych adresowych pracownika w tabeli przechowuj¹cej dane pracowników w formatce "uMainPanel":
    // cdsAllWorkersData
    // Kontynuowanie finalizacji sprzeda¿y w TfMainPanel.FinalizeSellButtonClick(Sender: TObject);
    // dziêki nadaniu wartoœci true dla zmiennej fMainPanel.delayInFinalizeSellButtonClickInFMainPanel.
    if (fMainPanel.IfFinalizeSellButtonClickInFMainPanel) then
    begin
          if MyMessageDialog('Czy na pewno zapisaæ wprowadzone zmiany?', mtConfirmation, mbYesNo, ['TAK','NIE']) = mrYes then
          begin
                fMainPanel.cdsAllWorkersData.First;
                while not fMainPanel.cdsAllWorkersData.Eof do
                begin
                      if (fMainPanel.workerId = fMainPanel.cdsAllWorkersDataHAS£O.AsString) OR
                         (fMainPanel.workerId = fMainPanel.cdsAllWorkersDataNR_EWIDENCYJNY.AsString) then
                         begin
                                    fMainPanel.cdsAllWorkersData.Edit;
                                    fMainPanel.cdsAllWorkersData.DisableControls;
                                    fMainPanel.cdsAllWorkersDataADRES.AsString            := AddressEdit.Text;
                                    fMainPanel.cdsAllWorkersDataKOD_POCZTOWY.AsString     := PostCodeEdit.Text;
                                    fMainPanel.cdsAllWorkersDataULICA.AsString            := StreetEdit.Text;
                                    if (OlReInstitutionRadioButton.Checked) then
                                    begin
                                          fMainPanel.cdsAllWorkersDataZAK£AD.AsString     := 'OL,RE'
                                    end;
                                    if (DbInstitutionRadioButton.Checked) then
                                    begin
                                          fMainPanel.cdsAllWorkersDataZAK£AD.AsString     := 'DB'
                                    end;
                                    fMainPanel.cdsAllWorkersData.Post;
                                    fMainPanel.cdsAllWorkersData.EnableControls;
                                    fMainPanel.IfFinalizeSellButtonClickInFMainPanel      := false;
                                    fMainPanel.delayInFinalizeSellButtonClickInFMainPanel := true;

                         end;
                         fMainPanel.cdsAllWorkersData.Next;
                end;
                fMainPanel.IfFinalizeSellButtonClickInFMainPanel      := false;
                fMainPanel.delayInFinalizeSellButtonClickInFMainPanel := true;
                fEditWorkerData.Close;
          end;
    end;

end;

end.
