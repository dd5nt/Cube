unit fCube;

interface

uses Dialogs, Classes;

type
  TRun = class(TThread)
  private
    procedure SetProgress;
    procedure SetFinish;
  public
    MaxStep, CurStep : Longword;
    Stat : Word;
  protected
    procedure Execute; override;
end;

type
  TElements = class
  private
  public
    Level1, Level2, Level3 : Word;
    AElements : array of array of Word;
    AStatistic : array of Word;
    AMove : array of Byte;
    constructor Create( pNum: LongWord);
    destructor Destroy; override;
    procedure Step;
    procedure Show;
end;

// Conductors type
// 0 - Dielectric
// 1 - Semiconductor
// 2 - Conductor

type
  TCube = class
  private
  public
    ACube : array of array of array of Byte;
    MaxX, MaxY, MaxZ: Word;
    constructor Create( px, py, pz : Word);
    destructor Destroy; override;
    procedure Generate(p0, p1, p2 : Single);
    procedure Show;
end;

implementation

uses wMain, fRnd;

procedure TRun.Execute;
begin
  CurStep := 0;
  eCancel := False;
  WinMain.SetStatus( 'Run', MaxStep);
  while (CurStep < MaxStep) and not eCancel do begin
    Electrons.Step;
    CurStep := CurStep + 1;
    if (CurStep >= Stat) and (CurStep mod Stat = 0) then Electrons.Show;
    Synchronize(SetProgress);
  end;
  Synchronize(SetFinish);
end;

procedure TRun.SetProgress;
begin
  WinMain.ChangeStatus(CurStep);
end;

procedure TRun.SetFinish;
begin
  WinMain.SetStatus('Run complete ',0);
  WinMain.ShowHide(2);
  Electrons.Show;
end;

constructor TElements.Create( pNum : LongWord);
 var i : LongWord;
begin
  try
    SetLength(aElements, pNum, 3);
  except
    ShowMessage('Out of memory!');
    WinMain.Close;
  end;
  try
    SetLength(aMove, pNum);
  except
    ShowMessage('Out of memory!');
    WinMain.Close;
  end;
  try
    SetLength(aStatistic, Cube.MaxZ);
  except
    ShowMessage('Out of memory!');
    WinMain.Close;
  end;
  for i := 0 to pNum - 1 do begin
     aElements[i,0] := Rnd( Cube.MaxX);
     aElements[i,1] := Rnd( Cube.MaxY);
     aElements[i,2] := 0;
  end;
  eElectrons := True;
end;

destructor TElements.Destroy;
begin
  aElements := nil;
  aMove := nil;
  aStatistic := nil;
  eElectrons := False;
	inherited;
end;

procedure TElements.Step;
var ix, iy, iz : Word;
  i: LongWord;
  am : array[0..5] of Byte;
  m, r, n : Byte;
begin
  // Calculate
  for i := 0 to Length(AElements) - 1 do begin
    ix := AElements[i, 0];
    iy := AElements[i, 1];
    iz := AElements[i, 2];
    am[0] := 0;
    am[1] := 0;
    am[2] := 0;
    am[3] := 0;
    am[4] := 0;
    am[5] := 0;
    if (ix > 0) and (Cube.ACube[ix-1, iy, iz] = 2) then am[0] := 1;
    if (ix < Cube.MaxX-1) and (Cube.ACube[ix+1, iy, iz] = 2) then am[1] := 1;
    if (iy > 0) and (Cube.ACube[ix, iy-1, iz] = 2) then am[2] := 1;
    if (iy < Cube.MaxY-1) and (Cube.ACube[ix, iy+1, iz] = 2) then am[3] := 1;
    if (iz > 0) and (Cube.ACube[ix, iy, iz-1] = 2) then am[4] := 1;
    if (iz < Cube.MaxZ-1) and (Cube.ACube[ix, iy, iz+1] = 2) then am[5] := 1;
    r := am[0]+am[1]+am[2]+am[3]+am[4]+am[5];
    m := rnd(r*2+1);
    if m > r then begin
      m := m - r;
      n := 0;
      r := 0;
      while n <> m do begin
        if am[r] > 0 then n := n + 1;
        r := r + 1;
      end;
      aMove[i] := r;
    end else aMove[i] := 0;
  end;
  // Move
  for i := 0 to Length(AElements) - 1 do
    case aMove[i] of
      1: aElements[i, 0] := aElements[i, 0] - 1;
      2: aElements[i, 0] := aElements[i, 0] + 1;
      3: aElements[i, 1] := aElements[i, 1] - 1;
      4: aElements[i, 1] := aElements[i, 1] + 1;
      5: aElements[i, 2] := aElements[i, 2] - 1;
      6: aElements[i, 2] := aElements[i, 2] + 1;
    end;
end;

procedure TElements.Show;
var iz : Word;
    r, i : LongWord;
begin
  for i := 0 to Length(aStatistic) - 1 do
    aStatistic[i] := 0;
  for i := 0 to Length(AElements) - 1 do
    aStatistic[AElements[i, 2]] := aStatistic[AElements[i, 2]] + 1;
  WinMain.sLevel.Channels[0].Data.AddXYPoint( Run.CurStep, aStatistic[Level1]);
  WinMain.sLevel.Channels[1].Data.AddXYPoint( Run.CurStep, aStatistic[Level2]);
  WinMain.sLevel.Channels[2].Data.AddXYPoint( Run.CurStep, aStatistic[Level3]);
  WinMain.sElectrons.Channels[0].Data.Clear();
  for i := 0 to Length(aStatistic) - 1 do
    WinMain.sElectrons.Channels[0].Data.AddXYPoint( i, aStatistic[i]);
end;

constructor TCube.Create( px, py, pz : Word);
begin
  try
    SetLength(ACube, pX, pY, pZ+2);
  except
    ShowMessage('Out of memory!');
    WinMain.Close;
  end;
  MaxX := px; MaxY := py; MaxZ := pz + 2;
  eCube := True;
end;

procedure TCube.Generate(p0, p1, p2 : Single);
 var Max, Max0, Max1, R : LongWord;
  ix, iy, iz : Word;
  Mode : Byte;
begin
  WinMain.SetStatus( 'Create 1 of 2', MaxZ);
  Max := (MaxX+1) * (MaxY+1) * (MaxZ-1);
  Max0 := Round(Max*p0);
  Max1 := Round(Max*p1)+Max0;
  // Electrode
  for ix := 0 to MaxX - 1 do
    for iy := 0 to MaxY - 1 do begin
      ACube[ ix, iy, 0] := 2;
      ACube[ ix, iy, MaxZ - 1] := 2;
  end;
  // Cube
  for ix := 0 to MaxX - 1 do begin
    for iy := 0 to MaxY - 1 do
      for iz := 1 to MaxZ - 2 do begin
        R := Rnd(Max+1);
        if R < Max0 then begin
          Max0 := Max0 - 1;
          Max1 := Max1 - 1;
          Mode := 0;
        end else if R < Max1 then begin
          Max1 := Max1 - 1;
          Mode := 1;
        end else begin
          Mode := 2;
        end;
        Max := Max - 1;
        ACube[ ix, iy, iz] := Mode;
      end;
    WinMain.ChangeStatus( ix);
  end;
  Show;
end;

destructor TCube.Destroy;
begin
  ACube := nil;
  MaxX := 0; MaxY := 0; MaxZ := 0;
  eCube := False;
	inherited;
end;

procedure TCube.Show;
var ix, iy, iz : Word;
    r0, r1, r2 : LongWord;
begin
  WinMain.SetStatus( 'Create 2 of 2', MaxZ);
  WinMain.sConductors.Channels[0].Data.Clear();
  WinMain.sConductors.Channels[1].Data.Clear();
  WinMain.sConductors.Channels[2].Data.Clear();
  for iz := 0 to MaxZ - 1 do begin
    r0 := 0; r1 := 0; r2 := 0;
    for ix := 0 to MaxX - 1 do
      for iy := 0 to MaxY - 1 do
        case ACube[ix, iy, iz] of
          0: r0 := r0 + 1;
          1: r1 := r1 + 1;
          2: r2 := r2 + 1;
        end;
    WinMain.sConductors.Channels[0].Data.AddXYPoint(iz,r0);
    WinMain.sConductors.Channels[1].Data.AddXYPoint(iz,r1);
    WinMain.sConductors.Channels[2].Data.AddXYPoint(iz,r2);
    WinMain.ChangeStatus(iz);
  end;
  WinMain.pControl.ActivePageIndex := 1;
  WinMain.SetStatus( 'Create complete', 0);
end;

end.
