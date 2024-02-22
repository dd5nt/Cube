unit wMain;

interface

uses
  Windows, fCube, ExtCtrls, ComCtrls, SLStreamTypes, SLComponentCollection,
  LPDrawLayers, SLScope, StdCtrls, Buttons, Mask, Controls, Classes, Forms,
  SysUtils, Dialogs, Graphics;

type
  TWinMain = class(TForm)
    pSplitter: TSplitter;
    pControl: TPageControl;
    sb: TStatusBar;
    pConductors: TTabSheet;
    pTitle: TPanel;
    pElectron: TTabSheet;
    sConductors: TSLScope;
    pLevel: TTabSheet;
    sElectrons: TSLScope;
    sLevel: TSLScope;
    pCreate: TTabSheet;
    gCube: TGroupBox;
    lX: TLabel;
    lY: TLabel;
    lZ: TLabel;
    eX: TMaskEdit;
    eY: TMaskEdit;
    eZ: TMaskEdit;
    gRatio: TGroupBox;
    lSemiconductor: TLabel;
    lDielectric: TLabel;
    lConductor: TLabel;
    eConductor: TMaskEdit;
    eDielectric: TMaskEdit;
    eSemiconductor: TMaskEdit;
    gElectrons: TGroupBox;
    eNumElectrons: TMaskEdit;
    lElectrond: TLabel;
    gLevel2: TGroupBox;
    lLeval2: TLabel;
    eLevel2: TMaskEdit;
    gLevel1: TGroupBox;
    llavel1: TLabel;
    eLevel1: TMaskEdit;
    gSteps: TGroupBox;
    lStep: TLabel;
    eSteps: TMaskEdit;
    gStat: TGroupBox;
    lStat: TLabel;
    eStat: TMaskEdit;
    bCreate: TBitBtn;
    bClear: TBitBtn;
    gLevel3: TGroupBox;
    lLavel3: TLabel;
    eLevel3: TMaskEdit;
    bStop: TBitBtn;
    bGo: TBitBtn;
    procedure bCreateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure SetStatus( pText: String; pMax: Integer);
    procedure ChangeStatus( pCur: Integer);
    procedure bGoClick(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure ShowHide( pParam : Byte);
    procedure bClearClick(Sender: TObject);
  private
    { Private declarations }
    sbMax, sbCur: LongWord;
  public
    { Public declarations }
  end;

var
  Cube : TCube;
  Electrons : TElements;
  Run : TRun;
  eCube, eElectrons, eCancel : Boolean;

var
  WinMain: TWinMain;

implementation

uses fRnd;

{$R *.dfm}
{$SetPEFlags $20}

procedure TWinMain.FormCreate(Sender: TObject);
begin
  DecimalSeparator:='.';
  eCube := False; eElectrons := False;
  InitRnd;
  ShowHide(1);
end;

procedure TWinMain.bCreateClick(Sender: TObject);
var x, y, z, e : Integer;
    c, d, s, r : Real;
begin
  try
    x := StrToInt(eX.Text);
  except
    x := -1;
    ShowMessage('X = '+eX.Text+' is not a valid integer value')
  end;
  try
    y := StrToInt(eY.Text);
  except
    y := -1;
    ShowMessage('Y = '+eY.Text+' is not a valid integer value')
  end;
  try
    z := StrToInt(eZ.Text);
  except
    z := -1;
    ShowMessage('Z = '+eZ.Text+' is not a valid integer value')
  end;
  try
    c := StrToFloat(eConductor.Text);
  except
    c := -1;
    ShowMessage('Conductor = '+eConductor.Text+' is not a floating point value')
  end;
  try
    d := StrToFloat(eDielectric.Text);
  except
    d := -1;
    ShowMessage('Dielectric = '+eDielectric.Text+' is not a floating point value')
  end;
  try
    s := StrToFloat(eSemiconductor.Text);
  except
    s := -1;
    ShowMessage('Semiconductor = '+eSemiconductor.Text+' is not a floating point value')
  end;
  try
   e := StrToInt(eNumElectrons.Text);
  except
    e := -1;
    ShowMessage('Electrons = '+eNumElectrons.Text+' is not a valid integer value')
  end;
  r := c + d + s;
  if (c > 0) and (d > 0) and (s > 0) then
    if r <> 1 then begin
      ShowMessage('The sum of conductors, dielectrics and semiconductors is not equal 1');
      x := -1;
    end;
  if (x > 0) and (y > 0) and (z > 0) and (e > 0) then begin
    if eCube then Cube.Destroy;
    Cube := TCube.Create( x, y, z);
    Cube.Generate(d, s, c);
    if eElectrons then Electrons.Destroy;
    Electrons := TElements.Create( e);
    ShowHide(2);    
  end;
end;

procedure TWinMain.SetStatus( pText: String; pMax: Integer);
begin
  sb.Panels[0].Text := pText;
  sbMax := pMax;
  sbCur := 0;
  sb.Refresh;
end;

procedure TWinMain.ChangeStatus( pCur: Integer);
begin
  sbCur := pCur;
  sb.Refresh;
  Application.ProcessMessages;
end;

procedure TWinMain.sbDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 1 then begin
    sb.Canvas.Brush.Color := clSilver;
    sb.Canvas.Rectangle( Rect);
    if (sbMax > 0) and (sbCur > 0) then begin
      sb.Canvas.Brush.Color := clGray;
      sb.Canvas.Rectangle(Rect.Left, Rect.Top, Round((Rect.Right-Rect.Left)*(sbCur/sbMax))+Rect.Left-15, Rect.Bottom);
    end;
  end;
end;

procedure TWinMain.bGoClick(Sender: TObject);
var p, l1, l2, l3, s : longWord;
begin
  try
   p := StrToInt(eSteps.Text);
  except
    p := 0;
    ShowMessage('Steps = '+eSteps.Text+' is not a valid integer value')
  end;
  try
   l1 := StrToInt(eLevel1.Text);
  except
    l1 := 0;
    ShowMessage('Steps = '+eLevel1.Text+' is not a valid integer value')
  end;
  try
   l2 := StrToInt(eLevel2.Text);
  except
    l2 := 0;
    ShowMessage('Steps = '+eLevel2.Text+' is not a valid integer value')
  end;
  try
   l3 := StrToInt(eLevel3.Text);
  except
    l3 := 0;
    ShowMessage('Steps = '+eLevel3.Text+' is not a valid integer value')
  end;
  try
   s := StrToInt(eStat.Text);
  except
    s := 0;
    ShowMessage('Steps = '+eStat.Text+' is not a valid integer value')
  end;
  if (p > 0) then begin
    ShowHide(3);
    sLevel.Channels[0].Data.Clear();
    sLevel.Channels[1].Data.Clear();
    sLevel.Channels[2].Data.Clear();
    sLevel.Channels[0].Name := 'Level '+IntToStr(l1);
    sLevel.Channels[1].Name := 'Level '+IntToStr(l2);
    sLevel.Channels[2].Name := 'Level '+IntToStr(l3);
    Electrons.Level1 := l1;
    Electrons.Level2 := l2;
    Electrons.Level3 := l3;
    pControl.ActivePageIndex := 2;
    Run := TRun.Create(False);
    Run.FreeOnTerminate := True;
//    Run.Priority := tpLower;
    Run.Priority := tpHigher;
    Run.MaxStep := p;
    Run.Stat := s;
    Run.Resume;
  end;
end;

procedure TWinMain.bStopClick(Sender: TObject);
begin
  eCancel := True;
end;

procedure TWinMain.ShowHide( pParam : Byte);
begin
  case pParam of
  1:begin
      eX.Enabled := True;
      eY.Enabled := True;
      eZ.Enabled := True;
      eDielectric.Enabled := True;
      eSemiconductor.Enabled := True;
      eConductor.Enabled := True;
      eNumElectrons.Enabled := True;
      eSteps.Enabled := True;
      eLevel1.Enabled := True;
      eLevel2.Enabled := True;
      eLevel3.Enabled := True;
      eStat.Enabled := True;
      bCreate.Enabled := True;
      bClear.Enabled := False;
      bGo.Enabled := False;
      bStop.Enabled := False;
    end;
  2:begin
      eX.Enabled := False;
      eY.Enabled := False;
      eZ.Enabled := False;
      eDielectric.Enabled := False;
      eSemiconductor.Enabled := False;
      eConductor.Enabled := False;
      eNumElectrons.Enabled := False;
      eSteps.Enabled := True;
      eLevel1.Enabled := True;
      eLevel2.Enabled := True;
      eLevel3.Enabled := True;
      eStat.Enabled := True;
      bCreate.Enabled := False;
      bClear.Enabled := True;
      bGo.Enabled := True;
      bStop.Enabled := False;
    end;
  3:begin
      eX.Enabled := False;
      eY.Enabled := False;
      eZ.Enabled := False;
      eDielectric.Enabled := False;
      eSemiconductor.Enabled := False;
      eConductor.Enabled := False;
      eNumElectrons.Enabled := False;
      eSteps.Enabled := False;
      eLevel1.Enabled := False;
      eLevel2.Enabled := False;
      eLevel3.Enabled := False;
      eStat.Enabled := False;
      bCreate.Enabled := False;
      bClear.Enabled := False;
      bGo.Enabled := False;
      bStop.Enabled := True;
    end;
  end;
end;

procedure TWinMain.bClearClick(Sender: TObject);
begin
  if eCube then Cube.Destroy;
  if eElectrons then Electrons.Destroy;
  Showhide(1);
end;

end.
