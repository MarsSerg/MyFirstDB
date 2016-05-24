unit Cout;

{$mode objfpc}{$H+}

interface

uses
                  Classes, SysUtils,records,tips,crt,frames;
type
  minienter = array [1..3] of string;

       procedure out(var pupil:dataarray;numberpupils:integer);
       procedure miniwritemenu(menu: integer);
implementation
 procedure miniwritemenu(menu: integer);
 var
    matrix: miniENTER;
    x: integer;
     begin
    matrix[1] := '1- Delete';
    matrix[2] := '2- Change';
    matrix[3] := '2- Exit';
    cursoroff;
    for x := 1 to 3 do
    begin
      gotoxy(5,10+x);
      setmenucolor(x, menu);
      writeln(matrix[x]);
    end;
  end;


 procedure out(var pupil:dataarray;numberpupils:integer);
 var n,y2:integer;
     ch,key:char;
     k,j,i: integer;
begin
  k:=1;
  y2 := 23;
  if numberpupils < 0 then
  Write('Нет ни одного ученика')
  else
  i:=1;
  n:=1;
repeat

clrscr;
    tip(50,y2,tipstring3);
    frameformenu(1, 1, 40, 24);
    begin
      {=================}
      gotoxy(2, 3);
      Write('Cтудент');
      littleframe(13, 2, 5, 2);
      gotoxy(14, 3);
      Write(i);
      {=================}
      gotoxy(2, 6);
      Write('Фамилия');
      littleframe(13, 5, 20, 2);
      gotoxy(14, 6);
      Write(pupil[i].Surname);
      {=================}
      gotoxy(2, 9);
      Write('Имя');
      littleframe(13, 8, 20, 2);
      gotoxy(14, 9);
      Write(pupil[i].Name);
      {=================}
      gotoxy(2, 12);
      Write('Группа');
      littleframe(13, 11, 20, 2);
      gotoxy(14, 12);
      Write(pupil[i].Group);
      {=================}
      gotoxy(2, 15);
      Write('Предмет');
      littleframe(13, 14, 20, 2);
      gotoxy(14, 15);
      Write(pupil[i].subjects[n].lesson);
      {=================}
      gotoxy(2, 18);
      Write('Дата');
      littleframe(13,18,4,2);
        gotoxy(14, 19);
        write(Pupil[i].subjects[n].date.year);
      littleframe(19, 18, 4, 2);
        gotoxy(20, 19);
        write(Pupil[i].subjects[n].date.month);
        littleframe(25, 18, 4, 2);
        gotoxy(26, 19);
        write(Pupil[i].subjects[n].date.day ) ;
       {=================}
      gotoxy(2, 21);
      writeln('Oценки');
         littleframe(13,21,20,2);
         gotoxy(14, 21);
        Write(Pupil[i].subjects[n].Mark);
    end;
while KeyPressed do
ReadKey;
repeat
until KeyPressed;
ch:=ReadKey;
if ch = #27 then
Break;
if ch = #0 then
begin
ch:=ReadKey;
case ch of
#72:
begin
  dec(i);
  if i<1 then
     i:=numberpupils;
end;
 #80:
begin
  inc(i);
  if i>numberpupils then
    i:=1;
end;
 #60 :
 begin
  littleframe(2, 6, 20, 13);
  gotoxy(3,8);
  write('Choose action');
  miniwritemenu(k);
  repeat
      miniwritemenu(k);
      gotoxy(3, 10);
      key := readkey;
      if key = #77 then
      begin
        k := k - 1;
        if k = 0 then
          k := 3;
      end;
      if key = #75 then
      begin
        k := k + 1;
        if k = 4 then
          k := 1;
      end;
      miniwritemenu(k);
      gotoxy(3, 10);


    until (key = #13) or (key = #27);

    if (key = #13) then
      if (k <> 3) then
      case k of
          1:begin
            for j := i to numberpupils - 1 do
            pupil[j] := pupil[j + 1];
            numberpupils := numberpupils - 1;

	  end;
          2:begin
           gotoxy(13,10);
            writeln('мамой клянусь работало');
	  end;

      end;

 end;


end;

end;
until false;
end;
end.
