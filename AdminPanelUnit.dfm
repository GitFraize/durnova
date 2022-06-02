object AdminPanel: TAdminPanel
  Left = 0
  Top = 0
  Width = 902
  Height = 617
  AutoScroll = True
  Caption = #1055#1072#1085#1077#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object Label2: TLabel
    Left = 24
    Top = 37
    Width = 44
    Height = 21
    Caption = #1051#1086#1075#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object AddNewUserForm: TGroupBox
    Left = 617
    Top = 24
    Width = 250
    Height = 329
    Caption = #1053#1086#1074#1099#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object LoginLabel: TLabel
      Left = 16
      Top = 29
      Width = 44
      Height = 21
      Caption = #1051#1086#1075#1080#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object PasswordLabel: TLabel
      Left = 16
      Top = 102
      Width = 53
      Height = 21
      Caption = #1055#1072#1088#1086#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object AccessLevelLabel: TLabel
      Left = 16
      Top = 181
      Width = 121
      Height = 21
      Caption = #1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object AddNewUser: TButton
      Left = 15
      Top = 275
      Width = 220
      Height = 40
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = AddNewUserClick
    end
    object LoginField: TEdit
      Left = 15
      Top = 56
      Width = 220
      Height = 40
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object PasswordField: TEdit
      Left = 15
      Top = 128
      Width = 220
      Height = 40
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = #7
      TabOrder = 2
    end
    object AccessLevelSelect: TComboBox
      Left = 15
      Top = 208
      Width = 220
      Height = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      Items.Strings = (
        #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088)
    end
  end
  object SourceGrid: TDBGrid
    Left = 0
    Top = -7
    Width = 600
    Height = 577
    BorderStyle = bsNone
    DataSource = DS
    FixedColor = clHighlightText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Calibri'
    TitleFont.Style = [fsBold]
    OnCellClick = SourceGridCellClick
  end
  object DeleteSelected: TButton
    Left = 632
    Top = 366
    Width = 220
    Height = 40
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = DeleteSelectedClick
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
  object SelectQuery: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Table_3')
    Left = 448
    Top = 288
  end
  object DS: TDataSource
    DataSet = SelectQuery
    Left = 488
    Top = 192
  end
  object InsertQuery: TADOQuery
    AutoCalcFields = False
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Table_3')
    Left = 480
    Top = 368
  end
  object EmptySource: TDataSource
    DataSet = InsertQuery
    Left = 520
    Top = 264
  end
end
