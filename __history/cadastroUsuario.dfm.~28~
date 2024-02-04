object CadastroUsuarioForm: TCadastroUsuarioForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro Usu'#225'rio'
  ClientHeight = 528
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 770
    Height = 528
    ActivePage = UsuarioFuncaoTab
    Align = alClient
    TabOrder = 0
    object UsuarioListaTab: TTabSheet
      Caption = 'Lista'
      object FiltrosLabel: TLabel
        Left = 3
        Top = 3
        Width = 32
        Height = 15
        Caption = 'Filtros'
      end
      object UsuarioGrid: TDBGrid
        Left = 3
        Top = 104
        Width = 755
        Height = 357
        DataSource = UsuarioDataSource
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDUSUARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERMISSAO'
            Width = 94
            Visible = True
          end>
      end
      object NomeFiltroEdit: TLabeledEdit
        Left = 39
        Top = 27
        Width = 300
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        TabOrder = 1
        Text = ''
      end
      object PermissaoFiltroRadio: TRadioGroup
        Left = 39
        Top = 56
        Width = 413
        Height = 42
        Caption = 'Permiss'#227'o'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Colaborador'
          'Fornecedor'
          'RH/Financeiro')
        TabOrder = 2
      end
      object AtivoFiltroCheckBox: TCheckBox
        Left = 368
        Top = 33
        Width = 97
        Height = 17
        Caption = 'Ativo'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object NovoButton: TButton
        Left = 3
        Top = 467
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 4
        OnClick = NovoButtonClick
      end
      object EditarButton: TButton
        Left = 100
        Top = 467
        Width = 75
        Height = 25
        ParentCustomHint = False
        Caption = 'Editar'
        TabOrder = 5
        OnClick = EditarButtonClick
      end
      object FiltrarButton: TButton
        Left = 480
        Top = 73
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 6
        OnClick = FiltrarButtonClick
      end
    end
    object UsuarioFuncaoTab: TTabSheet
      Caption = 'Funcao'
      ImageIndex = 1
      object Label1: TLabel
        Left = 3
        Top = 19
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 328
        Top = 19
        Width = 32
        Height = 15
        Caption = 'Senha'
      end
      object VoltarButton: TButton
        Left = 3
        Top = 467
        Width = 75
        Height = 25
        Caption = 'Voltar'
        TabOrder = 4
        OnClick = VoltarButtonClick
      end
      object GravarButton: TButton
        Left = 84
        Top = 467
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 5
        OnClick = VoltarButtonClick
      end
      object NomeFuncaoEdit: TDBEdit
        Left = 3
        Top = 40
        Width = 300
        Height = 23
        DataField = 'NOME'
        DataSource = UsuarioDataSource
        TabOrder = 0
      end
      object PermissaoFuncaoRadio: TDBRadioGroup
        Left = 3
        Top = 69
        Width = 413
        Height = 42
        Caption = 'PermissaoFuncaoRadio'
        Columns = 3
        DataField = 'PERMISSAO'
        DataSource = UsuarioDataSource
        Items.Strings = (
          'Colaborador'
          'Fornecedor'
          'RH/Financeiro')
        TabOrder = 2
        Values.Strings = (
          'C'
          'F'
          'R')
      end
      object AtivoFuncaoCheck: TDBCheckBox
        Left = 3
        Top = 117
        Width = 97
        Height = 17
        Caption = 'Ativo'
        DataField = 'ATIVO'
        DataSource = UsuarioDataSource
        TabOrder = 3
      end
      object SenhaFuncaoEdit: TDBEdit
        Left = 328
        Top = 40
        Width = 145
        Height = 23
        DataField = 'SENHA'
        DataSource = UsuarioDataSource
        PasswordChar = '*'
        TabOrder = 1
      end
    end
  end
  object UsuarioDataSource: TDataSource
    DataSet = UsuarioDataTable
    Left = 672
    Top = 40
  end
  object UsuarioDataTable: TADOTable
    TableName = 'Usuario'
    Left = 568
    Top = 40
  end
end
