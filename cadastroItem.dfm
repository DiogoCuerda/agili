object CadastroItemForm: TCadastroItemForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cadastro Item'
  ClientHeight = 530
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 770
    Height = 530
    ActivePage = ItemFuncaoTab
    Align = alClient
    TabOrder = 0
    object ItemListaTab: TTabSheet
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
        DataSource = ItemDataSource
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
            FieldName = 'IDITEM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Title.Caption = 'PRE'#199'O'
            Width = 94
            Visible = True
          end>
      end
      object NomeFiltroEdit: TLabeledEdit
        Left = 3
        Top = 75
        Width = 300
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        TabOrder = 1
        Text = ''
      end
      object AtivoFiltroCheckBox: TCheckBox
        Left = 332
        Top = 81
        Width = 97
        Height = 17
        Caption = 'Ativo'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object NovoButton: TButton
        Left = 3
        Top = 467
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 3
        OnClick = NovoButtonClick
      end
      object EditarButton: TButton
        Left = 100
        Top = 467
        Width = 75
        Height = 25
        ParentCustomHint = False
        Caption = 'Editar'
        TabOrder = 4
        OnClick = EditarButtonClick
      end
      object FiltrarButton: TButton
        Left = 480
        Top = 73
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        TabOrder = 5
        OnClick = FiltrarButtonClick
      end
    end
    object ItemFuncaoTab: TTabSheet
      Caption = 'Funcao'
      ImageIndex = 1
      object Label1: TLabel
        Left = 3
        Top = 19
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 323
        Top = 19
        Width = 30
        Height = 15
        Caption = 'Pre'#231'o'
      end
      object VoltarButton: TButton
        Left = 3
        Top = 467
        Width = 75
        Height = 25
        Caption = 'Voltar'
        TabOrder = 3
        OnClick = VoltarButtonClick
      end
      object GravarButton: TButton
        Left = 84
        Top = 467
        Width = 75
        Height = 25
        Caption = 'Gravar'
        TabOrder = 4
        OnClick = GravarButtonClick
      end
      object DescricaoFuncaoEdit: TDBEdit
        Left = 3
        Top = 40
        Width = 300
        Height = 23
        DataField = 'DESCRICAO'
        DataSource = ItemDataSource
        TabOrder = 0
      end
      object AtivoFuncaoCheck: TDBCheckBox
        Left = 3
        Top = 69
        Width = 97
        Height = 17
        Caption = 'Ativo'
        DataField = 'ATIVO'
        DataSource = ItemDataSource
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 323
        Top = 40
        Width = 110
        Height = 23
        DataField = 'PRECO'
        DataSource = ItemDataSource
        TabOrder = 1
      end
    end
  end
  object ItemDataSource: TDataSource
    DataSet = ItemDataTable
    Left = 684
    Top = 120
  end
  object ItemDataTable: TADOTable
    TableName = 'Item'
    Left = 688
    Top = 40
  end
end
