object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 309
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 25
  object NomeEdit: TLabeledEdit
    AlignWithMargins = True
    Left = 72
    Top = 53
    Width = 240
    Height = 33
    Alignment = taCenter
    EditLabel.Width = 18
    EditLabel.Height = 25
    EditLabel.Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 45
    ParentFont = False
    TabOrder = 0
    Text = ''
    OnKeyPress = NomeEditKeyPress
  end
  object SenhaEdit: TLabeledEdit
    AlignWithMargins = True
    Left = 72
    Top = 136
    Width = 240
    Height = 33
    Alignment = taCenter
    EditLabel.Width = 52
    EditLabel.Height = 25
    EditLabel.Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 45
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
  object ButtonLogin: TButton
    AlignWithMargins = True
    Left = 229
    Top = 191
    Width = 83
    Height = 49
    Caption = 'Login'
    TabOrder = 3
    OnClick = ButtonLoginClick
  end
  object ButtonCancelar: TButton
    AlignWithMargins = True
    Left = 72
    Top = 191
    Width = 83
    Height = 49
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = ButtonCancelarClick
  end
  object LoginQuery: TADOQuery
    Parameters = <
      item
        Name = 'idusuario'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'senha'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  permissao,idusuario from Usuario'
      'where IdUsuario  = :IdUsuario'
      'and   senha          = :senha'
      'and ativo = 1')
    Left = 8
    Top = 16
  end
end
