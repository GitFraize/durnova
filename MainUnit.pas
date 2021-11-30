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
    Left1Link: TLabel;
    Left2Link: TLabel;
    Left3Link: TLabel;
    Left4Link: TLabel;
    Left5Link: TLabel;
    Left6Link: TLabel;
    Righ1Link: TLabel;
    Right2Link: TLabel;
    LeftManuals: TGroupBox;
    RightManuals: TGroupBox;
    Left1Manual: TLabel;
    Left2Manual: TLabel;
    Left3Manual: TLabel;
    Left4Manual: TLabel;
    Right1Manual: TLabel;
    Right2Manual: TLabel;
    Right3Manual: TLabel;
    Left5Manual: TLabel;
    procedure ResizeFirstTab;
    procedure ResizeSecondTab;
    procedure FormResize(Sender: TObject);
    procedure openTableEditor(Sender: TObject);
    procedure openManual(Sender: TObject);
    procedure MainTabControlChange(Sender: TObject);
    procedure LinkMouseEnter(Sender: TObject);
    procedure LinkMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Layout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Localizer: LocalizationClass;
  Fabric: TLabelsFabric;
  MainLabels: TArray<TLabel>;
  ManualLabels: TArray<TLabel>;

implementation

{$R *.dfm}

procedure TMainForm.Layout;
var
  item: TLabel;
begin
  for item in MainLabels do begin
    item.Width := self.clientWidth - 40;
  end;
  for item in ManualLabels do begin
    item.Caption := Localizer.GetCaption(1, item.Tag-1)
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

procedure TMainForm.openTableEditor(Sender: TObject);
var
  tEditorForm: TTableEditorForm;
begin
  tEditorForm := TTableEditorForm.Create(MainForm);
  tEditorForm.Show;
  tEditorForm.openTable((Sender as TLabel).Tag)
end;

procedure TMainForm.ResizeFirstTab;
begin
  LeftGroupBox.Width := MainForm.ClientWidth div 2;
  LeftGroupBox.Height := MainForm.ClientHeight;
  RightGroupBox.Width := MainForm.ClientWidth div 2;
  RightGroupBox.Height := MainForm.ClientHeight;
  RightGroupBox.Left := LeftGroupBox.Width;
end;

procedure TMainForm.ResizeSecondTab;
begin
  LeftManuals.Left := 0;
  LeftManuals.Width := MainTabControl.Width div 2;
  LeftManuals.Height := MainTabControl.Height;
  Left1Manual.Width := LeftManuals.Width - 40;
  Left4Manual.Width := LeftManuals.Width - 40;
  RightManuals.Width := MainTabControl.Width div 2;
  RightManuals.Height := MainTabControl.Height;
  RightManuals.Left := LeftManuals.Width;
end;

procedure Localize;
var
  item: TLabel;
begin
  for item in MainLabels do begin
    item.Caption := Localizer.GetCaption(0, item.Tag-1)
  end;
  for item in ManualLabels do begin
    item.Caption := Localizer.GetCaption(1, item.Tag-1)
  end;

end;

procedure TMainForm.FormActivate(Sender: TObject);
var
  tLabelObj: TLabel;
  fromTop, i: integer;
  lcaption: string;
begin
  Localizer := LocalizationClass.Create;
  MainLabels := [];
  fromTop := 40;
  i := 1;
  for lcaption in Localizer.GetDictionaryOne do begin
    tLabelObj := Fabric.GetLabel(LeftGroupBox, fromTop, lcaption, i);
    i := i+1;
    fromTop := fromTop + tLabelObj.Height + 20;
  end;
  ManualLabels := [Left1Manual, Left2Manual, Left3Manual, Left4Manual, Left5Manual, Right1Manual, Right2Manual, Right3Manual];
  Localize;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  MainTabControl.Width := MainForm.ClientWidth;
  MainTabControl.Height := MainForm.ClientHeight;
  self.ResizeFirstTab;
  self.ResizeSecondTab;
end;

end.
