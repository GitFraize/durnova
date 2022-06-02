unit AdminPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    UsersPanel: TPanel;
    Button1: TButton;
    UserInfoItem: TPanel;
    DeleteUser: TButton;
    UserName: TLabel;
    DBConnection: TADOConnection;
    DS: TDataSource;
    SelectQuery: TADOQuery;
    SourceGrid: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure UpdateUsers();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
var appPath, tableName: string;
begin
  AppPath := ExtractFilePath(Application.ExeName);
  DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+AppPath+'tables\Users.mdb;Persist Security Info=False;';
  tableName := 'Users';
  SelectQuery.SQL.Clear;
  SelectQuery.Close;
  SelectQuery.SQL.Add('SELECT * FROM '+tableName);
  SelectQuery.Open;
  Caption := 'Панель администратора';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  (Owner as TForm).Close()
end;

procedure TForm1.UpdateUsers();
begin
  { }
end;

end.
