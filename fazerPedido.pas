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
    EnviarButton: TButton;
    SelecionaButton: TButton;
    DisponiveisDataSource: TDataSource;
    DisponiveisQuery: TADOQuery;
    AdicionadosDataSource: TDataSource;
    AdicionadosDataSet: TClientDataSet;
    LabelTotal: TLabel;
    PedidoDataTable: TADOTable;
    PedidoItemDataTable: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure SelecionaButtonClick(Sender: TObject);
    procedure AdicionarButtonClick(Sender: TObject);
    procedure RemoverButtonClick(Sender: TObject);
    procedure EnviarButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private
    var DataAtual: TDate;
    var IdFornecedor: Integer;
    var IdColaborador: Integer;
    var Total: Double;
    procedure HabilitaCampos;
  public
    constructor CreateCustom(AOwner: TComponent; AId:Integer);
  end;

var
  FazerPedidoForm: TFazerPedidoForm;
  DataModule: TDataModuleForm;

implementation

{$R *.dfm}


constructor TFazerPedidoForm.CreateCustom(AOwner: TComponent; AId:Integer);
begin
    inherited Create(AOwner);
    IdColaborador := AId;
end;

procedure TFazerPedidoForm.HabilitaCampos;
begin

    SelecionaButton.Enabled := (IdFornecedor = 0);
    FornecedorComboBox.Enabled := SelecionaButton.Enabled;

    AdicionarButton.Enabled := (DisponiveisQuery.RecordCount > 0);
    DisponiveisGrid.Enabled := AdicionarButton.Enabled;

    AdicionadosGrid.Enabled := (AdicionadosDataSet.RecordCount > 0);
    RemoverButton.Enabled := AdicionadosGrid.Enabled;

    if not AdicionadosGrid.Enabled then
    begin
      SelecionaButton.Enabled := True;
      FornecedorComboBox.Enabled := True;
    end;

    EnviarButton.Enabled :=  RemoverButton.Enabled;
end;

procedure TFazerPedidoForm.RemoverButtonClick(Sender: TObject);
begin
   with AdicionadosDataSet do
   begin
     if fieldbyname('quantidade').AsInteger > 1 then
     begin
       Edit;
       Fieldbyname('quantidade').AsInteger := Fieldbyname('quantidade').AsInteger - 1;
       FieldByName('Total').AsFloat        :=  FieldByName('Quantidade').AsInteger*FieldByName('preco').AsFloat;
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
  if not VarIsNull(FornecedorComboBox.KeyValue) then
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

  end
  else
   ShowMessage('Selecione um fornecedor');

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
         FieldByName('total').Asfloat      := FieldByName('preco').asFloat;
         Total := Total + FieldByName('preco').asFloat;
         Post;
    end;

   HabilitaCampos;
   LabelTotal.Caption :=  'Total : ' + Format('%.2f', [Total]);
end;

procedure TFazerPedidoForm.EnviarButtonClick(Sender: TObject);
var IdPedido, Resposta:Integer;
begin

  Resposta := MessageDlg('Após continuar não será possível alterar seu pedido!',
    mtConfirmation, mbOKCancel, 0);
  if Resposta = 1 then
  begin

    with PedidoDataTable do
    begin

      Connection := dataModule.DatabaseConnection;

      TableName := 'Pedido';
      Active := True;
      Insert;
      Fieldbyname('IdFornecedor').AsInteger  := IdFornecedor;
      Fieldbyname('IdColaborador').AsInteger := IdColaborador;
      Fieldbyname('Data').AsDateTime         := DataAtual;

      Post;

      Filter := 'IdFornecedor = ' + IntToStr(IdFornecedor) +
        ' and IdColaborador = ' + IntToStr(IdColaborador) + ' and data = ' +
        QuotedStr(DateToStr(DataAtual));
      Filtered := True;
      IdPedido := fieldbyname('IdPedido').AsInteger;

    end;

    with PedidoItemDataTable do
    begin

      Connection := dataModule.DatabaseConnection;

      TableName := 'PedidoItem';
      Active := True;
      Open;

      AdicionadosDataSet.First;
      while not AdicionadosDataSet.Eof do
      begin

        Append;
        Fieldbyname('IdPedido').AsInteger := IdPedido;
        Fieldbyname('IdItem').AsInteger   := AdicionadosDataSet.fieldbyname('IdItem').AsInteger;
        Fieldbyname('preco').AsFloat      := AdicionadosDataSet.fieldbyname('preco').AsFloat;
        Fieldbyname('Quantidade').AsFloat := AdicionadosDataSet.fieldbyname('Quantidade').AsInteger;

        Post;
        AdicionadosDataSet.Next;

      end;

      UpdateBatch(arAll);

    end;
    Self.Close;
  end;

end;



procedure TFazerPedidoForm.FormCreate(Sender: TObject);
begin
   DataModule := TDataModuleForm.Create(self);
   FornecedorQuery.Connection := DataModule.DatabaseConnection;
   FornecedorQuery.Active := True;
   DataAtual := Date;
   DataLabel.Caption := 'Data : ' + FormatDateTime('DD/MM/YYYY', DataAtual);
   IdFornecedor := 0;

end;



procedure TFazerPedidoForm.FormDestroy(Sender: TObject);
begin
 DataModule.Free;
end;

end.
