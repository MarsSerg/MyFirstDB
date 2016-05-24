unit tips;

{$mode objfpc}{$H+}

interface
uses
                  Classes, SysUtils,Crt;
type tipss = array [1..5] of string;
const tipstring:array[1..5] of string = ('Enter-ввод ', #30, #31, 'переход по пунктам',' Esc-выход');
      tipstring2:array [1..5] of string = ('Tab-переход',' F2-следующий ученик',' ',' ',' ');
      tipstring3:array [1..5] of string = (#30, #31, 'переход по студентам','','')      ;
procedure tip(x2, y2: integer; sa:tipss);
   //procedure tip2(x2, y2: integer);
   // procedure tip3(x2, y2: integer);


implementation
   procedure tip(x2, y2: integer; sa:tipss);
   var s:string; i:integer;
  begin
    textcolor(green);
    gotoxy(x2, y2);
    s:='';
    for i:=1 to 5 do
    s:=s+sa[i];
    Write(s);
  end;
end.

