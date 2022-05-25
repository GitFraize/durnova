object AuthorizationScreen: TAuthorizationScreen
  Left = 715
  Top = 400
  Align = alClient
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 250
  ClientWidth = 500
  Color = clBtnFace
  Constraints.MaxHeight = 289
  Constraints.MaxWidth = 516
  Constraints.MinHeight = 289
  Constraints.MinWidth = 516
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Label1: TLabel
    Left = 45
    Top = 20
    Width = 400
    Height = 30
    AutoSize = False
    Caption = #1051#1086#1075#1080#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object PasswordLabel: TLabel
    Left = 45
    Top = 104
    Width = 400
    Height = 30
    AutoSize = False
    Caption = #1055#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LoginEdit: TEdit
    Left = 50
    Top = 54
    Width = 400
    Height = 44
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object PasswordEdit: TEdit
    Left = 50
    Top = 140
    Width = 400
    Height = 50
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    PasswordChar = #7
    TabOrder = 1
  end
  object AuthorizeButton: TButton
    Left = 270
    Top = 200
    Width = 180
    Height = 40
    Caption = #1042#1086#1081#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = AuthorizeButtonClick
  end
end
