unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB,menuPrincipal,dataModule;

type
  TLoginForm = class(TForm)
    NomeEdit: TLabeledEdit;
    SenhaEdit: TLabeledEdit;
    ButtonLogin: TButton;
    ButtonCancelar: TButton;
    LoginQuery: TADOQuery;
    procedure ButtonLoginClick(Sender: TObject);
    procedure NomeEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);

  private
     DataModule : TDataModuleForm;
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;


implementation

{$R *.dfm}


procedure TLoginForm.ButtonCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TLoginForm.ButtonLoginClick(Sender: TObject);
var
 MenuPrincipal: TMenuPrincipalForm;
begin
  with LoginQuery do
  begin
    Close;
    Parameters.ParamByName('idusuario').Value  := UpperCase(NomeEdit.Text);
    Parameters.ParamByName('senha').Value      := SenhaEdit.Text;
    Open;

    if not eof then
    begin


      try
        MenuPrincipal := TMenuPrincipalForm
                         .CreateCustom(Self,FieldByName('permissao').AsString[1],
                                       FieldByName('idusuario').AsInteger);
        Self.Hide;
        MenuPrincipal.ShowModal;

      finally
        MenuPrincipal.Free;
        Self.Close;
        Application.Terminate;
      end;


    end
    else
    begin
      ShowMessage('Usuario ou senha Incorretos!!');
    end;

  end;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
    DataModule := TdataModuleForm.Create(self);
    DataModule.DatabaseConnection.Connected := True;
    LoginQuery.Connection := DataModule.DatabaseConnection;

end;

procedure TLoginForm.NomeEditKeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in ['0'..'9', #8, #9, #13, #27, #127]) then
      key := #0;

end;

end.
