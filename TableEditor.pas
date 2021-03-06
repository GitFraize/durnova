unit TableEditor;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.StdCtrls, System.Generics.Collections,
  Data.FMTBcd, Data.SqlExpr;
type
  TTableEditorForm = class(TForm)
    DBConnection: TADOConnection;
    DBGrid1: TDBGrid;
    MainNavigator: TDBNavigator;
    FindEdit: TEdit;
    SearchButton: TButton;
    ColumnBox: TComboBox;
    Label1: TLabel;
    DS: TDataSource;
    SearchQuery: TADOQuery;
    PrintButton: TButton;
    PrintDialog1: TPrintDialog;
    procedure ResizeGrid;
    procedure FormResize(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSourceChanged(Sender: TObject; Field: TField);
    procedure SetTypeFor(Column: TColumn);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure openTable(tag: integer; tName: string);
  end;
var
  TableEditorForm: TTableEditorForm;
implementation
var
  tableName: string;
  localizedName: string;
  AppPath: string;
{$R *.dfm}
{ TTableEditorForm }

procedure TTableEditorForm.ResizeGrid;
var
  i: Integer;
begin

  DBGrid1.Columns[0].Width := 50;
  if DBGrid1.Columns.Count > 1 then
  for i := 1 to DBGrid1.Columns.Count-1 do begin
    DBGrid1.Columns[i].Width := 150;
  end;
end;

procedure TTableEditorForm.DataSourceChanged(Sender: TObject; Field: TField);
begin
  Caption := localizedName + ' - число записей: ' + IntToStr(SearchQuery.RecordCount);
end;

procedure TTableEditorForm.FindEditChange(Sender: TObject);
begin
  if NOT(Length(ColumnBox.Text) > 0) then begin
    SearchQuery.SQL.Clear;
    SearchQuery.Close;
    SearchQuery.SQL.Add('SELECT * FROM '+tableName);
    SearchQuery.Open;
  end;
  ResizeGrid;
end;
procedure TTableEditorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SearchQuery.Active := false;
  DS.Enabled := false;
end;
procedure TTableEditorForm.FormResize(Sender: TObject);
begin
  DBGrid1.Width := self.ClientWidth;
  DBGrid1.Height := self.ClientHeight - DBGrid1.Top;
  ResizeGrid;
end;
procedure TTableEditorForm.openTable(tag: integer; tName: string);
var
  i: Integer;
begin
  localizedName := tName;
  AppPath := ExtractFilePath(Application.ExeName);
  DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+AppPath+'tables\DB.mdb;Persist Security Info=False;';
  tableName := 'Table_' + IntToStr(tag);
  SearchQuery.SQL.Clear;
  SearchQuery.Close;
  SearchQuery.SQL.Add('SELECT * FROM '+tableName);
  SearchQuery.Open;
  for i := 0 to DBGrid1.Columns.Count-1 do begin
    ColumnBox.Items.Add(DBGrid1.Columns[i].Title.Caption);
    SetTypeFor(DBGrid1.Columns[i]);
  end;
  ResizeGrid;
  Caption := localizedName + ' - число записей: ' + IntToStr(SearchQuery.RecordCount);
end;

procedure TTableEditorForm.PrintButtonClick(Sender: TObject);
begin
  { }
  PrintDialog1.Execute();
end;

procedure TTableEditorForm.SearchButtonClick(Sender: TObject);
begin
  if NOT(ColumnBox.Text = '') then begin
    SearchQuery.Active := false;
    SearchQuery.SQL.Clear;
    SearchQuery.SQL.Add('SELECT * FROM '+tableName+' WHERE '+ColumnBox.Text+' LIKE "%'+FindEdit.Text+'%"');
    SearchQuery.Active := true;
  end;
  ResizeGrid;
end;

procedure TTableEditorForm.SetTypeFor(Column: TColumn);
var pickList: TStringList;
begin
  pickList := TStringList.Create();
  pickList.Clear;
  if Column.Title.Caption = 'Наличие зависимостей' then begin
    pickList.Add('Наркотическая');
    pickList.Add('Психотропные вещества');
  end;

  if Column.Title.Caption = 'СОП' then begin
    pickList.Add('Медицинский');
    pickList.Add('Социально-административный');
    pickList.Add('Психолого-педагогический');
  end;

  if Column.Title.Caption = 'Причина контроля' then begin
    pickList.Add('Жестокое обращение с детьми');
    pickList.Add('Неисполнение родителями своих обязанностей по жизнеобеспечению детей');
    pickList.Add('Отсутствие личного примера в воспитании детей');
    pickList.Add('Вовлечение детей в противоправные действия');
  end;

  if pickList.Count > 0 then
    Column.PickList.SetStrings(pickList);
  pickList.Free;
end;

end.
