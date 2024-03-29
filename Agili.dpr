program Agili;

uses
  Vcl.Forms,
  login in 'login.pas' {LoginForm},
  menuPrincipal in 'menuPrincipal.pas' {MenuPrincipalForm},
  cadastroUsuario in 'cadastroUsuario.pas' {CadastroUsuarioForm},
  dataModule in 'dataModule.pas' {DataModuleForm: TDataModule},
  cadastroItem in 'cadastroItem.pas' {CadastroItemForm},
  fazerPedido in 'fazerPedido.pas' {FazerPedidoForm},
  listaPedidos in 'listaPedidos.pas' {ListaPedidoForm},
  relatorioMensal in 'relatorioMensal.pas' {RelatorioMensalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.Run;
end.
