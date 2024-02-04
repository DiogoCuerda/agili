unit dataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModuleForm = class(TDataModule)
    DatabaseConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleForm: TDataModuleForm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
