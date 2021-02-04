unit GetWorkersDataThread;

interface

uses
  System.Classes,
  System.SysUtils,
  IBC,
  IBCClasses,
  Datasnap.DBClient,
  Data.DB,
  Vcl.Dialogs,
  Vcl.Forms;

type
tGetWorkersDataDoneEvent   = procedure(Sender: TObject; const Success: Boolean) of object;
tGetWorkersDataThread      = class(TThread)


    tSuccess:                             Boolean;
    tOnFinished:                          tGetWorkersDataDoneEvent;
    ibcdbDFM:                             TIBCConnection;
    ibctOnlyLoad:                         TIBCTransaction;
    ibcqGetWorkersData:                   TIBCQuery;


  protected
    procedure Execute; override;
    procedure SYNC_OnFinished;
  public
    constructor Create;     reintroduce;
    destructor  Destroy;    override;
    property    OnFinished: tGetWorkersDataDoneEvent read tOnFinished write tOnFinished;
  end;

implementation


{ tGetWorkersDataThread }

uses uMainPanel;


constructor tGetWorkersDataThread.Create;
begin
  inherited Create(True);
end;

destructor tGetWorkersDataThread.Destroy;
begin
  inherited;
end;

procedure tGetWorkersDataThread.Execute;
begin
   try
        try
             ibcdbDFM                           := TIBCConnection.Create(nil);
             ibctOnlyLoad                       := TIBCTransaction.Create(nil);
             ibcqGetWorkersData                 := TIBCQuery.Create(nil);
             tSuccess                           := False;


             ibcdbDFM.ClientLibrary             := 'fbclient.dll';
             ibcdbDFM.ConnectString             := 'Data Source=10.10.10.100;Database=/baza/kiermasz.fdb;User ID=KIERMASZ;Password=12345678;Client Library=fbclient.dll;Login Prompt=False';
             ibcdbDFM.Database                  := '/baza/kiermasz.fdb';
             ibcdbDFM.LoginPrompt               := False;
             ibcdbDFM.Password                  := '12345678';
             ibcdbDFM.Port                      := '3050';
             ibcdbDFM.Server                    := '10.10.10.100';
             ibcdbDFM.Username                  := 'KIERMASZ';
             ibcdbDFM.Connected                 := True;
             ibcdbDFM.Open;


             ibctOnlyLoad.DefaultConnection     := ibcdbDFM;
             ibctOnlyLoad.DefaultCloseAction    := taRollback;
             ibctOnlyLoad.IsolationLevel        := iblReadOnlyReadCommitted;


             ibcqGetWorkersData.AutoCalcFields  := True;
             ibcqGetWorkersData.AutoCommit      := True;
             ibcqGetWorkersData.Connection      := ibcdbDFM;
             ibcqGetWorkersData.FetchAll        := True;
             ibcqGetWorkersData.ParamCheck      := True;
             ibcqGetWorkersData.Transaction     := ibctOnlyLoad;
             ibcqGetWorkersData.SQL.Text        := 'SELECT * FROM GET_WORKERS_DATA';


             ibcqGetWorkersData.Close;
             ibcqGetWorkersData.Open;
        finally
             tSuccess := True;
        end;
   except
        ShowMessage('Nie uda³o za³adowaæ siê danych wszystkich pracowników');
   end;
   Synchronize(SYNC_OnFinished);
end;

procedure tGetWorkersDataThread.SYNC_OnFinished;
begin
  if Assigned(tOnFinished) then
  begin
      if not (ibcqGetWorkersData.IsEmpty) then
      begin
              fMainPanel.cdsAllWorkersData.Open;
              fMainPanel.cdsAllWorkersData.DisableControls;
              if not (fMainPanel.cdsAllWorkersData.IsEmpty) then
                      fMainPanel.cdsAllWorkersData.EmptyDataSet;


              while not ibcqGetWorkersData.Eof do
              begin
                    fMainPanel.cdsAllWorkersData.Append;
                    fMainPanel.cdsAllWorkersDataHAS£O.AsString           := ibcqGetWorkersData.FieldByName('REFERENCE_NUMBER_TO_RETURN').AsString;
                    fMainPanel.cdsAllWorkersDataIMIE.AsString            := ibcqGetWorkersData.FieldByName('NAME_TO_RETURN').AsString;
                    fMainPanel.cdsAllWorkersDataNAZWISKO.AsString        := ibcqGetWorkersData.FieldByName('SURNAME_TO_RETURN').AsString;
                    fMainPanel.cdsAllWorkersDataADRES.AsString           := ibcqGetWorkersData.FieldByName('ADDRESS_TO_RETURN').AsString;
                    fMainPanel.cdsAllWorkersDataKOD_POCZTOWY.AsString    := ibcqGetWorkersData.FieldByName('POSTCODE_TO_RETURN').AsString;
                    fMainPanel.cdsAllWorkersDataNR_EWIDENCYJNY.AsInteger := ibcqGetWorkersData.FieldByName('SEC_REF_NUM_TO_RETURN').AsInteger;
                    fMainPanel.cdsAllWorkersDataULICA.AsString           := ibcqGetWorkersData.FieldByName('STREET_TO_RETURN').AsString + ' ' +
                                                                            ibcqGetWorkersData.FieldByName('HOME_NUMBER_TO_RETURN').AsString +
                                                                            ibcqGetWorkersData.FieldByName('FLAT_NUMBER_TO_RETURN').AsString;
                          if (ibcqGetWorkersData.FieldByName('INSTITUTION_TO_RETURN').AsString = 'DFM sp. z o.o. (Dobre Miasto)') then
                          begin
                                        fMainPanel.cdsAllWorkersDataZAK£AD.AsString := 'DB';
                          end else
                          begin
                                  if (ibcqGetWorkersData.FieldByName('INSTITUTION_TO_RETURN').AsString = 'DFM (OL,RE)') then
                                  begin
                                        fMainPanel.cdsAllWorkersDataZAK£AD.AsString := 'OL,RE';
                                  end else
                                  begin
                                        fMainPanel.cdsAllWorkersDataZAK£AD.AsString := '-';
                                  end;
                          end;


                    fMainPanel.cdsAllWorkersData.Post;
                    ibcqGetWorkersData.Next;
              end;
              fMainPanel.cdsAllWorkersData.EnableControls;
      end;
      ibcqGetWorkersData.Close;
      FreeAndNil(ibcqGetWorkersData);

      ibcdbDFM.Close;
      FreeAndNil(ibcdbDFM);
      FreeAndNil(ibctOnlyLoad);
      tOnFinished(Self, tSuccess);
      tSuccess := True;
  end;

end;

end.

