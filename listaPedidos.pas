unit listaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, Vcl.StdCtrls,dataModule, Datasnap.DBClient;

type
  TListaPedidoForm = class(TForm)
    DataPedidoEdit: TDateTimePicker;
    ListaPedidosGrid: TDBGrid;
    LabelTotal: TLabel;
    ListaPedidoQuery: TADOQuery;
    ListaPedidoDataSource: TDataSource;
    ListaPedidoQuerypreco: TFloatField;
    ListaPedidoQuerydescricao: TStringField;
    ListaPedidoQueryquantidade: TIntegerField;
    ListaPedidoQuerytotal: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure DataPedidoEditChange(Sender: TObject);
  private
    IdFornecedor: Integer;
    DataAtual: TDate;
    DataModule : TDataModuleForm;
  public
    constructor CreateCustom(AOwner: TComponent; AId:Integer);
  end;

var
  ListaPedidoForm: TListaPedidoForm;

implementation

{$R *.dfm}

constructor  TListaPedidoForm.CreateCustom(AOwner: TComponent; AId:Integer);
begin
    inherited Create(AOwner);
    IdFornecedor := AId;
end;

procedure TListaPedidoForm.DataPedidoEditChange(Sender: TObject);
var Total : Float64;
begin
  Total := 0.0;
  with ListaPedidoQuery do
  begin

    Close;
    Active := False;
    Parameters.ParamByName('idfornecedor').Value := IdFornecedor;
    Parameters.ParamByName('data').Value := DataPedidoEdit.Date;
    Active := True;
    Open;

    First;
    while not eof do
    begin
      Total := Total + FieldByName('total').AsFloat;
      Next;
    end;
    LabelTotal.Caption := 'Total : ' + Format('%.2f', [Total]);
  end;


end;

procedure TListaPedidoForm.FormCreate(Sender: TObject);
begin
    DataModule := TDataModuleForm.Create(self);
    ListaPedidoQuery.Connection := DataModule.DatabaseConnection;
    DataAtual := Date;
    DataPedidoEdit.Date := DataAtual;
    DataPedidoEditChange(self);

end;

end.
