object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1043#1083#1072#1074#1085#1072#1103
  ClientHeight = 450
  ClientWidth = 812
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object MainTabControl: TTabControl
    Left = 0
    Top = 0
    Width = 809
    Height = 450
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMedGray
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    Tabs.Strings = (
      #1044#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1087#1086' '#1086#1090#1085#1086#1096#1077#1085#1080#1102' '#1082
      #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080)
    TabIndex = 0
    TabWidth = 250
    OnChange = MainTabControlChange
    object LeftGroupBox: TGroupBox
      Left = 0
      Top = 40
      Width = 153
      Height = 385
      Caption = #1053#1077#1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1083#1077#1090#1085#1080#1084
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object RightGroupBox: TGroupBox
      Left = 159
      Top = 40
      Width = 69
      Height = 385
      Caption = 'C'#1077#1084#1100#1103#1084
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object LeftManuals: TGroupBox
      Tag = 1
      Left = 234
      Top = 40
      Width = 209
      Height = 385
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1072#1103' '#1087#1088#1072#1074#1086#1074#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object RightManuals: TGroupBox
      Tag = 1
      Left = 449
      Top = 40
      Width = 360
      Height = 385
      Caption = #1055#1088#1086#1087#1072#1075#1072#1085#1076#1072' '#1087#1088#1072#1074#1086#1074#1099#1093' '#1080' '#1087#1089#1080#1093#1086#1083#1086#1075#1086'-'#1087#1077#1076#1072#1075#1086#1075#1080#1095#1077#1089#1082#1080#1093' '#1079#1085#1072#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
  end
end
