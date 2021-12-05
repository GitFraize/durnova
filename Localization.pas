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
    {Таблицы слева}
    'Освобожденные из учреждений уголовно-исправительной системы',
    'Совершившие опасные деяния и не подлежащие уголовной ответственности',
    'Совершившие правонарушения до достижения возраста административной ответственности',
    'Совершившие правонарушение повлёкшее к административной ответственности ',
    'Употреблявшие наркотические средства или психотропные вещества',
    'Условно-досрочно освобожденные от отбывания наказания'
  ];
  rightTables: TArray<string> = [
    {Таблицы справа}
    'Банк данных семей в социально опасном положении',
    'Профильные работы и контроль в отношении родителей'
  ];
  leftManuals: TArray<string> = [
    {Справочники слева}
    'Федеральный закон от 24.06.99 N 120-ФЗ Об основах системы профилактики безнадзорности',
    'ГЛ 14 и ГЛ 20 УК РФ',
    'ст 183, ст 187-190 уик рф',
    'Кодекс Российской Федерации об административных правонарушениях от 30.12.2001 N 195-ФЗ',
    'СТ 420 И 421 УПУ РФ'
  ];
  rightManuals: TArray<string> = [
    {Справочники справа}
    'Методические пособия для инспектора ПДН',
    'Тематика бесед с родителями или опекунами несовершеннолетнего',
    'Тематика бесед с учащимися   инспектора ПДН'
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
