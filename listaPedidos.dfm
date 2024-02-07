object ListaPedidoForm: TListaPedidoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos Recebidos'
  ClientHeight = 216
  ClientWidth = 579
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
  object LabelTotal: TLabel
    Left = 447
    Top = 179
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
  object DataPedidoEdit: TDateTimePicker
    Left = 8
    Top = 24
    Width = 97
    Height = 23
    Date = 45326.000000000000000000
    Time = 0.685095532404375300
    TabOrder = 0
    OnChange = DataPedidoEditChange
  end
  object ListaPedidosGrid: TDBGrid
    Left = 8
    Top = 53
    Width = 545
    Height = 120
    DataSource = ListaPedidoDataSource
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
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 182
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
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Visible = True
      end>
  end
  object ListaPedidoQuery: TADOQuery
    Parameters = <
      item
        Name = 'IdFornecedor'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'Data'
        DataType = ftDateTime
        Value = Null
      end>
    SQL.Strings = (
      'select Item.Descricao,PedidoItem.preco, '
      'SUM(PedidoItem.Quantidade) as Quantidade,'
      'SUM(PedidoItem.Quantidade*PedidoItem.Preco) as total  '
      'from PedidoItem'
      'inner join Pedido on Pedido.IdPedido = PedidoItem.IdPedido'
      'inner join Item   on Item.IdItem     = PedidoItem.IdItem'
      'where Pedido.IdFornecedor = :idfornecedor'
      'and   Pedido.Data         = :data  '
      'group by Item.Descricao,PedidoItem.preco')
    Left = 520
    Top = 8
    object ListaPedidoQuerypreco: TFloatField
      FieldName = 'preco'
      DisplayFormat = '#0.00'
    end
    object ListaPedidoQuerydescricao: TStringField
      FieldName = 'descricao'
      Size = 45
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
    Left = 392
    Top = 8
  end
end
