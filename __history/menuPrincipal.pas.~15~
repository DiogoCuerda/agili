unit menuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,cadastroUsuario,
  cadastroItem,fazerPedido;

type
  TMenuPrincipalForm = class(TForm)
    MainMenu1: TMainMenu;
    AdministradorMenuItem: TMenuItem;
    UsuariosMenuItem: TMenuItem;
    FornecedorMenuItem: TMenuItem;
    Pedidos1: TMenuItem;
    FinanceiroMenuItem: TMenuItem;
    RelatrioMensal1: TMenuItem;
    ColaboradorMenuItem: TMenuItem;
    FazerPedido1: TMenuItem;
    ItemMenuItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure UsuariosMenuItemClick(Sender: TObject);
    procedure ItemMenuItemClick(Sender: TObject);
    procedure FazerPedido1Click(Sender: TObject);

  private
    var
    Permissao: Char;
    IdUsuario: Integer;
  public
    constructor CreateCustom(AOwner: TComponent; APermissao:Char; AId:Integer);
  end;

var
  MenuPrincipalForm: TMenuPrincipalForm;

implementation

{$R *.dfm}



constructor  TMenuPrincipalForm.CreateCustom(AOwner: TComponent; APermissao: Char; AId:Integer);
begin
    inherited Create(AOwner);
    Permissao := APermissao;
    IdUsuario := AId;
end;




procedure TMenuPrincipalForm.FazerPedido1Click(Sender: TObject);
var FazerPedido : TFazerPedidoForm;
begin

   try
     FazerPedido := TFazerPedidoForm.Create(self);
     FazerPedido.ShowModal;
   finally
     FazerPedido.Close;
     FazerPedido.Destroy;
   end;
end;

procedure TMenuPrincipalForm.FormCreate(Sender: TObject);
begin
  case Permissao of
    'A':
      AdministradorMenuItem.Visible := True;
    'F':
      FornecedorMenuItem.Visible    := True;
    'C':
      ColaboradorMenuItem.Visible   := True;





  end;
end;

procedure TMenuPrincipalForm.ItemMenuItemClick(Sender: TObject);
var CadastroItem : TCadastroItemForm;
begin

    try
      CadastroItem := TCadastroItemForm.CreateCustom(self,IdUsuario);
      CadastroItem.ShowModal;
    finally
      CadastroItem.Close;
      Cadastroitem.Destroy;

    end;

end;

procedure TMenuPrincipalForm.UsuariosMenuItemClick(Sender: TObject);
var CadastroUsuario : TCadastroUsuarioForm;
begin
     try
        CadastroUsuario := TCadastroUsuarioForm.Create(self);
        CadastroUsuario.ShowModal;

     finally
        CadastroUsuario.Close;
        CadastroUsuario.Destroy;

      end;
end;

end.
