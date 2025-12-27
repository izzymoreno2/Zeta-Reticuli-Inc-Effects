program Project1;

uses
  Forms,
  ZetaReticuli in 'ZetaReticuli.pas' {Form1},
  MainProgMenu in 'MainProgMenu.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
