unit Localization;

interface
  uses
    System.Generics.Collections;
  type
    SectionType = 0..1;
    LocalizationClass = class
      private
      public
        function GetCaption(section: SectionType; Tag: integer): string;
        function GetDictionaryOne(): TArray<string>;
        function GetDictionaryTwo(): TArray<string>;
        constructor Create;
    end;

implementation
var 
  dictionaryOne: TArray<string> = [
    {������� �����}
    '������������� �� ���������� ��������-�������������� �������',
    '����������� ������� ������ � �� ���������� ��������� ���������������',
    '����������� �������������� �� ���������� �������� ���������������� ���������������',
    '����������� �������������� �������� � ���������������� ��������������� ',
    '������������� ������������� �������� ��� ������������ ��������',
    '�������-�������� ������������� �� ��������� ���������',
    {������� ������}
    '���� ������ ����� � ��������� ������� ���������',
    '���������� ������ � �������� � ��������� ���������'
  ];
  dictionaryTwo: TArray<string> = [
    {����������� �����}
    '����������� ����� �� 24.06.99 N 120-�� �� ������� ������� ������������ ��������������',
    '�� 14 � �� 20 �� ��',
    '�� 183, �� 187-190 ��� ��',
    '������ ���������� ��������� �� ���������������� ��������������� �� 30.12.2001 N 195-��',
    '�� 420 � 421 ��� ��',
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
  if Section = 0 then
    Result := dictionaryOne[Tag]
  else
    Result := dictionaryTwo[Tag];
end;

function LocalizationClass.GetDictionaryOne: TArray<string>;
begin
  Result := DictionaryOne;
end;

function LocalizationClass.GetDictionaryTwo: TArray<string>;
begin
  Result := DictionaryTwo;
end;

end.
