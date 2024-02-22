unit fSteps;

interface

uses Dialogs;

// pType
// 4 - Electron
// 5 - Ion

type TSteps = class
  private
    ASteps : array of array of Longword;
    Level, MaxStep : Longword;
  public
    constructor Create( pMaxStep, pLevel : Longword);
    procedure Step( pStep : Longword);
    function GetElectron( pStep : Longword) : LongWord;
    function GetIon( pStep : Longword) : LongWord;
    destructor Destroy; override;
end;

implementation

uses fCube, wMain;

constructor TSteps.Create( pMaxStep, pLevel : Longword);
  var i : Integer;
begin
{  MaxStep := pMaxStep;
  if pLevel > WinMain.Cube.MaxZ then Level := WinMain.aCube.MaxZ - 1 else Level := pLevel;
  WinMain.SetStatus( 'Create steps array', MaxStep);
  try
    SetLength(ASteps, MaxStep+1, 2);
  except
    ShowMessage('Out of memory!');
    WinMain.Close;
  end;
  for i := 0 to MaxStep - 1 do begin
    ASteps[i, 0] := 0;
    ASteps[i, 1] := 0;
    WinMain.ChangeStatus(i);
  end;
  WinMain.SetStatus( 'Finish', 0);
  WinMain.eSteps := True;}
end;

destructor TSteps.Destroy;
begin
  ASteps := nil;
//  WinMain.eSteps := False;
	inherited;
end;

procedure TSteps.Step( pStep : Longword);
var ix, iy, iz: Word;
begin
{  ASteps[pStep, 0] := 0;
  ASteps[pStep, 1] := 0;
  for ix := 0 to WinMain.aCube.MaxX do
    for iy := 0 to WinMain.aCube.MaxY do begin
      ASteps[pStep, 0] := ASteps[pStep, 0] + WinMain.aCube.ACube[ ix, iy, Level].Electron;
      ASteps[pStep, 1] := ASteps[pStep, 1] + WinMain.aCube.ACube[ ix, iy, Level].Ion;
    end;}
end;

function TSteps.GetElectron( pStep : Longword) : LongWord;
begin
  if (pStep >=0) and (pStep <= MaxStep) then
    Result := ASteps[ pStep, 0]
  else Result := 0;
end;

function TSteps.GetIon( pStep : Longword) : LongWord;
begin
  if (pStep >=0) and (pStep <= MaxStep) then
    Result := ASteps[ pStep, 0]
  else Result := 0;
end;

end.
