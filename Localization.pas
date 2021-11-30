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
    {Таблицы слева}
    'Освобожденные из учреждений уголовно-исправительной системы',
    'Совершившие опасные деяния и не подлежащие уголовной ответственности',
    'Совершившие правонарушения до достижения возраста административной ответственности',
    'Совершившие правонарушение повлёкшее к административной ответственности ',
    'Употреблявшие наркотические средства или психотропные вещества',
    'Условно-досрочно освобожденные от отбывания наказания',
    {Таблицы справа}
    'Банк данных семей в социально опасном положении',
    'Профильные работы и контроль в отношении родителей'
  ];
  dictionaryTwo: TArray<string> = [
    {Справочники слева}
    'Федеральный закон от 24.06.99 N 120-ФЗ Об основах системы профилактики безнадзорности',
    'ГЛ 14 и ГЛ 20 УК РФ',
    'ст 183, ст 187-190 уик рф',
    'Кодекс Российской Федерации об административных правонарушениях от 30.12.2001 N 195-ФЗ',
    'СТ 420 И 421 УПУ РФ',
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
