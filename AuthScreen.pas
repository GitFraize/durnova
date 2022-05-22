unit AuthScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MainUnit;

const login = 'Admin';
const password = '1234';


type
  TAuthorizationScreen = class(TForm)
    Label1: TLabel;
    LoginEdit: TEdit;
    PasswordEdit: TEdit;
    PasswordLabel: TLabel;
    AuthorizeButton: TButton;
    procedure AuthorizeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AuthorizationScreen: TAuthorizationScreen;

implementation

{$R *.dfm}

procedure TAuthorizationScreen.AuthorizeButtonClick(Sender: TObject);
var canBeLoggedIn: boolean;
var mainScreen: TMainForm;
begin
  canBeLoggedIn := LoginEdit.Text = login;
  canBeLoggedIn := canBeLoggedIn And (PasswordEdit.Text = password);

  mainScreen := TMainForm.Create(AuthorizationScreen);
  mainScreen.Show();
  AuthorizationScreen.Hide()
end;

end.
