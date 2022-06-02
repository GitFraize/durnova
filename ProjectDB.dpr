program ProjectDB;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  TableEditor in 'TableEditor.pas' {TableEditorForm},
  Localization in 'Localization.pas',
  LabelsFabric in 'LabelsFabric.pas',
  AuthScreen in 'AuthScreen.pas' {AuthorizationScreen},
  AdminPanelUnit in 'AdminPanelUnit.pas' {AdminPanel},
  UserItemPanel in 'UserItemPanel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAuthorizationScreen, AuthorizationScreen);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTableEditorForm, TableEditorForm);
  Application.CreateForm(TAdminPanel, AdminPanel);
  Application.Run;
end.
