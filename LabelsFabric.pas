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
  Result.Caption := text;
  Result.Tag := tag;
  Result.Width := ownerAsControl.Width - 40;
  Result.Height := Ceil(Length(text)/((ownerAsControl.Width-40) / 20)) * 25;
  Result.Left := 25;
  Result.Top := fromTop;
  Result.Font.Color := clNavy;
  Result.Font.Size := 14;
end;

end.
