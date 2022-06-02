object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 500
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 500
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object UsersPanel: TPanel
      Left = 200
      Top = 0
      Width = 600
      Height = 500
      ParentBackground = False
      TabOrder = 0
      object UserInfoItem: TPanel
        Left = 0
        Top = 0
        Width = 600
        Height = 80
        TabOrder = 0
        object UserName: TLabel
          Left = 20
          Top = 20
          Width = 269
          Height = 50
          AutoSize = False
          Caption = 'Admin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DeleteUser: TButton
          Left = 490
          Top = 28
          Width = 100
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Button1: TButton
      Left = 0
      Top = 8
      Width = 194
      Height = 41
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object SourceGrid: TDBGrid
    Left = 20
    Top = 96
    Width = 81
    Height = 41
    DataSource = DS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Visible = False
  end
  object DBConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Stall\Docu' +
      'ments\Embarcadero\Studio\Projects\Win32\Debug\tables\Users.mdb;P' +
      'ersist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 496
    Top = 272
  end
  object DS: TDataSource
    DataSet = SelectQuery
    Left = 672
    Top = 208
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
end
