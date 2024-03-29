unit cadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Data.Win.ADODB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask,dataModule, Vcl.DBCtrls;

type
  TCadastroUsuarioForm = class(TForm)
    UsuarioDataSource: TDataSource;
    UsuarioDataTable: TADOTable;
    PageControl: TPageControl;
    UsuarioListaTab: TTabSheet;
    UsuarioFuncaoTab: TTabSheet;
    UsuarioGrid: TDBGrid;
    FiltrosLabel: TLabel;
    NomeFiltroEdit: TLabeledEdit;
    PermissaoFiltroRadio: TRadioGroup;
    AtivoFiltroCheckBox: TCheckBox;
    NovoButton: TButton;
    EditarButton: TButton;
    FiltrarButton: TButton;
    VoltarButton: TButton;
    GravarButton: TButton;
    NomeFuncaoEdit: TDBEdit;
    PermissaoFuncaoRadio: TDBRadioGroup;
    Label1: TLabel;
    AtivoFuncaoCheck: TDBCheckBox;
    Label2: TLabel;
    SenhaFuncaoEdit: TDBEdit;
    procedure FiltrarButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NovoButtonClick(Sender: TObject);
    procedure VoltarButtonClick(Sender: TObject);
    procedure EditarButtonClick(Sender: TObject);
    procedure GravarButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    DataModule : TdataModuleForm;
    procedure AlterarTab;
  public
    { Public declarations }
  end;

var
  CadastroUsuarioForm: TCadastroUsuarioForm;


implementation

{$R *.dfm}


procedure TCadastroUsuarioForm.AlterarTab;
begin

 if PageControl.ActivePage = UsuarioListaTab then
   PageControl.ActivePage := UsuarioFuncaoTab
 else
   PageControl.ActivePage := UsuarioListaTab;

  PageControl.Pages[0].TabVisible := not PageControl.Pages[0].TabVisible;
  PageControl.Pages[1].TabVisible := not PageControl.Pages[1].TabVisible;
end;


procedure TCadastroUsuarioForm.FiltrarButtonClick(Sender: TObject);
var Filtro : String;
begin

  if not AtivoFiltroCheckBox.Checked then
    Filtro := 'Ativo = 0'
  else
    Filtro := 'Ativo = 1';

  case PermissaoFiltroRadio.ItemIndex of
    0: Filtro := Filtro + ' and Permissao = ' + QuotedStr('C');
    1: Filtro := Filtro + ' and Permissao = ' + QuotedStr('F');
    2: Filtro := Filtro + ' and Permissao = ' + QuotedStr('R');
  end;

  if NomeFiltroEdit.Text <> '' then
    Filtro := Filtro + ' and nome = ' + QuotedStr(NomeFiltroEdit.Text);

  UsuarioDataTable.Filter := Filtro;
  UsuarioDataTable.Filtered := True;
end;

procedure TCadastroUsuarioForm.FormCreate(Sender: TObject);
begin

  PageControl.Pages[0].TabVisible := True;
  PageControl.Pages[1].TabVisible := False;

  DataModule := TDataModuleForm.Create(self);
  UsuarioDataTable.Connection := DataModule.DatabaseConnection;
  FiltrarButtonClick(self);
  UsuarioDataTable.Active := True;
end;

procedure TCadastroUsuarioForm.FormDestroy(Sender: TObject);
begin
 DataModule.Free;
end;

procedure TCadastroUsuarioForm.GravarButtonClick(Sender: TObject);
begin
 UsuarioDataTable.Post;
 AlterarTab;
end;

procedure TCadastroUsuarioForm.NovoButtonClick(Sender: TObject);
begin
  AlterarTab;
  UsuarioDataTable.Insert;
  UsuarioDataTable.FieldByName('ativo').AsBoolean := True;
  UsuarioDataTable.FieldByName('permissao').AsString := 'C';
end;

procedure TCadastroUsuarioForm.VoltarButtonClick(Sender: TObject);
begin
  UsuarioDataTable.Cancel;
  UsuarioDataTable.First;
  AlterarTab;
end;

procedure TCadastroUsuarioForm.EditarButtonClick(Sender: TObject);
begin
  AlterarTab;
  UsuarioDataTable.Edit;
end;

end.
