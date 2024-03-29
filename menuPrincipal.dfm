object MenuPrincipalForm: TMenuPrincipalForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Menu'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 184
    Top = 208
    object AdministradorMenuItem: TMenuItem
      Caption = 'Administrador'
      Visible = False
      object UsuariosMenuItem: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = UsuariosMenuItemClick
      end
    end
    object FornecedorMenuItem: TMenuItem
      Caption = 'Fornecedor'
      Visible = False
      object Pedidos1: TMenuItem
        Caption = 'Pedidos Recebidos'
        OnClick = Pedidos1Click
      end
      object ItemMenuItem: TMenuItem
        Caption = 'Itens'
        OnClick = ItemMenuItemClick
      end
    end
    object FinanceiroMenuItem: TMenuItem
      Caption = 'Financeiro'
      Visible = False
      object RelatrioMensal1: TMenuItem
        Caption = 'Relat'#243'rio Mensal'
        OnClick = RelatrioMensal1Click
      end
    end
    object ColaboradorMenuItem: TMenuItem
      Caption = 'Colaborador'
      Visible = False
      object FazerPedido1: TMenuItem
        Caption = 'Fazer Pedido'
        OnClick = FazerPedido1Click
      end
    end
  end
  object VerificaPedidoQuery: TADOQuery
    Parameters = <
      item
        Name = 'idcolaborador'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'iddata'
        DataType = ftDateTime
        Value = Null
      end>
    SQL.Strings = (
      'select idpedido from pedido'
      'where idcolaborador = :idcolaborador'
      'and     data = :iddata')
    Left = 264
    Top = 208
  end
end
