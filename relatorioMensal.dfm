object RelatorioMensalForm: TRelatorioMensalForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Mensal'
  ClientHeight = 410
  ClientWidth = 610
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
    Top = 35
    Width = 58
    Height = 15
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 120
    Top = 35
    Width = 52
    Height = 15
    Caption = 'Data Final'
  end
  object Label3: TLabel
    Left = 224
    Top = 35
    Width = 66
    Height = 15
    Caption = 'Colaborador'
  end
  object ExportarButton: TButton
    Left = 8
    Top = 273
    Width = 97
    Height = 25
    Caption = 'Exportar CSV'
    Enabled = False
    TabOrder = 0
    OnClick = ExportarButtonClick
  end
  object DataInicialEdit: TDateTimePicker
    Left = 8
    Top = 56
    Width = 97
    Height = 23
    Date = 45326.000000000000000000
    Time = 0.685095532404375300
    TabOrder = 1
  end
  object ListaPedidosGrid: TDBGrid
    Left = 8
    Top = 85
    Width = 513
    Height = 182
    DataSource = ListaPedidoDataSource
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Visible = True
      end>
  end
  object DataFinalEdit: TDateTimePicker
    Left = 120
    Top = 56
    Width = 97
    Height = 23
    Date = 45326.000000000000000000
    Time = 0.685095532404375300
    TabOrder = 3
  end
  object FiltrarButton: TButton
    Left = 375
    Top = 54
    Width = 146
    Height = 25
    Caption = 'Filtrar Relat'#243'rio'
    TabOrder = 4
    OnClick = FiltrarButtonClick
  end
  object ColaboradorComboBox: TDBLookupComboBox
    Left = 223
    Top = 56
    Width = 145
    Height = 23
    KeyField = 'idusuario'
    ListField = 'nome'
    ListSource = ClienteDataSource
    TabOrder = 5
  end
  object ListaPedidoQuery: TADOQuery
    Parameters = <
      item
        Name = 'datainicial'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'datafinal'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'idcolaborador'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select Pedido.Data,'
      '       Item.Descricao,'
      '       PedidoItem.Preco,'
      '       PedidoItem.Quantidade, '
      #9'   PedidoItem.Preco*PedidoItem.Quantidade as total '
      #9'   from PedidoItem'
      'inner join Pedido on Pedido.IdPedido = PedidoItem.IdPedido'
      'inner join Item   on Item.IdItem     = PedidoItem.IdItem'
      'where Pedido.data between :datainicial and :datafinal'
      'and   Pedido.IdColaborador = :idcolaborador')
    Left = 416
    Top = 296
    object ListaPedidoQuerydata: TDateField
      FieldName = 'data'
    end
    object ListaPedidoQuerydescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object ListaPedidoQuerypreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '#0.00'
    end
    object ListaPedidoQueryquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object ListaPedidoQuerytotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '#0.00'
    end
  end
  object ListaPedidoDataSource: TDataSource
    DataSet = ListaPedidoQuery
    Left = 512
    Top = 296
  end
  object ClienteQuery: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select idusuario, nome from usuario'
      'where permissao = '#39'C'#39
      'and     ativo = 1'
      'order by nome')
    Left = 283
    Top = 304
  end
  object ClienteDataSource: TDataSource
    DataSet = ClienteQuery
    Left = 180
    Top = 312
  end
end
