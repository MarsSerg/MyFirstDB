unit Mnumpole;

{$mode objfpc}{$H+}


interface
uses
                  crt,Classes, SysUtils;
function numpole(x, y, maxlength: integer; var parametr: boolean;format:boolean): integer;

implementation
function numpole(x, y, maxlength: integer; var parametr: boolean;format:boolean): integer;
var i,n,code: integer;
s,s1: string;
pos: integer;
key: char;
flag: boolean;
begin
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
      if (key >= #48) and (key<=#58) and (pos < maxlength) then
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
    val(s,n,code);
    numpole := n;
end;

end.

