program Project1;

uses
  Vcl.Forms,
  login in 'login.pas' {LoginForm},
  menuPrincipal in 'menuPrincipal.pas' {MenuPrincipalForm},
  cadastroUsuario in 'cadastroUsuario.pas' {CadastroUsuarioForm},
  dataModule in 'dataModule.pas' {DataModuleForm: TDataModule},
  cadastroItem in 'cadastroItem.pas' {CadastroItemForm},
  fazerPedido in 'fazerPedido.pas' {FazerPedidoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginForm, LoginForm);
  Application.Run;
end.