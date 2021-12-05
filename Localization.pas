unit Localization;

interface
  uses
    System.Generics.Collections;
  type
    SectionType = 0..3;
    LocalizationClass = class
      public
        function GetCaption(section: SectionType; Tag: integer): string;
        function GetLeftTables(): TArray<string>;
        function GetRightTables(): TArray<string>;
        function GetLeftManuals(): TArray<string>;
        function GetRightManuals(): TArray<string>;
        constructor Create;
    end;

implementation
var
  leftTables: TArray<string> = [
    {������� �����}
    '������������� �� ���������� ��������-�������������� �������',
    '����������� ������� ������ � �� ���������� ��������� ���������������',
    '����������� �������������� �� ���������� �������� ���������������� ���������������',
    '����������� �������������� �������� � ���������������� ��������������� ',
    '������������� ������������� �������� ��� ������������ ��������',
    '�������-�������� ������������� �� ��������� ���������'
  ];
  rightTables: TArray<string> = [
    {������� ������}
    '���� ������ ����� � ��������� ������� ���������',
    '���������� ������ � �������� � ��������� ���������'
  ];
  leftManuals: TArray<string> = [
    {����������� �����}
    '����������� ����� �� 24.06.99 N 120-�� �� ������� ������� ������������ ��������������',
    '�� 14 � �� 20 �� ��',
    '�� 183, �� 187-190 ��� ��',
    '������ ���������� ��������� �� ���������������� ��������������� �� 30.12.2001 N 195-��',
    '�� 420 � 421 ��� ��'
  ];
  rightManuals: TArray<string> = [
    {����������� ������}
    '������������ ������� ��� ���������� ���',
    '�������� ����� � ���������� ��� ��������� �������������������',
    '�������� ����� � ���������   ���������� ���'
  ];
{ LocalizationClass }

constructor LocalizationClass.Create;
begin         
end;

function LocalizationClass.GetCaption(Section: SectionType; Tag: integer): string;
begin
  case Section of
    0: Result := leftTables[Tag];
    1: Result := rightTables[Tag];
    2: Result := leftManuals[Tag];
    3: Result := rightManuals[Tag];
  end;
end;

function LocalizationClass.GetLeftManuals: TArray<string>;
begin
  Result := leftManuals;
end;

function LocalizationClass.GetLeftTables: TArray<string>;
begin
  Result := leftTables;
end;

function LocalizationClass.GetRightManuals: TArray<string>;
begin
  Result := rightManuals
end;

function LocalizationClass.GetRightTables: TArray<string>;
begin
  Result := rightTables
end;

end.
