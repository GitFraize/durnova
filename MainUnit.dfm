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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 13
  object MainTabControl: TTabControl
    Left = 8
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
      #1041#1072#1085#1082' '#1076#1072#1085#1085#1099#1093
      #1057#1087#1088#1072#1074#1086#1095#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103)
    TabIndex = 0
    TabWidth = 250
    OnChange = MainTabControlChange
    object LeftGroupBox: TGroupBox
      Left = 0
      Top = 40
      Width = 153
      Height = 385
      Caption = #1059#1095#1105#1090' '#1085#1077#1089#1086#1074#1077#1088#1096#1077#1085#1085#1086#1083#1077#1090#1085#1080#1093' '#1085#1072#1088#1091#1096#1080#1090#1077#1083#1077#1081
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
      Caption = #1059#1095#1105#1090' '#1085#1077#1073#1083#1072#1075#1086#1087#1086#1083#1091#1095#1085#1099#1093' '#1089#1077#1084#1077#1081
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
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1086'-'#1087#1088#1072#1074#1086#1074#1099#1077' '#1072#1082#1090#1099
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
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
      Caption = #1052#1077#1090#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1086#1089#1086#1073#1080#1103
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
