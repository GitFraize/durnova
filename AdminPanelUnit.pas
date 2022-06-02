unit AdminPanelUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCGrids, Vcl.StdCtrls;

type
  TAdminPanel = class(TForm)
    DBConnection: TADOConnection;
    SelectQuery: TADOQuery;
    DS: TDataSource;
    SourceGrid: TDBGrid;
    DeleteSelected: TButton;
    AddNewUserForm: TGroupBox;
    AddNewUser: TButton;
    LoginField: TEdit;
    LoginLabel: TLabel;
    Label2: TLabel;
    PasswordLabel: TLabel;
    PasswordField: TEdit;
    AccessLevelSelect: TComboBox;
    AccessLevelLabel: TLabel;
    InsertQuery: TADOQuery;
    EmptySource: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MakeItem(login: string; accessLevel: integer);
    procedure LoadItems;
    procedure AddNewUserClick(Sender: TObject);
    procedure DeleteUser(id: string);
    procedure DeleteSelectedClick(Sender: TObject);
    procedure SourceGridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminPanel: TAdminPanel;
  userItems: Array of TPanel;
implementation

{$R *.dfm}

procedure TAdminPanel.AddNewUserClick(Sender: TObject);
var login, password: String;
    accessLevel: string;
    canInsertNewUser: Boolean;
begin
  login := LoginField.Text;
  password := PasswordField.Text;
  canInsertNewUser := true;
  if Length(login) = 0 then begin
    LoginLabel.Font.Color := clRed;
    canInsertNewUser := false;
  end;
  if Length(password) = 0 then begin
    PasswordLabel.Font.Color := clRed;
    canInsertNewUser := false;
  end;

  if canInsertNewUser then begin
    if AccessLevelSelect.Text = 'Пользователь' then
      accessLevel := '1'
    else
      accessLevel := '2';


    InsertQuery.SQL.Clear;
    InsertQuery.Close;
    InsertQuery.SQL.Add('INSERT INTO Users (u_login, u_password, u_access_level)');
    InsertQuery.SQL.Add('VALUES ('''+login+''', '''+password+''', '''+accessLevel+''')');
    InsertQuery.ExecSQL;

    LoadItems;
  end;

end;

procedure TAdminPanel.FormActivate(Sender: TObject);
begin
  DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Application.ExeName)+'tables\Users.mdb;Persist Security Info=False;';
  LoadItems();
end;

procedure TAdminPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  (Owner as TForm).Close();
end;

procedure TAdminPanel.MakeItem(login: string; accessLevel: integer);
var panel: TPanel;
begin
  panel := TPanel.Create(self);
  panel.Name := login;
  panel.Color := clWhite;
  panel.Width := self.ClientWidth;
  panel.Height := 50;
  panel.Left := 0;
  panel.Top := Length(userItems) * 50;
  SetLength(userItems, Length(userItems)+1);
  userItems[Length(userItems)-1] := panel;
end;

procedure TAdminPanel.SourceGridCellClick(Column: TColumn);
begin
  Caption := Column.Field.Index.ToString;
  DeleteSelected.Enabled := Column.Index = 0;
end;

procedure TAdminPanel.LoadItems;
var i: integer;
    field: TField;
    column: TCollectionItem;
begin
  SelectQuery.SQL.Clear;
  SelectQuery.Close;
  SelectQuery.SQL.Add('SELECT uid, u_login, u_access_level FROM Users');
  SelectQuery.Open;

  SourceGrid.Columns[0].Width := 50;
  SourceGrid.Columns[0].Alignment := taCenter;
  SourceGrid.Columns[0].Title.Caption := 'ID';
  SourceGrid.Columns[0].ReadOnly := true;

  SourceGrid.Columns[1].Title.Caption := 'Логин';
  SourceGrid.Columns[1].Width := 370;
  SourceGrid.Columns[1].ReadOnly := true;

  SourceGrid.Columns[2].Title.Caption := 'Уровень доступа';
  SourceGrid.Columns[2].Alignment := taCenter;
  SourceGrid.Columns[2].Width := 150;
  SourceGrid.Columns[2].ReadOnly := true;
end;

procedure TAdminPanel.DeleteSelectedClick(Sender: TObject);
var uid: string;
begin
  uid := SourceGrid.SelectedField.Text;

  DeleteUser(uid);
end;

procedure TAdminPanel.DeleteUser(id: string);
begin
  InsertQuery.SQL.Clear;
  InsertQuery.Close;
  InsertQuery.SQL.Add('DELETE FROM Users');
  InsertQuery.SQL.Add('WHERE uid='+id);
  InsertQuery.ExecSQL;
  LoadItems;
end;

end.
