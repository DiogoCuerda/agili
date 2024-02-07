unit menuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,cadastroUsuario,
  cadastroItem,fazerPedido, Data.DB, Data.Win.ADODB,dataModule,listaPedidos,relatorioMensal;

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
    VerificaPedidoQuery: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure UsuariosMenuItemClick(Sender: TObject);
    procedure ItemMenuItemClick(Sender: TObject);
    procedure FazerPedido1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure RelatrioMensal1Click(Sender: TObject);

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
var DataModule  : TDataModuleForm;
begin

   DataModule := TDataModuleForm.Create(self);

   With VerificaPedidoQuery do
   begin
     Connection := DataModule.DatabaseConnection;
     Parameters.ParamByName('idcolaborador').value := IdUsuario;
     Parameters.ParamByName('iddata').value := Date;
     Active := True;
     Open;

     if Eof then
     begin
        try
          FazerPedido := TFazerPedidoForm.CreateCustom(Self,IdUsuario);
          FazerPedido.ShowModal;

        finally
          FazerPedido.Free;
        end;

     end
     else
       ShowMessage('Usuário já fez pedido hoje, não é mais possível pedir.');

     close;

   end;
    DataModule.Free;
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
    'R':
      FinanceiroMenuItem.Visible    := True;

  end;
end;

procedure TMenuPrincipalForm.ItemMenuItemClick(Sender: TObject);
var CadastroItem : TCadastroItemForm;
begin

        try
          CadastroItem := TCadastroItemForm.CreateCustom(Self,IdUsuario);
          CadastroItem.ShowModal;

        finally
          CadastroItem.Free;
        end;

end;

procedure TMenuPrincipalForm.Pedidos1Click(Sender: TObject);
var ListaPedido: TListaPedidoForm;
begin
     try
        ListaPedido := TListaPedidoForm.CreateCustom(Self,IdUsuario);
        ListaPedido.ShowModal;

     finally
        ListaPedido.Free;
     end;

end;

procedure TMenuPrincipalForm.RelatrioMensal1Click(Sender: TObject);
var RelatorioMensal : TRelatorioMensalForm;
begin

     try
        RelatorioMensal := TRelatorioMensalForm.Create(Self);
        RelatorioMensal.ShowModal;

     finally
        RelatorioMensal.Free;
     end;

end;



procedure TMenuPrincipalForm.UsuariosMenuItemClick(Sender: TObject);
var CadastroUsuario : TCadastroUsuarioForm;
begin
    try
        CadastroUsuario := TCadastroUsuarioForm.Create(Self);
        CadastroUsuario.ShowModal;

     finally
        CadastroUsuario.Free;
     end;
end;

end.
