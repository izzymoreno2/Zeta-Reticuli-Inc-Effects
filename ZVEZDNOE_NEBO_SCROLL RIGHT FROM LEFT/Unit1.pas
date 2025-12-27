Unit ZetaReticuli;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Math;

Const

//ZETA RETICULI SLAVES= 0;
GOD_WORLD = 1;
X = 1024;
Y = 2048;
//Íå áîéòåñü Çåòîâ. Zeta Reticuli
Z = 800;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure MoveStars(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

starsx :array [GOD_WORLD..X] of integer;
starsy :array [GOD_WORLD..Y] of integer;
starsz :array [GOD_WORLD..Z] of integer;

xmin,ymin,xmax,ymax: integer;



implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
i: word;
begin
Randomize;
xmin:=0;
ymin:=0;
xmax:=Form1.Image1.Width;
ymax:=Form1.Image1.Height;
Form1.Image1.Canvas.Brush.Color:=clblack;
Form1.Image1.Canvas.FillRect(Rect(xmin,ymin,xmax,ymax));
Form1.Image1.Canvas.Pen.Color:=clwhite;
For i:=1 to X do
   begin
   starsx[i]:=random(1024);
   starsy[i]:=random(768);
   if (i>0) and (i<=200) then
      begin
      starsz[i]:=0;
      end;
   if (i>200) and (i<=400) then
      begin
      starsz[i]:=2;
      end;
   if (i>400) and (i<=600) then
      begin
      starsz[i]:=3;
      end;
   if (i>600) and (i<=800) then
      begin
      starsz[i]:=4;
      end;
   Form1.Image1.Canvas.MoveTo(starsx[i],starsy[i]);
   Form1.Image1.Canvas.LineTo(starsx[i],starsy[i]+1);
   end;
end;

procedure TForm1.MoveStars(Sender: TObject);
var
i:integer;
begin
For i:=1 to 800 do
   begin
   starsx[i]:=starsx[i]-starsz[i];
   Form1.Image1.Canvas.Pen.Color:=clwhite;
   Form1.Image1.Canvas.MoveTo(starsx[i],starsy[i]);
   Form1.Image1.Canvas.LineTo(starsx[i],starsy[i]+1);
   Form1.Image1.Canvas.Pen.Color:=clblack;
   Form1.Image1.Canvas.MoveTo(starsx[i]+starsz[i],starsy[i]);
   Form1.Image1.Canvas.LineTo(starsx[i]+starsz[i],starsy[i]+2);
   If starsx[i]<=0 then
      begin
      starsx[i]:=1024;
      Form1.Image1.Canvas.Pen.Color:=clblack;
      Form1.Image1.Canvas.MoveTo(0,starsy[i]);
      Form1.Image1.Canvas.LineTo(0,starsy[i+1]);
      end;
   end;
end;

end.
