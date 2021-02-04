unit uExcel2DB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxSSheet, cxContainer, cxEdit, cxLabel, cxTextEdit,
  Menus, StdCtrls, cxButtons, IBDatabase, DB, IBCustomDataSet,
  IBQuery, cxMaskEdit, cxButtonEdit, cxDBEdit, ChipsEdit, cVarOperator, Grids, Calendar,
  cxDropDownEdit, cxCalendar, CTextEdit, ChipsTextEdit, ExtCtrls, IniFiles,
  IBUpdateSQL, DBTables, IBStoredProc, MidasLib, cxImageComboBox;

type
  TfExcel2DB = class(TForm)
    dbToConnect: TIBDatabase;
    dbTransaction: TIBTransaction;
    qClientsCodeList: TIBQuery;
    dsClientsCodeList: TDataSource;
    OpenDialog1: TOpenDialog;
    qClientsCodeListKLIENCI_ID: TIntegerField;
    qClientsCodeListKLIENCI_KOD: TIBStringField;
    qClientsCodeListKLIENCI_OPIS: TIBStringField;
    GridPanel1: TGridPanel;
    Excel2DbCxSpreadSheetBook: TcxSpreadSheetBook;
    PathCxLabel: TcxLabel;
    LoginCxLabel: TcxLabel;
    PasswordCxLabel: TcxLabel;
    DatabasePathCxTextEdit: TcxTextEdit;
    LoginCxTextEdit: TcxTextEdit;
    PasswordCxTextEdit: TcxTextEdit;
    ConnectButton: TcxButton;
    LoadExcelFileButton: TcxButton;
    ClientsCxLabel: TcxLabel;
    ClientsCodeChipsEdit: TChipsTextEdit;
    DateFromCxLabel: TcxLabel;
    DateToCxLabel: TcxLabel;
    deDateFrom: TcxDateEdit;
    deDateTo: TcxDateEdit;
    AmountFromCxLabel: TcxLabel;
    AmountToCxLabel: TcxLabel;
    AmountFromCxMaskEdit: TcxMaskEdit;
    AmountToCxMaskEdit: TcxMaskEdit;
    DatabaseNameCxLabel: TcxLabel;
    Prepare2ImportButton: TcxButton;
    spExcelImport: TIBStoredProc;
    CurrencyCxLabel: TcxLabel;
    CurrencyCodeChipsEdit: TChipsTextEdit;
    qCurrencyCodeList: TIBQuery;
    dsCurrencyCodeList: TDataSource;
    qCurrencyCodeListWALUTA_ID: TIntegerField;
    qCurrencyCodeListWALUTA_KOD: TIBStringField;
    qCurrencyCodeListWALUTA_OPIS: TIBStringField;
    DeliveryTimeCxLabel: TcxLabel;
    DeliveryTimeCxMaskEdit: TcxMaskEdit;
    ConnectedToDbPathCxLabel: TcxLabel;
    MaturityCxLabel: TcxLabel;
    MaturityCxMaskEdit: TcxMaskEdit;
    StatusCxLabel: TcxLabel;
    UpdateDbModeCxLabel: TcxLabel;
    StatusForOfferCxImageComboBox: TcxImageComboBox;
    UpdateModeCxImageComboBox: TcxImageComboBox;
    procedure ConnectButtonClick(Sender: TObject);
    procedure LoadExcelFileButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Prepare2ImportButtonClick(Sender: TObject);
  private
    xlsPatch: string;
    procedure WMSysCommand (var message:twmsyscommand); message WM_SYSCOMMAND;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExcel2DB: TfExcel2DB;

implementation

uses uPrepareView;


{$R *.dfm}
procedure TfExcel2DB.FormShow(Sender: TObject);
var
        ini:TIniFile;
        dir:string;
begin
        dir := GetCurrentDir;
        ini := TIniFile.Create(dir+'\MainForm.ini');
        DatabasePathCxTextEdit.Text := ini.ReadString('Form', 'database_path', '');
        LoginCxTextEdit.Text := ini.ReadString('Form', 'login', '');
        PasswordCxTextEdit.Text := ini.ReadString('Form', 'password', '');
        ClientsCodeChipsEdit.Text := ini.ReadString('Form', 'clients_code', '');
        CurrencyCodeChipsEdit.Text := ini.ReadString('Form', 'currency_code', '');
        deDateFrom.Text := ini.ReadString('Form', 'date_from', '');
        deDateTo.Text := ini.ReadString('Form', 'date_to', '');
        AmountFromCxMaskEdit.Text := ini.ReadString('Form', 'amount_from', '');
        AmountToCxMaskEdit.Text := ini.ReadString('Form', 'amount_to', '');
        DeliveryTimeCxMaskEdit.Text := ini.ReadString('Form', 'delivery_time', '');
        MaturityCxMaskEdit.Text := ini.ReadString('Form', 'maturity', '');
        ini.Free;
        dbToConnect.Connected := False;
        ClientsCodeChipsEdit.Enabled := False;
        CurrencyCodeChipsEdit.Enabled := False;
        AmountFromCxMaskEdit.Align := alClient;
        deDateFrom.Align := alClient;
        deDateTo.Align := alClient;
        AmountToCxMaskEdit.Align := alClient;
        MaturityCxMaskEdit.Align := alClient;
        CurrencyCodeChipsEdit.Align := alClient;
        DeliveryTimeCxMaskEdit.Align := alClient;
        ClientsCodeChipsEdit.Align := alClient;
        DatabasePathCxTextEdit.Align := alClient;
        LoginCxTextEdit.Align := alClient;
        PasswordCxTextEdit.Align := alClient;
        StatusForOfferCxImageComboBox.Align := alClient;
        UpdateModeCxImageComboBox.Align := alClient;
end;

procedure TfExcel2DB.Prepare2ImportButtonClick(Sender: TObject);
begin
      if not (dbToConnect.Connected) then
        begin
             ShowMessage('Aby wykonaæ przygotowanie danych do importu, po³¹cz siê z baz¹');
        end
        else begin
              if (deDateFrom.Text = '') OR
                 (deDateTo.Text = '') OR
                 (AmountFromCxMaskEdit.Text = '') OR
                 (AmountToCxMaskEdit.Text = '') OR
                 (DeliveryTimeCxMaskEdit.Text = '') OR
                 (MaturityCxMaskEdit.Text = '') OR
                 (StatusForOfferCxImageComboBox.Text = '') OR
                 (UpdateModeCxImageComboBox.Text = '') then
                 begin
                     ShowMessage('Uzupe³nij wszystkie pola z danymi');
                 end
                 else begin
                     if (ClientsCodeChipsEdit.Text = '') then
                     begin
                          ShowMessage('Wybierz konkretnego klienta');
                     end
                     else begin
                         if (CurrencyCodeChipsEdit.Text = '') then
                         begin
                              ShowMessage('Wybierz konkretn¹ walutê');
                         end
                         else begin
                                if (xlsPatch = '') then
                                begin
                                    ShowMessage('Wybierz plik Excel z danymi do importu');
                                end
                                else begin
                                          ShowMessage('Przygotowanie danych do importu powiod³o siê.');
                                          fPrepareView.Show;
                                end;
                         end;
                     end;
                 end;
        end;
end;

procedure TfExcel2DB.WMSysCommand(var message: TWMSysCommand);
var
       ini:TIniFile;
       dir:string;
begin
       dir := GetCurrentDir;
       if message.CmdType and $fff0=SC_CLOSE then
          if MessageDlg('Czy na pewno zamkn¹æ aplikacjê?', mtConfirmation, mbYesNo, 0) = mrYes then
          begin
          ini := TIniFile.Create(dir+'\MainForm.ini');
          ini.WriteString('Form', 'database_path', DatabasePathCxTextEdit.Text);
          ini.WriteString('Form', 'login', LoginCxTextEdit.Text);
          ini.WriteString('Form', 'password', PasswordCxTextEdit.Text);
          ini.WriteString('Form', 'clients_code', ClientsCodeChipsEdit.Text);
          ini.WriteString('Form', 'currency_code', CurrencyCodeChipsEdit.Text);
          ini.WriteString('Form', 'date_from', deDateFrom.Text);
          ini.WriteString('Form', 'date_to', deDateTo.Text);
          ini.WriteString('Form', 'amount_from', AmountFromCxMaskEdit.Text);
          ini.WriteString('Form', 'amount_to', AmountToCxMaskEdit.Text);
          ini.WriteString('Form', 'delivery_time', DeliveryTimeCxMaskEdit.Text);
          ini.WriteString('Form', 'maturity', MaturityCxMaskEdit.Text);
          ini.Free;
          application.terminate;
          end;
       if message.CmdType and $fff0<>SC_CLOSE then
          inherited;
end;

procedure TfExcel2DB.ConnectButtonClick(Sender: TObject);
begin
    try
        dbToConnect.Connected := False;
        ClientsCodeChipsEdit.Enabled := False;
        CurrencyCodeChipsEdit.Enabled := False;
        dbToConnect.DatabaseName := DatabasePathCxTextEdit.Text;
        dbToConnect.Params.Clear;
        dbToConnect.Params.Add('user_name='+LoginCxTextEdit.Text);
        dbToConnect.Params.Add('password='+PasswordCxTextEdit.Text);
        dbToConnect.Connected := True;



        if dbToConnect.Connected then
        begin
              DatabaseNamecxLabel.Clear;
              ShowMessage('Udane po³¹czenie z baz¹');

              DatabaseNamecxLabel.Caption := dbToConnect.DatabaseName;
              ClientsCodeChipsEdit.Enabled := True;
              CurrencyCodeChipsEdit.Enabled := True;
        end;


        qClientsCodeList.Close;
        qClientsCodeList.Open;
        qCurrencyCodeList.Close;
        qCurrencyCodeList.Open;
    except
        ShowMessage('B³êdna nazwa bazy, login lub has³o');
    end;
end;

procedure TfExcel2DB.LoadExcelFileButtonClick(Sender: TObject);
var
        dlg: TOpenDialog;
begin
        xlsPatch := '';
        dlg := TOpenDialog.Create(nil);

        dlg.InitialDir := 'C:\';
        dlg.Filter := 'xls files (*.xls)|*.xls';
        if dlg.Execute(Handle) then
              xlsPatch := dlg.FileName;


        if xlsPatch <> '' then
              Excel2DbCxSpreadSheetBook.LoadFromFile(xlsPatch);
end;

end.

