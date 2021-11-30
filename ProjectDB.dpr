program ProjectDB;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  TableEditor in 'TableEditor.pas' {TableEditorForm},
  Localization in 'Localization.pas',
  LabelsFabric in 'LabelsFabric.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTableEditorForm, TableEditorForm);
  Application.Run;
end.
