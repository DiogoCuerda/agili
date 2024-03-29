object FazerPedidoForm: TFazerPedidoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fazer Pedido'
  ClientHeight = 454
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 80
    Width = 88
    Height = 15
    Caption = 'Itens Dispon'#237'veis'
  end
  object Label2: TLabel
    Left = 8
    Top = 256
    Width = 94
    Height = 15
    Caption = 'Itens Adicionados'
  end
  object DataLabel: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 25
    Caption = 'DATA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelTotal: TLabel
    Left = 247
    Top = 421
    Width = 88
    Height = 25
    Caption = 'Total : 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object FornecedorComboBox: TDBLookupComboBox
    Left = 8
    Top = 40
    Width = 145
    Height = 23
    KeyField = 'IdUsuario'
    ListField = 'Nome'
    ListSource = FornecedorDataSource
    TabOrder = 0
  end
  object DisponiveisGrid: TDBGrid
    Left = 8
    Top = 112
    Width = 353
    Height = 120
    DataSource = DisponiveisDataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end>
  end
  object AdicionarButton: TButton
    Left = 384
    Top = 112
    Width = 97
    Height = 25
    Caption = 'Adicionar Item'
    Enabled = False
    TabOrder = 2
    OnClick = AdicionarButtonClick
  end
  object AdicionadosGrid: TDBGrid
    Left = 8
    Top = 295
    Width = 353
    Height = 120
    DataSource = AdicionadosDataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end>
  end
  object RemoverButton: TButton
    Left = 384
    Top = 295
    Width = 97
    Height = 25
    Caption = 'Remover Item'
    Enabled = False
    TabOrder = 4
    OnClick = RemoverButtonClick
  end
  object EnviarButton: TButton
    Left = 8
    Top = 421
    Width = 94
    Height = 25
    Caption = 'Enviar Pedido'
    Enabled = False
    TabOrder = 5
    OnClick = EnviarButtonClick
  end
  object SelecionaButton: TButton
    Left = 159
    Top = 38
    Width = 146
    Height = 25
    Caption = 'Selecionar Fornecedor'
    TabOrder = 6
    OnClick = SelecionaButtonClick
  end
  object FornecedorDataSource: TDataSource
    DataSet = FornecedorQuery
    Left = 484
    Top = 8
  end
  object FornecedorQuery: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select idusuario, nome from usuario'
      'where permissao = '#39'F'#39
      'and     ativo = 1')
    Left = 568
    Top = 8
  end
  object DisponiveisDataSource: TDataSource
    DataSet = DisponiveisQuery
    Left = 488
    Top = 152
  end
  object DisponiveisQuery: TADOQuery
    Parameters = <
      item
        Name = 'idfornecedor'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select iditem,descricao,preco from item'
      'where ativo = 1'
      'and     idFornecedor = :idfornecedor')
    Left = 560
    Top = 152
  end
  object AdicionadosDataSource: TDataSource
    DataSet = AdicionadosDataSet
    Left = 560
    Top = 224
  end
  object AdicionadosDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Iditem'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Quantidade'
        DataType = ftInteger
      end
      item
        Name = 'Preco'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 224
  end
  object PedidoDataTable: TADOTable
    Left = 480
    Top = 352
  end
  object PedidoItemDataTable: TADOTable
    Left = 536
    Top = 352
  end
end
