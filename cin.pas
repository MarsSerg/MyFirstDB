unit Cin;

{$mode objfpc}{$H+}

interface

uses
                 Crt, Classes, SysUtils;
function readstring(x, y, maxlength: integer; var parametr: boolean;format:boolean): string;

implementation
 {***f* Readstring
 *  NAME
 *  readstring -- function of writing and correcting of string
 *  DESCRIPTION
 *  function,which allows you to input information about students
 *  ARGUMENTS
 *   X,Y -- parametrs for gotoxy
 *   maxlength -- parametr which shows the max amount of symbols in string
 ******}
  //функция записи и изменения строки
  function readstring(x, y, maxlength: integer; var parametr: boolean;format:boolean): string;
  var

    i: integer;
    s: string;
    pos: integer;
    key,cHAR1,char2: char;   //true - числа
    flag: boolean;
  begin
    char1:=#48;
    char2:=#58;
    flag := True;
    s := '';
    pos := 0;
    gotoxy(x, y);
    repeat
      key := readkey;
      if (key = #0) then
        if readkey = #60 then
        begin
          flag := False;
          parametr := True;
        end;
     if format=true then
     begin
       char1:=#59;
       char2:=#47;
     end;
     if ((key >= #32) and (key < char1) or (key>char2)) and (pos < maxlength) then
      begin
        Write(key);
        pos := pos + 1;
        s := s + key;
      end;
      if (key = #8) and (pos <> 0) then
      begin
        pos := pos - 1;
        gotoxy(x + pos, y);
        Write(' ');
        gotoxy(x + pos, y);
        Delete(s, length(s), 1);
      end;
      if (key = #9) then
      begin
        flag := False;
        parametr := False;
      end;
    until flag = False;
    readstring := s;
  end;
end.



