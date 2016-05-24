unit cinfornumbers;

{$mode objfpc}{$H+}

interface

uses
                 Crt, Classes, SysUtils;
procedure readlnnumber(var n: integer);
implementation
  {***f* readlnnumber
 *  NAME
 *  readlnnumber
 *  DESCRIPTION
 *  corrects numbers,if there was a mistake-says it to you
 *  ARGUMENTS
 *   n:integer -- number
 ****** }
  //�᫠ �஢�ઠ �뫮 �� ��� ������� ��୮
  procedure readlnnumber(var n: integer);
  var
    s: string;
    code: integer;
  begin
    readln(s);
    val(s, n, code);

    while code > 0 do
    begin
      CLRSCR;
      writeln('�訡�� �� ����� �᫠,������ ������');
      readln(s);
      val(s, n, code);
    end;
  end;
end.

