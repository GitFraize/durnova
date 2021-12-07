object TableEditorForm: TTableEditorForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1072#1073#1083#1080#1094
  ClientHeight = 470
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  WindowState = wsMaximized
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 496
    Top = 8
    Width = 48
    Height = 13
    Caption = #1087#1086#1080#1089#1082' '#1087#1086':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 800
    Height = 415
    DataSource = DS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object MainNavigator: TDBNavigator
    Left = 5
    Top = 5
    Width = 240
    Height = 25
    DataSource = DS
    TabOrder = 1
  end
  object FindEdit: TEdit
    Left = 255
    Top = 5
    Width = 226
    Height = 25
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = FindEditChange
  end
  object SearchButton: TButton
    Left = 717
    Top = 4
    Width = 75
    Height = 25
    Caption = #1087#1086#1080#1089#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = SearchButtonClick
  end
  object ColumnBox: TComboBox
    Left = 544
    Top = 5
    Width = 167
    Height = 24
    AutoComplete = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Stall\Docu' +
      'ments\Embarcadero\Studio\Projects\Win32\Debug\tables\DB.mdb;Pers' +
      'ist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'MSDAORA'
    Left = 112
    Top = 160
  end
  object DS: TDataSource
    DataSet = SearchQuery
    OnDataChange = DataSourceChanged
    Left = 288
    Top = 96
  end
  object SearchQuery: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Table_3')
    Left = 248
    Top = 192
  end
end
