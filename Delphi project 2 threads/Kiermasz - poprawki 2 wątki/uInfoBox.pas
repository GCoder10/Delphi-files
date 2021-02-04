unit uInfoBox;

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
  dxGDIPlusClasses,
  Vcl.ComCtrls;

type
  TfInfoBox = class(TForm)


    gpInfoBox:              TGridPanel;
    fInfoBoxImage:          TImage;
    PleaseWaitCxLabel:      TcxLabel;
    MessageContentCxLabel:  TcxLabel;
    fInfoBoxImage2:         TImage;
    pbFInfoBox:             TProgressBar;
    cxProgressBarLabel:     TcxLabel;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInfoBox: TfInfoBox;

implementation

{$R *.dfm}

end.
