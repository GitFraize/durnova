unit Localization;
interface
  uses
    System.Generics.Collections, SysUtils;
  type
    SectionType = 0..3;
    LocalizationClass = class
      public
        function GetLinkTitle(index: integer): string;
        function GetLinkUrl(index: integer): string;
        function GetCaption(section: SectionType; Tag: integer): string;
        function GetTableCaption(Tag: integer): string;
        function GetLeftTables(): TArray<string>;
        function GetRightTables(): TArray<string>;
        function GetRightManuals(): TArray<string>;
        constructor Create;
    end;
implementation
var
  leftTables: TArray<string> = [
    {Таблицы слева}
    'Употребляющие наркотические средства или психотропные вещества',
    'Совершившие правонарушение повлекшее к административной ответственности',
    'Совершившие правонарушение до достижения возраста административной ответственности',
    'Cовершившие опасные деяния и не подлежащие уголовной ответственности ',
    'Условно-досрочно освобожденные от отбывания наказания',
    'Освобожденные из учреждений уголовно-исправительной системы'
  ];

  rightTables: TArray<string> = [
    {Таблицы справа}
    'Проблемные родители (опекуны) несовершеннолетнего',
    'Семьи находящиеся в социально опасном положении'
  ];

  rightManuals: TArray<string> = [
    {Справочники справа}
    'Справочное пособие для инспектора ПДН',
    'Тематика бесед с родителями или опекунами несовершеннолетнего',
    'Тематика бесед с учащимися   инспектора ПДН'
  ];

{ LocalizationClass }
constructor LocalizationClass.Create;
begin
end;

function LocalizationClass.GetLinkUrl(index: Integer): string;
begin
  case index of
      0: Result := 'http://www.consultant.ru/document/cons_doc_law_34661/';
      1: Result := 'http://www.consultant.ru/document/Cons_doc_law_8982/';
      2: Result := 'http://www.consultant.ru/document/cons_doc_law_10699/';
      3: Result := 'http://www.consultant.ru/document/cons_doc_LAW_34481/';
      4: Result := 'https://base.garant.ru/12116087/';
      5: Result := 'http://www.consultant.ru/document/cons_doc_LAW_110165/';
      6: Result := 'https://base.garant.ru/70585810/';
    end;
end;

function LocalizationClass.GetLinkTitle(index: Integer): string;
begin
  case index of
      0: Result := '"Кодекс Российской Федерации об административных правонарушениях" от 30.12.2001 N 195-ФЗ';
      1: Result := '"Семейный кодекс Российской Федерации" от 29.12.1995 N 223-ФЗ';
      2: Result := '"Уголовный кодекс Российской Федерации" от 13.06.1996 N 63-ФЗ';
      3: Result := '"Уголовно-процессуальный кодекс Российской Федерации" от 18.12.2001 N 174-ФЗ';
      4: Result := 'Федеральный закон от 24 июня 1999 г. N 120-ФЗ "Об основах системы профилактики безнадзорности и правонарушений несовершеннолетних"';
      5: Result := 'Федеральный закон "О полиции" от 07.02.2011 N 3-ФЗ';
      6: Result := 'Приказ МВД России от 15 октября 2013 г. N 845 "Об утверждении Инструкции по организации деятельности подразделений по делам несовершеннолетних органов внутренних дел Российской Федерации"';
    end;
end;

function LocalizationClass.GetCaption(Section: SectionType; Tag: integer): string;
begin
  case Section of
    0: Result := leftTables[Tag];
    1: Result := rightTables[Tag];
    2: Result := '';
    3: Result := rightManuals[Tag];
  end;
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

function LocalizationClass.GetTableCaption(Tag: integer): string;
begin
  if Tag > 0 then begin
    if Tag <= Length(leftTables) then
      Result := leftTables[Tag-1]
    else
      Result := rightTables[Tag-1-Length(leftTables)];
  end else
    Result := 'Таблица №'+IntToStr(Tag);
end;

end.
