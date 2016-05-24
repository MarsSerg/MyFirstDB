unit Search;

{$mode objfpc}{$H+}

interface

uses
                  cin,cout,Classes, SysUtils,records,crt,Frames;
procedure surnamesearch(a:dataarray;numberpupils:integer);

implementation
procedure surnamesearch(a:dataarray;numberpupils:integer);
var i:integer;
     s,s1:string;
     parametr: boolean;
     begin
     parametr := true;
     if parametr = true then
     gotoxy(15,23);
     write('':40);
     writeln('press F2 to Enter');
       littleframe(1, 19, 20, 2);
       s:=readstring(2, 20, 19, parametr,false);
       for i:=1 to numberpupils do
       begin
         s1:=copy(a[i].surname,1,length(s));
         if s1=s then
         begin
           //out(a,numberpupils,i) ;
	 end
         else
          gotoxy (2, 24);
          writeln('There`s no such student');
          readkey;
       end;
     end;
end.

