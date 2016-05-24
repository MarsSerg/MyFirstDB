unit Frames;

{$mode objfpc}{$H+}

interface
 uses
                  Classes, SysUtils,Crt;
 procedure draw(var z: integer);
 procedure megaframe(x3, y3, w, h: integer);
 procedure littleframe(x, y, w, h: integer);
 procedure frame(x1, y1, w, h: integer);
 procedure frameformenu(y3, x3, w, h: integer);
 procedure littleframemenu(x2, y2, w, h: integer);
  procedure setmenucolor(linenum, menu: integer);


implementation
{***f* draw
 *  NAME
 *  draw
 *  DESCRIPTION
 *  draw borders
 *  ARGUMENTS
 *   z -- parametr how manu times to draw them
 ******}
  // процедура избавления от дублирования
  procedure draw(var z: integer);
  var
    q: integer;
  begin
    for q := 1 to z do
      Write(#196);
  end;

  {***f* megaframe
 *  NAME
 *  frame
 *  DESCRIPTION
 *  drawing frame
 *  ARGUMENTS
 *   x3,y3 -- parametrs for gotoxy
 *   w -- width
 *   h -- hight
 ******}
  procedure megaframe(x3, y3, w, h: integer);
  var
    q: integer;
  begin
    gotoxy(x3, y3);
    Write(#218);
    draw(w);
    Write(#191);
    for q := Y3 + 1 to Y3 + h - 1 do
    begin
      gotoxy(X3, q);
      Write(#179, ' ': w, #179);
    end;
    GOTOXY(X3, Y3 + H);
    Write(#192);
    draw(w);
    Write(#217);
  end;

   {***f* frame
 *  NAME
 *  frame
 *  DESCRIPTION
 *  drawing frame
 *  ARGUMENTS
 *   x1,y1 -- parametrs for gotoxy
 *   w -- width
 *   h -- hight
 ******}
  //процедура создания рамки   -   выделить общее в другую процедуру
  procedure frame(x1, y1, w, h: integer);
  begin
    textcolor(green);
    megaframe(x1, y1, w, h);
  end;

 {***f* frameformenu
 *  NAME
 *  frame
 *  DESCRIPTION
 *  drawing frame
 *  ARGUMENTS
 *   x3,y3 -- parametrs for gotoxy
 *   w -- width
 *   h -- hight
 ******}
  procedure frameformenu(y3, x3, w, h: integer);
  begin
    megaframe(x3, y3, w, h);
  end;

     {***f* littleframe
 *  NAME
 *  frame
 *  DESCRIPTION
 *  drawing frame
 *  ARGUMENTS
 *   x,y -- parametrs for gotoxy
 *   w -- width
 *   h -- hight
 ******}
  procedure littleframe(x, y, w, h: integer);
  begin
    megaframe(x, y, w, h);
  end;

{***f* littleframemenu
 *  NAME
 *  frame
 *  DESCRIPTION
 *  drawing frame
 *  ARGUMENTS
 *   x,y -- parametrs for gotoxy
 *   w -- width
 *   h -- hight
 ******}
  procedure littleframemenu(x2, y2, w, h: integer);
  begin
    megaframe(x2, y2, w, h);
  end;

    {***f* setmenucolor
 *  NAME
 *  setmenucolor
 *  DESCRIPTION
 *  allows you to see where cursor is
 *  ARGUMENTS
 *   linenum -- string,where cursor is
 *   menu -- all points in menu
 ******}
//процедура перебора цветов в менюшке
  procedure setmenucolor(linenum, menu: integer);
  begin
    if linenum <> menu then
      textcolor(green)
    else
      textcolor(lightred);
  end;

end.

