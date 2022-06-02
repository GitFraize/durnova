object AuthorizationScreen: TAuthorizationScreen
  Left = 715
  Top = 415
  Align = alCustom
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 289
  ClientWidth = 500
  Color = clBtnFace
  Constraints.MaxHeight = 328
  Constraints.MaxWidth = 516
  Constraints.MinHeight = 328
  Constraints.MinWidth = 516
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  TextHeight = 15
  object LoginCommonPanel: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 289
    BevelEdges = []
    TabOrder = 0
    StyleElements = [seFont, seClient]
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
    object AdminPanelButton: TLabel
      Left = 45
      Top = 248
      Width = 405
      Height = 28
      Cursor = crHandPoint
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1072#1085#1077#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = AdminPanelButtonClick
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
    object AuthorizeButton: TButton
      Left = 270
      Top = 202
      Width = 180
      Height = 40
      Caption = #1042#1086#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = AuthorizeButtonClick
    end
    object LoginEdit: TEdit
      Left = 50
      Top = 54
      Width = 400
      Height = 38
      Align = alCustom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object PasswordEdit: TEdit
      Left = 50
      Top = 140
      Width = 400
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = #7
      TabOrder = 2
    end
  end
  object AdminLoginPanel: TPanel
    Left = 500
    Top = 0
    Width = 500
    Height = 289
    BevelEdges = []
    TabOrder = 1
    StyleElements = [seFont, seClient]
    object Label2: TLabel
      Left = 45
      Top = 20
      Width = 400
      Height = 30
      AutoSize = False
      Caption = #1051#1086#1075#1080#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object BackToCommonLogin: TLabel
      Left = 45
      Top = 248
      Width = 405
      Height = 28
      Cursor = crHandPoint
      Alignment = taCenter
      AutoSize = False
      Caption = #1042#1086#1081#1090#1080' '#1082#1072#1082' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = BackToCommonLoginClick
    end
    object Label4: TLabel
      Left = 45
      Top = 104
      Width = 400
      Height = 30
      AutoSize = False
      Caption = #1055#1072#1088#1086#1083#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object AdminLogin: TButton
      Left = 270
      Top = 202
      Width = 180
      Height = 40
      Caption = #1042#1086#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = AdminLoginClick
    end
    object AdminLoginEdit: TEdit
      Left = 50
      Top = 54
      Width = 400
      Height = 38
      Align = alCustom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object AdminPassword: TEdit
      Left = 50
      Top = 140
      Width = 400
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = #7
      TabOrder = 2
    end
  end
  object SourceGrid: TDBGrid
    Left = 8
    Top = 184
    Width = 137
    Height = 73
    DataSource = DS
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Visible = False
  end
  object AnimationTimer: TTimer
    Enabled = False
    Interval = 1
    Left = 456
    Top = 240
  end
  object SelectQuery: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Table_3')
    Left = 632
    Top = 304
  end
  object DS: TDataSource
    DataSet = SelectQuery
    Left = 672
    Top = 208
  end
  object DBConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Stall\Docu' +
      'ments\Embarcadero\Studio\Projects\Win32\Debug\tables\Users.mdb;P' +
      'ersist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 408
    Top = 192
  end
end
