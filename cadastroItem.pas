unit cadastroItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Data.Win.ADODB,dataModule;

type
  TCadastroItemForm = class(TForm)
    ItemDataSource: TDataSource;
    PageControl: TPageControl;
    ItemListaTab: TTabSheet;
    FiltrosLabel: TLabel;
    UsuarioGrid: TDBGrid;
    NomeFiltroEdit: TLabeledEdit;
    AtivoFiltroCheckBox: TCheckBox;
    NovoButton: TButton;
    EditarButton: TButton;
    FiltrarButton: TButton;
    ItemFuncaoTab: TTabSheet;
    Label1: TLabel;
    VoltarButton: TButton;
    GravarButton: TButton;
    DescricaoFuncaoEdit: TDBEdit;
    AtivoFuncaoCheck: TDBCheckBox;
    ItemDataTable: TADOTable;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FiltrarButtonClick(Sender: TObject);
    procedure NovoButtonClick(Sender: TObject);
    procedure GravarButtonClick(Sender: TObject);
    procedure EditarButtonClick(Sender: TObject);
    procedure VoltarButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    var IdFornecedor:Integer;
    DataModule : TdataModuleForm;
    procedure AlterarTab;
  public
    constructor CreateCustom(AOwner: TComponent; AId:Integer);
  end;

var
  CadastroItemForm: TCadastroItemForm;

implementation

{$R *.dfm}

constructor  TCadastroItemForm.CreateCustom(AOwner: TComponent; AId:Integer);
begin
    inherited Create(AOwner);
    IdFornecedor := AId;
end;

procedure TCadastroItemForm.EditarButtonClick(Sender: TObject);
begin
  AlterarTab;
  ItemDataTable.Edit;

end;

procedure TCadastroItemForm.AlterarTab;
begin

 if PageControl.ActivePage = ItemListaTab then
   PageControl.ActivePage := ItemFuncaoTab
 else
   PageControl.ActivePage := ItemListaTab;


  PageControl.Pages[0].TabVisible := not PageControl.Pages[0].TabVisible;
  PageControl.Pages[1].TabVisible := not PageControl.Pages[1].TabVisible;

end;

procedure TCadastroItemForm.FiltrarButtonClick(Sender: TObject);
var Filtro:String;
begin

  if not AtivoFiltroCheckBox.Checked then
    Filtro := 'Ativo = 0'
  else
    Filtro := 'Ativo = 1';

    Filtro := Filtro + ' and idfornecedor = ' + IntToStr(IdFornecedor);

  if NomeFiltroEdit.Text <> '' then
    Filtro := Filtro + ' and descricao = ' + QuotedStr(NomeFiltroEdit.Text);

  ItemDataTable.Filter   := Filtro;
  ItemDataTable.Filtered := True;

end;

procedure TCadastroItemForm.FormCreate(Sender: TObject);
begin

  PageControl.Pages[0].TabVisible := True;
  PageControl.Pages[1].TabVisible := False;

  DataModule := TDataModuleForm.Create(self);
  ItemDataTable.Connection := DataModule.DatabaseConnection;
  FiltrarButtonClick(self);
  ItemDataTable.Active := True;
end;

procedure TCadastroItemForm.FormDestroy(Sender: TObject);
begin
 DataModule.Free;
end;

procedure TCadastroItemForm.GravarButtonClick(Sender: TObject);
begin
  ItemDataTable.FieldByName('idfornecedor').AsInteger := IdFornecedor;
  ItemDataTable.Post;
  AlterarTab;

end;

procedure TCadastroItemForm.NovoButtonClick(Sender: TObject);
begin
  AlterarTab;
  ItemDataTable.Insert;
  ItemDataTable.FieldByName('ativo').AsBoolean := True;
end;

procedure TCadastroItemForm.VoltarButtonClick(Sender: TObject);
begin
   ItemDataTable.Cancel;
   ItemDataTable.First;
   AlterarTab;
end;

end.
