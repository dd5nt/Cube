program Cube;

uses
  Forms,
  wMain in 'wMain.pas' {WinMain},
  fCube in 'fCube.pas',
  fRnd in 'fRnd.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Cube';
  Application.CreateForm(TWinMain, WinMain);
  Application.Run;
end.
