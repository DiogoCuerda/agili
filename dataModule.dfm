object DataModuleForm: TDataModuleForm
  Height = 116
  Width = 130
  object DatabaseConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=SqlServer2019!;Persist Security I' +
      'nfo=True;User ID=sa;Initial Catalog=agili;Data Source=127.0.0.1:' +
      '1433;Use Procedure for Prepare=1;Auto Translate=True;Packet Size' +
      '=4096;Workstation ID=DESKTOP-O33EKG2;Initial File Name="";Use En' +
      'cryption for Data=False;Tag with column collation when possible=' +
      'False;MARS Connection=False;DataTypeCompatibility=0;Trust Server' +
      ' Certificate=True;Server SPN="";Application Intent=READWRITE;Mul' +
      'tiSubnetFailover=False;Use FMTONLY=False;Authentication="";Acces' +
      's Token="";TransparentNetworkIPResolution=True;Connect Retry Cou' +
      'nt=1;Connect Retry Interval=10'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 40
    Top = 32
  end
end
