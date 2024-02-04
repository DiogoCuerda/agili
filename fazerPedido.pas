unit fazerPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Data.DB, Data.Win.ADODB,dataModule,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TFazerPedidoForm = class(TForm)
    FornecedorComboBox: TDBLookupComboBox;
    FornecedorDataSource: TDataSource;
    FornecedorQuery: TADOQuery;
    DisponiveisGrid: TDBGrid;
    Label1: TLabel;
    AdicionarButton: TButton;
    Label2: TLabel;
    AdicionadosGrid: TDBGrid;
    RemoverButton: TButton;
    DataLabel: TLabel;
    Button3: TButton;
    SelecionaButton: TButton;
    DisponiveisDataSource: TDataSource;
    DisponiveisQuery: TADOQuery;
    AdicionadosDataSource: TDataSource;
    AdicionadosDataSet: TClientDataSet;
    LabelTotal: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SelecionaButtonClick(Sender: TObject);
    procedure AdicionarButtonClick(Sender: TObject);
    procedure RemoverButtonClick(Sender: TObject);
  private
    var DataAtual: TDate;
    var IdFornecedor: Integer;
    var Total: Double;
    procedure HabilitaCampos;
  public
    { Public declarations }
  end;

var
  FazerPedidoForm: TFazerPedidoForm;
  DataModule: TDataModuleForm;

implementation

{$R *.dfm}


procedure TFazerPedidoForm.HabilitaCampos;
begin
    if (IdFornecedor <> 0) and not AdicionadosDataSet.Eof then
    begin
      SelecionaButton.Enabled := False;
      FornecedorComboBox.Enabled := False;
    end;



    if not DisponiveisQuery.Eof then
    begin

       AdicionarButton.Enabled := True;
       DisponiveisGrid.Enabled := True;

    end
    else
    begin

       AdicionarButton.Enabled := False;
       DisponiveisGrid.Enabled := False;

    end;


    if not AdicionadosDataSet.Eof  then
    begin

       AdicionadosGrid.Enabled := True;
       RemoverButton.Enabled   := True;

    end
    else
    begin

       AdicionadosGrid.Enabled := False;
       RemoverButton.Enabled   := False;

    end;



end;

procedure TFazerPedidoForm.RemoverButtonClick(Sender: TObject);
begin
   with AdicionadosDataSet do
   begin
     if fieldbyname('quantidade').AsInteger > 1 then
     begin
       Edit;
       fieldbyname('quantidade').AsInteger := fieldbyname('quantidade').AsInteger - 1;
       FieldByName('Total').AsFloat :=  FieldByName('Quantidade').AsInteger*FieldByName('preco').AsFloat;
       Total := Total - fieldbyname('preco').AsFloat;
       Post;

     end
     else
     begin
       Total := Total - fieldbyname('preco').AsFloat;
       Delete;
     end;

   end;
   LabelTotal.Caption :=  'Total : ' + Format('%.2f', [Total]);
   HabilitaCampos;
end;

procedure TFazerPedidoForm.SelecionaButtonClick(Sender: TObject);
begin
    Total := 0.0;
    IdFornecedor := FornecedorComboBox.KeyValue;
    AdicionadosDataSet.Close;
    AdicionadosDataSet.CreateDataSet;
    AdicionadosDataSet.Active := True;
    AdicionadosDataSet.Open;

      with DisponiveisQuery do
      begin
        Close;
        Connection := DataModule.DatabaseConnection;
        Parameters.ParamByName('idfornecedor').Value := IdFornecedor;

        Active := True;
        Open;

      end;

    HabilitaCampos;

end;

procedure TFazerPedidoForm.AdicionarButtonClick(Sender: TObject);
var IdItem: Integer;
var Editado: Boolean;
begin


    Editado := False;
    IdItem := DisponiveisQuery.FieldByName('iditem').AsInteger;
    AdicionadosDataSet.First;
    while not AdicionadosDataSet.Eof do
    begin
       if IdItem = AdicionadosDataSet.FieldByName('iditem').AsInteger then
       begin
         with AdicionadosDataSet do
         begin
            Edit;
            FieldByName('Quantidade').AsInteger := 1 + FieldByName('Quantidade').AsInteger;
            FieldByName('Total').AsFloat :=  FieldByName('Quantidade').AsInteger*FieldByName('preco').AsFloat;
            Total := Total + FieldByName('preco').AsFloat;;
            Post;

         end;

         Editado := True;
         break;
       end;
       AdicionadosDataSet.Next;
    end;

    if not Editado then
    with AdicionadosDataSet do
    begin
         Insert;
         FieldByName('descricao').AsString := DisponiveisQuery.FieldByName('descricao').AsString;
         FieldByName('iditem').AsInteger   := DisponiveisQuery.FieldByName('iditem').AsInteger;
         FieldByName('preco').asFloat      := DisponiveisQuery.FieldByName('preco').asFloat;
         FieldByName('quantidade').Asfloat := 1;
         FieldByName('total').Asfloat := FieldByName('preco').asFloat;
         Total := Total + FieldByName('preco').asFloat;
         Post;
    end;

   HabilitaCampos;
   LabelTotal.Caption :=  'Total : ' + Format('%.2f', [Total]);
end;

procedure TFazerPedidoForm.FormCreate(Sender: TObject);
begin
   DataModule := TDataModuleForm.Create(self);
   FornecedorQuery.Connection := DataModule.DatabaseConnection;
   FornecedorQuery.Active := True;
   DataAtual := Date;
   DataLabel.Caption := FormatDateTime('DD/MM/YYYY', DataAtual);
   IdFornecedor := 0;

end;

end.
