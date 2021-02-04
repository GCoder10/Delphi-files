unit uPrepareView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, cxButtons, cxControls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, IBCustomDataSet, IBStoredProc,
  IBQuery, cxContainer, cxRadioGroup, cxLabel, cxGroupBox, cxImageComboBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TfPrepareView = class(TForm)
    GridPanel1: TGridPanel;
    CancelButton: TcxButton;
    ImportButton: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ArticleCodeColumn: TcxGridDBColumn;
    cxGrid1DBTableView1PriceColumn: TcxGridDBColumn;
    cxGrid1DBTableViewStatusColumn: TcxGridDBColumn;
    qryCheckIfArticlesExistForClient: TIBQuery;
    SaveToExcelFileButton: TcxButton;
    procedure ImportButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveToExcelFileButtonClick(Sender: TObject);
  private
    { Private declarations }
    StatusMode: String;
    StatusModeAsInteger: integer;
    UpdateMode: String;
  public
    { Public declarations }
  end;

var
  fPrepareView: TfPrepareView;

implementation

uses uExcel2DB, ComObj;

{$R *.dfm}

procedure TfPrepareView.CancelButtonClick(Sender: TObject);
begin
      fPrepareView.Close;
end;

procedure TfPrepareView.FormShow(Sender: TObject);
var
      I, J, RowC, ColC: Integer;
      textToDisplayInStatusField: String;
begin
      RowC := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.RowCount - 1;
      ColC := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.ColumnCount - 2;
      StatusMode := '';
      UpdateMode := '';
      textToDisplayInStatusField := '';
      with cxGrid1DBTableView1.DataController do
        begin

        if MessageDlg('Czy na pewno wykonać sprawdzenie poszczególnych ofert?', mtConfirmation, mbYesNo, 0) = mrYes then
        begin
            RecordCount := 1;
                try
                    for J := 1 to RowC do
                        for I := 0 to ColC do
                begin
                textToDisplayInStatusField := '';
                qryCheckIfArticlesExistForClient.Close;

                    qryCheckIfArticlesExistForClient.ParamByName('I_ARTICLE_CODE').AsAnsiString := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I,J).Text;
                    qryCheckIfArticlesExistForClient.ParamByName('I_CLIENTS_ID').AsInteger := fExcel2DB.ClientsCodeChipsEdit.Result_ID;

                qryCheckIfArticlesExistForClient.Open;
                    RecordCount := RecordCount + 1;
                    Values[J,I] := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I,J).Text;

                    if (fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text <> '') then
                    begin
                          if (StrToFloat(fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text) >= 0) then
                          begin
                                Values[J,I+1] := StrToFloat(fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text);
                          end else
                          begin
                                Values[J,I] := 'Ujemna cena. Artykul nie zostanie wprowadzony';
                          end;
                    end else
                    begin
                          Values[J,I] := 'Brak ceny. Artykul nie zostanie wprowadzony';
                    end;
                            if (qryCheckIfArticlesExistForClient.FieldByName('ERROR_HANDLER').Text <> '') then
                            begin
                                 textToDisplayInStatusField := '';
                            end else
                            begin
                                 if (qryCheckIfArticlesExistForClient.FieldByName('OFFER_WITH_ARTICLE_EXIST').Text = 'Dany klient posiada juz ta oferte ') then
                                 begin
                                 textToDisplayInStatusField := '|| Ilosc artykulu w ofercie - od ' + FloatToStr(qryCheckIfArticlesExistForClient.FieldByName('AMOUNT_FROM_OF_ARTICLE').AsFloat) +
                                                               'do ' + FloatToStr(qryCheckIfArticlesExistForClient.FieldByName('AMOUNT_TO_OF_ARTICLE').AsFloat) +
                                                               '|| Cena:  ' + FloatToStr(qryCheckIfArticlesExistForClient.FieldByName('OFFER_PRICE_TO_RETURN').AsFloat);
                                 end;
                            end;
                    Values[J,I+2] := qryCheckIfArticlesExistForClient.FieldByName('ERROR_HANDLER').Text +
                                     qryCheckIfArticlesExistForClient.FieldByName('OFFER_WITH_ARTICLE_EXIST').Text +
                                     qryCheckIfArticlesExistForClient.FieldByName('COUNT_OFFERS').Text +
                                     qryCheckIfArticlesExistForClient.FieldByName('INFO_IF_MORE_THAN_0_OFFERS').Text +
                                     qryCheckIfArticlesExistForClient.FieldByName('AMOUNT_OF_ARTICLE').Text +
                                     textToDisplayInStatusField +
                                     qryCheckIfArticlesExistForClient.FieldByName('DATES_TO_RETURN').Text +
                                     qryCheckIfArticlesExistForClient.FieldByName('STATUS_TO_RETURN').Text +
                                     trim(qryCheckIfArticlesExistForClient.FieldByName('CURRENCY_TO_RETURN').Text) + ' ' +
                                     qryCheckIfArticlesExistForClient.FieldByName('DELIVERY_TIME_TO_RETURN').Text +
                                     qryCheckIfArticlesExistForClient.FieldByName('MATURITY_TO_RETURN').Text +
                                     qryCheckIfArticlesExistForClient.FieldByName('UNIT_INFO_FOR_OFFER_TO_RETURN').Text;
                end;
                except
                    ShowMessage('Załadowanie danych nie udało się, spróbuj ponownie');
                end;
        end else
        begin
                RecordCount := 1;
                try
                    for J := 1 to RowC do
                        for I := 0 to ColC do
                begin
                    textToDisplayInStatusField := '';
                    RecordCount := RecordCount + 1;
                    Values[J,I] := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I,J).Text;

                    if (fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text <> '') then
                    begin
                          if (StrToFloat(fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text) >= 0) then
                          begin
                                Values[J,I+1] := StrToFloat(fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text);
                          end else
                          begin
                                Values[J,I] := 'Ujemna cena. Artykul nie zostanie wprowadzony';
                          end;
                    end else
                    begin
                          Values[J,I] := 'Brak ceny. Artykul nie zostanie wprowadzony';
                    end;
                    Values[J,I+2] := textToDisplayInStatusField;
                end;
                except
                    ShowMessage('Załadowanie danych nie udało się, spróbuj ponownie');
                end;
        end;
        end;
end;

procedure TfPrepareView.ImportButtonClick(Sender: TObject);
var
      I, J, RowC, ColC: Integer;
begin
      RowC := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.RowCount - 1;
      ColC := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.ColumnCount - 2;
      StatusMode := fExcel2DB.StatusForOfferCxImageComboBox.Text;
      UpdateMode := fExcel2DB.UpdateModeCxImageComboBox.Text;

      if (StatusMode <> '') and (UpdateMode <> '') then
      begin

      if (StatusMode = 'Brak') then
             StatusModeAsInteger := 0;

      if (StatusMode = 'Domyslna') then
             StatusModeAsInteger := 1;

      if (StatusMode = 'Aktywna') then
             StatusModeAsInteger := 2;

      if (StatusMode = 'Nieaktywna') then
             StatusModeAsInteger := 3;

      try
          for J := 1 to RowC do
              for I := 0 to ColC do
              begin

              fExcel2DB.spExcelImport.ParamByName('I_DATE_FROM').AsDate := fExcel2DB.deDateFrom.Date;
              fExcel2DB.spExcelImport.ParamByName('I_DATE_TO').AsDate := fExcel2DB.deDateTo.Date;
                if (fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text <> '') then
                begin
                      fExcel2DB.spExcelImport.ParamByName('I_PRICE').AsFloat := StrToFloat(fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I+1,J).Text);
                end else
                begin
                      fExcel2DB.spExcelImport.ParamByName('I_PRICE').AsFloat := 0;
                end;
              fExcel2DB.spExcelImport.ParamByName('I_AMOUNT_FROM').AsFloat := StrToFloat(fExcel2DB.AmountFromCxMaskEdit.Text);
              fExcel2DB.spExcelImport.ParamByName('I_AMOUNT_TO').AsFloat := StrToFloat(fExcel2DB.AmountToCxMaskEdit.Text);
              fExcel2DB.spExcelImport.ParamByName('I_DELIVERY_TIME').AsFloat := StrToFloat(fExcel2DB.DeliveryTimeCxMaskEdit.Text);
              fExcel2DB.spExcelImport.ParamByName('I_MATURITY').AsFloat := StrToFloat(fExcel2DB.MaturityCxMaskEdit.Text);
              fExcel2DB.spExcelImport.ParamByName('I_CLIENTS_ID').AsInteger := fExcel2DB.ClientsCodeChipsEdit.Result_ID;
              fExcel2DB.spExcelImport.ParamByName('I_CURRENCY_ID').AsInteger := fExcel2DB.CurrencyCodeChipsEdit.Result_ID;
              fExcel2DB.spExcelImport.ParamByName('I_ARTICLE_CODE').AsAnsiString := fExcel2DB.Excel2DbCxSpreadSheetBook.ActiveSheet.GetCellObject(I,J).Text;
              fExcel2DB.spExcelImport.ParamByName('I_UPDATE_MODE').AsAnsiString := UpdateMode;
              fExcel2DB.spExcelImport.ParamByName('I_STATUS_FOR_OFFER').AsInteger := StatusModeAsInteger;
              fExcel2DB.spExcelImport.Prepare;
              fExcel2DB.spExcelImport.ExecProc;
              fExcel2DB.spExcelImport.UnPrepare;
              fExcel2DB.spExcelImport.Transaction.Commit;

              end;
              ShowMessage('Import danych powiódł się');
              fPrepareView.Close;
              except
              ShowMessage('Import danych nie udał się, spróbuj ponownie');
              end;

      end
      else begin
              ShowMessage('Przed zaimportowaniem danych wybierz status oraz tryb update bazy');
      end;

end;
procedure TfPrepareView.SaveToExcelFileButtonClick(Sender: TObject);
var
      I, J, RowC, ColC: Integer;
      dir:string;
      Excel: Variant;
begin
      RowC :=  cxGrid1DBTableView1.DataController.RowCount;
      ColC :=  3;
      dir := GetCurrentDir;
      with cxGrid1DBTableView1.DataController do
        begin

            if MessageDlg('Czy na pewno zapisać raport jako plik Excel?', mtConfirmation, mbYesNo, 0) = mrYes then
            begin
                RecordCount := 1;
                try
                    Excel := CreateOleObject('Excel.Application');
                    Excel.WorkBooks.Add;
                    for J := 0 to RowC do
                        for I := 0 to ColC do
                begin
                        Excel.Cells[I,J] := Values[J, I];
                end;
                Excel.ActiveWorkbook.SaveAs(dir+'\raport_przed_importem.xls');
                Excel.Quit;
                except
                        ShowMessage('Nieudany zapis raportu do pliku Excel.');
                end;
            end else
            begin

            end;

        end;

end;

end.

