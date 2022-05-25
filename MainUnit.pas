unit MainUnit;

interface

uses
  System.Generics.Collections, ShellAPI, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, TableEditor, Localization, LabelsFabric;

type
  TMainForm = class(TForm)
    MainTabControl: TTabControl;
    LeftGroupBox: TGroupBox;
    RightGroupBox: TGroupBox;
    LeftManuals: TGroupBox;
    RightManuals: TGroupBox;
    procedure ResizeFirstTab;
    procedure ResizeSecondTab;
    procedure FormResize(Sender: TObject);
    procedure openTableEditor(Sender: TObject);
    procedure openManual(Sender: TObject);
    procedure openUrl(Sender: TObject);
    procedure MainTabControlChange(Sender: TObject);
    procedure LinkMouseEnter(Sender: TObject);
    procedure LinkMouseLeave(Sender: TObject);
    procedure LayoutIn(Captions: TArray<String>; Group: TGroupBox; startWith: integer; isTables: boolean);
    procedure AddLinks(ToGroup: TGroupBox);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Localizer: LocalizationClass;
  Fabric: TLabelsFabric;
  AllLabels: Array of TLabel;

implementation

{$R *.dfm}

procedure TMainForm.LayoutIn(Captions: TArray<String>; Group: TGroupBox; startWith: integer; isTables: boolean);
var
  i, fromTop: integer;
  lcaption: string;
  tLabelObj: TLabel;
begin
  fromTop := 20;
  i := startWith;
  for lcaption in Captions do begin
    tLabelObj := Fabric.GetLabel(Group, fromTop, '• '+lcaption, i);
    i := i+1;

    if isTables then
      tLabelObj.OnClick := openTableEditor
    else
      tLabelObj.OnClick := openManual;
    tLabelObj.OnMouseEnter := LinkMouseEnter;
    tLabelObj.OnMouseLeave := LinkMouseLeave;

    fromTop := fromTop + tLabelObj.Height+20;
    SetLength(AllLabels, Length(AllLabels)+1);
    AllLabels[Length(AllLabels)-1] := tLabelObj;
  end;
end;

procedure TMainForm.AddLinks(ToGroup: TGroupBox);
var i, fromTop: integer;
  title: string;
  labelObj: TLabel;
begin
  fromTop := 20;
  for i := 0 to 6 do begin
    title := Localizer.GetLinkTitle(i);
    labelObj := Fabric.GetLabel(ToGroup, fromTop, '• '+title, i);

    labelObj.OnClick := openUrl;
    labelObj.OnMouseEnter := LinkMouseEnter;
    labelObj.OnMouseLeave := LinkMouseLeave;

    fromTop := fromTop + labelObj.Height+20;
    SetLength(AllLabels, Length(AllLabels)+1);
    AllLabels[Length(AllLabels)-1] := labelObj;
  end;
end;

procedure TMainForm.LinkMouseEnter(Sender: TObject);
begin
  Screen.Cursor := crHandPoint;
end;

procedure TMainForm.LinkMouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TMainForm.MainTabControlChange(Sender: TObject);
begin
  case MainTabControl.TabIndex of
    0: begin
      LeftManuals.Visible := false;
      RightManuals.Visible := false;
      LeftGroupBox.Visible := true;
      RightGroupBox.Visible := true;
    end;
    1: begin
      LeftGroupBox.Visible := false;
      RightGroupBox.Visible := false;
      LeftManuals.Visible := true;
      RightManuals.Visible := true;
    end;
  end;
end;

procedure TMainForm.openManual(Sender: TObject);
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName)+'manuals/manual_'+IntToStr((Sender as TLabel).Tag)+'.docx';
  ShellExecute(Application.Handle, nil, PChar(Path), nil, nil, SW_SHOWNORMAL)
end;

procedure TMainForm.openUrl(Sender: TObject);
var
  url: string;
  index: integer;
begin
  index := (Sender as TLabel).Tag;
  url := Localizer.GetLinkUrl(index);
  url := StringReplace(URL, '"', '%22', [rfReplaceAll]);
  ShellExecute(0, 'open', PChar(url), nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.openTableEditor(Sender: TObject);
var
  tEditorForm: TTableEditorForm;
begin
  tEditorForm := TTableEditorForm.Create(self);
  tEditorForm.Show;
  tEditorForm.openTable((Sender as TLabel).Tag, Localizer.GetTableCaption((Sender as TLabel).Tag))
end;

procedure TMainForm.ResizeFirstTab;
begin
  LeftGroupBox.Width := self.ClientWidth div 2;
  LeftGroupBox.Height := self.ClientHeight;
  RightGroupBox.Width := self.ClientWidth div 2;
  RightGroupBox.Height := self.ClientHeight;
  RightGroupBox.Left := LeftGroupBox.Width;
end;

procedure TMainForm.ResizeSecondTab;
begin
  LeftManuals.Left := 0;
  LeftManuals.Width := self.Width div 2;
  LeftManuals.Height := self.Height;
  RightManuals.Width := self.Width div 2;
  RightManuals.Height := self.Height;
  RightManuals.Left := LeftManuals.Width;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  (Owner as TForm).Close()
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ResizeFirstTab;
  ResizeSecondTab;
  Localizer := LocalizationClass.Create;

  LayoutIn(Localizer.GetLeftTables, LeftGroupBox, 1, true);
  LayoutIn(Localizer.GetRightTables, RightGroupBox, Length(Localizer.GetLeftTables)+1, true);
  AddLinks(LeftManuals);
  LayoutIn(Localizer.GetRightManuals, RightManuals, Length(Localizer.GetRightManuals)+1, false);
end;

procedure TMainForm.FormResize(Sender: TObject);
var
  tLabelObj: Tlabel;
begin
  MainTabControl.Width := self.ClientWidth;
  MainTabControl.Height := self.ClientHeight;
  self.ResizeFirstTab;
  self.ResizeSecondTab;
  for tLabelObj in AllLabels do begin
    tLabelObj.AutoSize := true;
    tLabelObj.Width := Width div 2 - 30;
    tLabelObj.Caption := tLabelObj.Caption;
    tLabelObj.AutoSize :=false;
    tLabelObj.Width := Width div 2 - 30;
  end;
end;

end.
