unit LabelsFabric;

interface

uses Vcl.StdCtrls, System.Classes, Vcl.Controls, Math, Vcl.Graphics;

type
  TLabelsFabric = class
    public function GetLabel(owner: TComponent; fromTop: integer; text: string; tag: integer): TLabel;
  end;
implementation

{ TLabelsFabric }

function TLabelsFabric.GetLabel(owner: TComponent; fromTop: integer; text: string; tag: integer): TLabel;
var
  ownerAsControl: TWinControl;
begin
  ownerAsControl := owner as TWinControl;
  Result := TLabel.Create(owner);
  Result.Parent := ownerAsControl;
  Result.WordWrap := true;
  Result.Tag := tag;
  Result.Left := 25;
  Result.Top := fromTop;
  Result.Font.Color := clNavy;
  Result.Font.Size := 14;
  Result.Font.Style := [fsUnderline];
  Result.AutoSize := true;
  Result.Width := ownerAsControl.Width - 30;
  Result.Caption := text;
  Result.AutoSize := false;
  Result.Width := ownerAsControl.Width - 30;
end;

end.
