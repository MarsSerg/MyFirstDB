unit tips;

{$mode objfpc}{$H+}

interface
uses
                  Classes, SysUtils,Crt;
type tipss = array [1..5] of string;
const tipstring:array[1..5] of string = ('Enter-���� ', #30, #31, '���室 �� �㭪⠬',' Esc-��室');
      tipstring2:array [1..5] of string = ('Tab-���室',' F2-᫥���騩 �祭��',' ',' ',' ');
      tipstring3:array [1..5] of string = (#30, #31, '���室 �� ��㤥�⠬','','')      ;
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

