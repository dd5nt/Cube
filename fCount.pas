unit fCount;

interface

uses Dialogs;

// pType
// 1 - Conductor
// 2 - Dielectric
// 3 - Semicoductor
// 4 - Electron
// 5 - Ion

type TCount = class
  private
    ACount : array of array of Longword;
    procedure ClearAtom;
  public
    constructor Create;
    procedure CheckConductor;
    procedure CheckAtom;
//    procedure Show;
    function Get(pIndex, pType : Word) : LongWord;
    destructor Destroy; override;
end;

implementation

uses wMain, fCube;

constructor TCount.Create;
var i : Word;
begin
{	inherited;
//  WinMain.SetStatus('Create statistic array', WinMain,Cube.MaxX-1);
  try
    SetLength(ACount, WinMain.aCube.MaxZ + 1, 5);
  except
    ShowMessage('Out of memory!');
    WinMain.Close;
  end;
  for i := 0 to WinMain.aCube.MaxZ do begin
    ACount[i, 0] := 0;
    ACount[i, 1] := 0;
    ACount[i, 2] := 0;
    WinMain.ChangeStatus( i);
  end;
  WinMain.SetStatus( 'Finish', 0);
  WinMain.eCount := True;}
end;

procedure TCount.CheckConductor;
var ix, iy, iz: Word;
begin
{  for ix := 0 to WinMain.aCube.MaxX do
    for iy := 0 to WinMain.aCube.MaxY do
      for iz := 0 to WinMain.aCube.MaxZ do
       case WinMain.aCube.ACube[ ix, iy, iz].Conductor of
       0: ACount[ iz, 0] := ACount[ iz, 0] + 1;
       1: ACount[ iz, 1] := ACount[ iz, 1] + 1;
       2: ACount[ iz, 2] := ACount[ iz, 2] + 1;
      end;}
end;

procedure TCount.ClearAtom;
var i: Word;
begin
{  for i := 0 to WinMain.aCube.MaxZ do begin
    ACount[i, 3] := 0;
    ACount[i, 4] := 0;
  end;}
end;

procedure TCount.CheckAtom;
var ix, iy, iz: Word;
begin
{  ClearAtom;
  for ix := 0 to WinMain.aCube.MaxX do
    for iy := 0 to WinMain.aCube.MaxY do
      for iz := 0 to WinMain.aCube.MaxZ do begin
        ACount[iz, 3] := ACount[iz, 3] + WinMain.aCube.ACube[ ix, iy, iz].Electron;
        ACount[iz, 4] := ACount[iz, 4] + WinMain.aCube.ACube[ ix, iy, iz].Ion;
      end;}
end;

function TCount.Get(pIndex, pType : Word) : LongWord;
begin
{  if (pIndex >= 0) and (pIndex < WinMain.aCube.MaxZ) and (pType > 0) and (pType < 6) then
    Result := ACount[pIndex, pType-1]
  else Result := 0;}
end;

{procedure TCount.ShowConductors;
var i: Word;
begin
  WinMain.gConductors.Channels[0].Data.Clear();
  WinMain.gConductors.Channels[1].Data.Clear();
  WinMain.gConductors.Channels[2].Data.Clear();
  WinMain.gElectrons.Channels[3].Data.Clear();
  WinMain.gElectrons.Channels[4].Data.Clear();
  for i := 0 to Length(ACount)-1 do begin
    WinMain.gCount.Channels[0].Data.AddXYPoint(i,ACount[i, 0]);
    WinMain.gCount.Channels[1].Data.AddXYPoint(i,ACount[i, 1]);
    WinMain.gCount.Channels[2].Data.AddXYPoint(i,ACount[i, 2]);
    WinMain.gCount.Channels[3].Data.AddXYPoint(i,ACount[i, 3]);
    WinMain.gCount.Channels[4].Data.AddXYPoint(i,ACount[i, 4]);
  end;
end;  }

{procedure TCount.ShowElectrons;
var i: Word;
begin
  WinMain.gConductors.Channels[0].Data.Clear();
  WinMain.gConductors.Channels[1].Data.Clear();
  WinMain.gConductors.Channels[2].Data.Clear();
  WinMain.gElectrons.Channels[3].Data.Clear();
  WinMain.gElectrons.Channels[4].Data.Clear();
  for i := 0 to Length(ACount)-1 do begin
    WinMain.gCount.Channels[0].Data.AddXYPoint(i,ACount[i, 0]);
    WinMain.gCount.Channels[1].Data.AddXYPoint(i,ACount[i, 1]);
    WinMain.gCount.Channels[2].Data.AddXYPoint(i,ACount[i, 2]);
    WinMain.gCount.Channels[3].Data.AddXYPoint(i,ACount[i, 3]);
    WinMain.gCount.Channels[4].Data.AddXYPoint(i,ACount[i, 4]);
  end;
end;
}
destructor TCount.Destroy;
begin
  ACount := nil;
//  WinMain.eCube := False;
	inherited;
end;

end.
