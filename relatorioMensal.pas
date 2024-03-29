unit relatorioMensal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls,dataModule, Vcl.FileCtrl,Vcl.ExtCtrls;

type
  TRelatorioMensalForm = class(TForm)
    ExportarButton: TButton;
    DataInicialEdit: TDateTimePicker;
    ListaPedidosGrid: TDBGrid;
    ListaPedidoQuery: TADOQuery;
    ListaPedidoDataSource: TDataSource;
    Label1: TLabel;
    DataFinalEdit: TDateTimePicker;
    Label2: TLabel;
    FiltrarButton: TButton;
    Label3: TLabel;
    ClienteQuery: TADOQuery;
    ClienteDataSource: TDataSource;
    ColaboradorComboBox: TDBLookupComboBox;
    ListaPedidoQuerydata: TDateField;
    ListaPedidoQuerydescricao: TStringField;
    ListaPedidoQuerypreco: TFloatField;
    ListaPedidoQueryquantidade: TIntegerField;
    ListaPedidoQuerytotal: TFloatField;
    procedure ExportarButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FiltrarButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    DataModule: TDataModuleForm;
  public
    { Public declarations }
  end;

var
  RelatorioMensalForm: TRelatorioMensalForm;

implementation

{$R *.dfm}

procedure TRelatorioMensalForm.ExportarButtonClick(Sender: TObject);
var CSV : TStringList;
    i,j : Integer;
    Line,Diretorio : String;
    SeletorDiretorio: TFileOpenDialog;

begin
   try
    SeletorDiretorio := TFileOpenDialog.Create(nil);
    SeletorDiretorio.Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
    if SeletorDiretorio.Execute then
     Diretorio := SeletorDiretorio.FileName;


    with ListaPedidoQuery do
    begin
       Line := '';
       CSV := TStringList.Create;

       for i := 0 to FieldCount - 1 do
         Line := Line + Fields[i].FieldName + ';';
       CSV.Add(Line);
       Line := '';
       First;

       while not Eof do
       begin
          for j := 0 to FieldCount - 1 do
            Line := Line + Fields[j].AsString + ';';
          CSV.Add(Line);
          Line := '';
          Next;

       end;

       CSV.SaveToFile(Diretorio + '\' +ColaboradorComboBox.Text+ '.csv');
       ShowMessage('Exportado com sucesso.');
    end;
       SeletorDiretorio.Free;
       CSV.Free;
   except
       SeletorDiretorio.Free;
       CSV.Free;
       ShowMessage('Erro ao exportar, selecione um diret�rio v�lido.');

   end;

end;

procedure TRelatorioMensalForm.FiltrarButtonClick(Sender: TObject);
begin
  with ListaPedidoQuery do
  begin
    Close;
    Active := False;
    Parameters.ParamByName('datainicial').Value := DataInicialEdit.Date;
    Parameters.ParamByName('datafinal').Value   := DataFinalEdit.Date;
    Parameters.ParamByName('idcolaborador').Value := ColaboradorComboBox.KeyValue;
    Connection := DataModule.DatabaseConnection;
    Active     := True;
    Open;

    ExportarButton.Enabled := (RecordCount > 0);

  end;

end;

procedure TRelatorioMensalForm.FormCreate(Sender: TObject);
begin
   DataModule := TDataModuleForm.Create(self);
   ClienteQuery.Connection := DataModule.DatabaseConnection;
   ClienteQuery.Active := True;

end;

procedure TRelatorioMensalForm.FormDestroy(Sender: TObject);
begin
  DataModule.Free;
end;

end.
