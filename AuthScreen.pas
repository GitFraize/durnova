unit AuthScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MainUnit, Vcl.ComCtrls,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, AdminPanelUnit;

type
  TAuthorizationScreen = class(TForm)
    LoginCommonPanel: TPanel;
    Label1: TLabel;
    AdminPanelButton: TLabel;
    PasswordLabel: TLabel;
    AuthorizeButton: TButton;
    LoginEdit: TEdit;
    PasswordEdit: TEdit;
    AdminLoginPanel: TPanel;
    Label2: TLabel;
    BackToCommonLogin: TLabel;
    Label4: TLabel;
    AdminLogin: TButton;
    AdminLoginEdit: TEdit;
    AdminPassword: TEdit;
    AnimationTimer: TTimer;
    SelectQuery: TADOQuery;
    DS: TDataSource;
    DBConnection: TADOConnection;
    SourceGrid: TDBGrid;
    procedure AuthorizeButtonClick(Sender: TObject);
    procedure AdminPanelButtonMouseEnter(Sender: TObject);
    procedure AdminPanelButtonMouseLeave(Sender: TObject);
    procedure AnimationTimerIn(Sender: TObject);
    procedure AnimationTimerOut(Sender: TObject);
    procedure AdminPanelButtonClick(Sender: TObject);
    procedure BackToCommonLoginClick(Sender: TObject);
    function AdminCanLogin(login: string; password: string): boolean;
    function CanLogin(login: string; password: string): boolean;
    procedure FormActivate(Sender: TObject);
    procedure AdminLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthorizationScreen: TAuthorizationScreen;

implementation

{$R *.dfm}

function TAuthorizationScreen.AdminCanLogin(login: string; password: string): boolean;
begin
  SelectQuery.SQL.Clear;
  SelectQuery.Close;
  SelectQuery.SQL.Add('SELECT uid FROM Users');
  SelectQuery.SQL.Add('WHERE u_login='''+login+''' AND u_password='''+password+''' AND u_access_level=2');
  SelectQuery.Open;
  Result := Length(SourceGrid.DataSource.DataSet.Fields[0].Text) > 0;
end;

function TAuthorizationScreen.CanLogin(login: string; password: string): boolean;
begin
  SelectQuery.SQL.Clear;
  SelectQuery.Close;
  SelectQuery.SQL.Add('SELECT uid FROM Users');
  SelectQuery.SQL.Add('WHERE u_login='''+login+''' AND u_password='''+password+''' AND u_access_level>=1');
  SelectQuery.Open;
  Result := Length(SourceGrid.DataSource.DataSet.Fields[0].Text) > 0;
end;

procedure TAuthorizationScreen.AdminLoginClick(Sender: TObject);
var canBeLoggedIn: boolean;
var adminPanel: TAdminPanel;
begin
  canBeLoggedIn := AdminCanLogin(AdminLoginEdit.Text, AdminPassword.Text);

  if canBeLoggedIn then begin
    Label2.Font.Color := clGreen;
    Label4.Font.Color := clGreen;
    adminPanel := TAdminPanel.Create(Self);
    adminPanel.Show();
    Self.Hide()
  end else begin
    Label2.Font.Color := clRed;
    Label4.Font.Color := clRed;
  end;
end;

procedure TAuthorizationScreen.AdminPanelButtonClick(Sender: TObject);
begin
  caption := 'Вход в панель администратора';
  animationTimer.OnTimer := AnimationTimerIn;
  animationTimer.Enabled := true;
end;

procedure TAuthorizationScreen.AdminPanelButtonMouseEnter(Sender: TObject);
begin
  Screen.Cursor := crHandPoint;
end;

procedure TAuthorizationScreen.AdminPanelButtonMouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TAuthorizationScreen.AnimationTimerIn(Sender: TObject);
var currentLeft: Integer;
begin
  if loginCommonPanel.Left > -adminLoginPanel.Width then begin
    currentLeft := loginCommonPanel.Left - 50;
    if currentLeft < -adminLoginPanel.Width then begin
      currentLeft := -adminLoginPanel.Width;
      animationTimer.Enabled := false;
    end;
    loginCommonPanel.Left := currentLeft;
    adminLoginPanel.Left := adminLoginPanel.Width + currentLeft;
  end;

end;

procedure TAuthorizationScreen.AnimationTimerOut(Sender: TObject);
var currentLeft: Integer;
begin
  if loginCommonPanel.Left < 0 then begin
    currentLeft := loginCommonPanel.Left + 50;
    if currentLeft > 0 then begin
      currentLeft := 0;
      animationTimer.Enabled := false;
    end;
    loginCommonPanel.Left := currentLeft;
    adminLoginPanel.Left := adminLoginPanel.Width - currentLeft;
  end;
end;

procedure TAuthorizationScreen.AuthorizeButtonClick(Sender: TObject);
var canBeLoggedIn: boolean;
var mainScreen: TMainForm;
begin
  canBeLoggedIn := CanLogin(LoginEdit.Text, PasswordEdit.Text);

  if canBeLoggedIn then begin
    Label1.Font.Color := clGreen;
    PasswordLabel.Font.Color := clGreen;
    mainScreen := TMainForm.Create(AuthorizationScreen);
    mainScreen.Show();
    AuthorizationScreen.Hide()
  end else begin
    Label1.Font.Color := clRed;
    PasswordLabel.Font.Color := clRed;
  end;
end;

procedure TAuthorizationScreen.BackToCommonLoginClick(Sender: TObject);
begin
  caption := 'Авторизация';
  animationTimer.OnTimer := AnimationTimerOut;
  animationTimer.Enabled := true;
end;

procedure TAuthorizationScreen.FormActivate(Sender: TObject);
begin
  DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Application.ExeName)+'tables\Users.mdb;Persist Security Info=False;';
end;

end.
