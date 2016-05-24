{****
 * TODO
 *   - git
 *   - robodoc
 *   - ��� ord
 *   - 25 ��ப
 *   -
 *}
{1-1. ���� ������ ��㤥�⮢ ��㯯�.
����: 䠬����, ���, ����⢮, ���, ��������.
������� ��㤥��� ᮮ⢥����� ⠡��� �業��(��� �ਫ������ � �������)
� ���ﬨ: �।���, �業�� (�⫨筮, ���, 㤮���⢮�⥫쭮, ����), ��� ᤠ�.
����஢�� �� ���, ��宦����� ���ଠ樨 �� ���.}
program BD1;

uses
  crt,
  tips,
  Frames,
  Cin,
  cinfornumbers,
  records,
  SysUtils,
  Cout,
  search;




  {***f* writemenu
 *  NAME
 *  writemenu
 *  DESCRIPTION
 *  displays menu
 *  ARGUMENTS
 *   menu -- all points in menu
 ******}
  //��楤�� �뢮�� ����
type
  enter = array [1..14] of string;

  procedure writemenu(menu: integer);
  var
    matrix: ENTER;
    x: integer;
    //TODO: �������� - � ���ᨢ
    //�� � 横�
  begin
    matrix[1] := '1- �뢥�� ��� ��㤥�⮢';
    matrix[2] := '2- �������� ������ ��㤥��';
    matrix[3] := '3- 㤠���� ��㤥��';
    matrix[4] := '4- �������� ��㤥��';
    matrix[5] := '5- ����';
    matrix[6] := '6- �������� ���� �।���';
    matrix[7] := '7- 㤠���� �।���';
    matrix[8] := '8- �������� �।���';
    matrix[9] := '9- ��࠭��� 䠩� ⨯���஢������';
    matrix[10] := '10- ������ �� 䠩�� ⨯���஢������';
    matrix[11] := '11- ��࠭��� 䠩� ���⨯���';
    matrix[12] := '12- ������ �� 䠩�� ���⨯�����';
    matrix[13] := '13- ���஢��� �� ��䠢���';
    matrix[14] := '14- ��室';
    cursoroff;
    for x := 1 to 14 do
    begin
      gotoxy(10, x + 1);
      setmenucolor(x, menu);
      writeln(matrix[x]);
    end;
  end;



  {***f* bubble
 *  NAME
 *  bubble
 *  DESCRIPTION
 *  sorting array using bubble method
 *  ARGUMENTS
 *   item- array
 *   count - how many times to repeat
 *
 ******}
  //���஢�� ����쪮�� ��⮤��
 { procedure Bubble(var item: DataArray; Count: integer);
  var
    i, j: integer;
    x: anketa;
  begin
   { for i := 2 to Count do
    begin
      for j := Count downto i do
        if item[j - 1].Surname > item[j].Surname then
        begin
          x := item[j - 1];
          item[j - 1] := item[j];
          item[j] := x;
        end;
    end; }
  end;

    }
  //�᭮���� �ணࠬ��
var
  bufferstud : Anketa;
  f: file of anketa;
  Student: Anketa;
  Count: word;
  default,apupil, s: string;
  limit, month, year, day, x3, y3, x2, y2, h, w, x, y, j, k, i, n,
  nu, z, {numberpupils,} error, amount, amountst,fls: integer;
  exit, ch, key: char;
  //pupil: array [1..100] of anketa;
  pupil:PDataContainer;
  sub: array [1..100] of subject;
  flag, parametr: boolean;
  t, t2: integer;
  test: PDataContainer;
  er: integer;
  fname: string;
  fnotype: file;
begin
  error := 0;
  //numberpupils := 0;

  //{$define List}
  //{$ifdef List}
  //pupil:=new(PListContainer,init);
  //{$else}
  //   pupil:=new(PArrayContainer,init);
  //end;
  //{$endif}
repeat
 clrscr;
 textcolor (green);
writeln ('which version do you prefer lists or arrays? (l/a)');
writeln ('Press F2 to choose');
 littleframe(1,3,2,2);
 apupil  := readstring(2, 4, 1, parametr, False);
 if apupil = 'l' then
         pupil:=new(PListContainer,init)
else
  if  apupil='a'  then
     pupil:=new(PArrayContainer,init)
else
 pupil:=nil
until pupil <> nil;




  x3 := 1;
  y3 := 18;
  x2 := 15;
  y2 := 23;
  w := 40;
  h := 15;
  x := 9;
  y := 1;
  k := 1;
  repeat
    clrscr;
    tip(x2, y2, tipstring);
    frame(X, Y, w, h);
    writemenu(k);

    repeat
      writemenu(k);
      gotoxy(1, k);
      key := readkey;
      if key = #72 then
      begin
        k := k - 1;
        if k = 0 then
          k := 14;
      end;
      if key = #80 then
      begin
        k := k + 1;
        if k = 15 then
          k := 1;
      end;
      writemenu(k);
      gotoxy(1, k);
    until (key = #13) or (key = #27);
    gotoxy(1, 17);
    if (key = #13) then
      if (k <> 15) and (key <> #27) then

        case k of
          1:
          begin
            if pupil^.number > 0 then
              out(pupil)
            else
            begin
              writeln('���ࠢ���� ����� �祭���');
              readkey;
            end;
          end;


          2:
          begin
            writeln('������ ������⢮ �祭����');
            littleframemenu(x3, y3, 5, 2);
            repeat
              gotoxy(2, 19);
              readlnnumber(amount);
            until (amount >= 1) and (amount <= 100);
            clrscr;
            for i := 1 to amount do
            begin
              clrscr;
              parametr := False;
              repeat
                tip(x2, y2, tipstring2);
                gotoxy(x + 14, y + 1);
                textcolor(2);
                writeln('������ ���ଠ�� � ', i, ' ��㤥��');
                for j := 1 to 80 do
                  Write(#196);
                if parametr = False then
                begin
                  gotoxy(x, y + 4);
                  Inc(Count);
                  writeln('������ 䠬����');
                  littleframe(1, 6, 20, 2);
                  gotoxy(2, 7);
                  bufferstud.Surname :=
                    readstring(2, 7, 19, parametr, False);
                end;

                if parametr = False then
                begin
                  gotoxy(x, y + 8);
                  writeln('������ ���');
                  littleframe(1, 10, 20, 2);
                  gotoxy(2, 11);
                  bufferstud.Name := readstring(2, 11, 19, parametr, False);
                end;
                if parametr = False then
                begin
                  gotoxy(x, y + 12);
                  writeln('������ ����⢮');
                  littleframe(1, 14, 20, 2);
                  gotoxy(2, 15);
                  bufferstud.secondName :=
                    readstring(2, 15, 19, parametr, False);
                end;
                if parametr = False then
                begin
                  gotoxy(x, y + 16);
                  writeln('������ ����� ��㯯�');
                  littleframe(1, 18, 20, 2);
                  gotoxy(2, 19);
                  repeat
                    s := readstring(2, 19, 19, parametr, True);
                    val(s, er, error);
                    gotoxy(37, 19);
                    if error <> 0 then
                    begin
                      gotoxy(2, 19);
                      Write('': 19);
                      gotoxy(37, 19);
                      Write('������ ����� ��㯯� �᫮�!');
                    end
                    else
                      Write('': 40);
                   bufferstud.Group := er;
                  until error = 0;
                end;

              until parametr = True;
              pupil^.add(bufferstud);
              //numberpupils := numberpupils + 1;
            end;
            clrscr;
          end;

          3:
          begin
            if pupil^.number > 0 then
            begin
              clrscr;
              repeat
                writeln('������ ����� �祭���');
                readln(t);
                if (t < 1) or (t > pupil^.number) then
                  writeln('���ࠢ���� ����� �祭���');
              until (t >= 1) and (t <= pupil^.number);
              pupil^.delete(t);
            end
            else
            begin
              clrscr;
              writeln('���ࠢ���� ����� �祭���');
              readkey;
            end;
          end;

          4: if pupil^.number > 0 then
            begin
              repeat
                writeln('������ ����� �祭��� ��� ���������');
                readln(i);
                if (i < 1) or (i > pupil^.number) then
                  writeln('���ࠢ���� ����� �祭���');
              until (i >= 1) and (i <= pupil^.number);
              clrscr;
              parametr := False;
              repeat
                tip(x2, y2, tipstring2);
                gotoxy(x + 14, y + 1);
                textcolor(2);
                writeln('������ ���ଠ�� � ', i, ' ��㤥��');
                for j := 1 to 80 do
                  Write(#196);
                if parametr = False then
                begin
                  begin
                    gotoxy(x, y + 4);
                    writeln('������ 䠬����');
                    littleframe(1, 6, 20, 2);
                    gotoxy(2, 7);
                    pupil^.get(i)^.Surname := readstring(2, 7, 19, parametr, False);
                  end;
                  if parametr = False then
                  begin
                    gotoxy(x, y + 8);
                    writeln('������ ���');
                    littleframe(1, 10, 20, 2);
                    gotoxy(2, 11);
                    pupil^.get(i)^.Name := readstring(2, 11, 19, parametr, False);
                  end;
                  if parametr = False then
                  begin
                    gotoxy(x, y + 12);
                    writeln('������ ����⢮');
                    littleframe(1, 14, 20, 2);
                    gotoxy(2, 15);
                    pupil^.get(i)^.secondName := readstring(2, 15, 19, parametr, False);
                  end;
                  if parametr = False then
                  begin
                    gotoxy(x, y + 16);
                    writeln('������ ����� ��㯯�');
                    littleframe(1, 18, 20, 2);
                    gotoxy(2, 19);
                    repeat
                      s := readstring(2, 19, 19, parametr, True);
                      val(s, er, error);
                      gotoxy(37, 19);
                      if error <> 0 then
                      begin
                        gotoxy(2, 19);
                        Write('': 19);
                        gotoxy(37, 19);
                        Write('������ ����� ��㯯� �᫮�!');
                      end
                      else
                        Write('': 40);
                      pupil^.get(i)^.Group := er;
                    until error = 0;
                  end;
                end;
              until parametr = True;
            end;

          5: surnamesearch(pupil);

          6:
            if pupil^.number > 0 then
            begin
              repeat
                writeln('������ ����� �祭��� ��� ���������');
                littleframemenu(x3, y3, 5, 2);
                gotoxy(2, 19);
                readln(i);
                if (i < 1) or (i > pupil^.number) then
                  writeln('���ࠢ���� ����� �祭���');
              until (i >= 1) and (i <= pupil^.number);
              gotoxy(1, 17);
              Write('': 40);
              gotoxy(1, 17);
              writeln('������ ������⢮ �।��⮢');
              repeat
                littleframemenu(x3, y3, 5, 2);
                gotoxy(2, 19);
                readlnnumber(amountst);
              until (amountst >= 1) and (amountst <= 100);
              clrscr;
              for n := 1 to amountst do
                clrscr;
              parametr := False;
              repeat
                tip(x2, y2, tipstring2);
                gotoxy(x + 14, y + 1);
                textcolor(2);
                writeln('������ ���ଠ�� � ', n, ' �।���');
                for j := 1 to 80 do
                  Write(#196);
                if parametr = False then
                begin
                  begin
                    gotoxy(x, y + 4);
                    writeln('������ �।���');
                    littleframe(1, 6, 20, 2);
                    gotoxy(2, 7);
                    pupil^.get(i)^.Subjects[n].lesson := readstring(2, 7, 19, parametr, False);
                  end;
                  if parametr = False then
                  begin
                    gotoxy(x, y + 8);
                    repeat
                      writeln('������ ���� (���.�����.����)');
                      littleframe(1, 10, 4, 2);
                      gotoxy(2, 11);
                      pupil^.get(i)^.subjects[n].date.year :=
                        StrToInt(readstring(2, 11, 4, parametr, True));
                      if not (pupil^.get(i)^.subjects[n].date.year > 0) then
                      begin
                        gotoxy(37, 19);
                        Write('������ ��� ����� ���');
                      end;

                    until pupil^.get(i)^.subjects[n].date.year >= 0;
                    repeat
                      littleframe(7, 10, 4, 2);
                      gotoxy(8, 11);
                      pupil^.get(i)^.subjects[n].date.month :=
                        StrToInt(readstring(8, 11, 2, parametr, True));

                      if not ((pupil^.get(i)^.subjects[n].date.month >= 1) and
                        (pupil^.get(i)^.subjects[n].date.month <= 12)) then
                      begin
                        gotoxy(37, 19);
                        Write('������ ����� �� 1 �� 12');
                      end;


                    until (pupil^.get(i)^.subjects[n].date.month >= 1) and
                      (pupil^.get(i)^.subjects[n].date.month <= 12);
                    case pupil^.get(i)^.subjects[n].date.month
                      of
                      1, 3, 5, 7, 8, 10, 12: limit := 31;
                      4, 6, 9, 11: limit := 30;
                      2: if pupil^.get(i)^.subjects[n].date.year = 2016 then
                          limit := 29
                        else
                          limit := 28;
                    end;
                    repeat
                      littleframe(13, 10, 4, 2);
                      gotoxy(14, 11);
                      pupil^.get(i)^.subjects[n].date.day :=
                        StrToInt(readstring(14, 11, 2, parametr, True));
                      if (pupil^.get(i)^.subjects[n].date.day >= limit) or
                        (pupil^.get(i)^.subjects[n].date.day <= 1) then
                      begin
                        gotoxy(37, 19);
                        Write('In ', pupil^.get(i)^.subjects[n].date.month, ' can be', limit,
                          'days , u wrote wrong data');
                      end;
                    until (pupil^.get(i)^.subjects[n].date.day <= limit) and
                      (pupil^.get(i)^.subjects[n].date.day >= 1);
                  end;
                  if parametr = False then
                  begin
                    gotoxy(2, 13);
                    writeln('������ �業��');
                    littleframe(1, 14, 20, 2);
                    pupil^.get(i)^.subjects[n].Mark := readstring(2, 15, 19, parametr, True);
                  end;
                end;
              until parametr = True;
            end;

          9:
          begin
            repeat
              writeln('������ ��� 䠩�� ��� save ���� ������');
              readln(fname);
              Assign(f, fname);
             {$I-}
              rewrite(f);
             {$I+}
              if IOresult <> 0 then
                writeln('�� 㤠���� save 䠩�!');
            until ioresult = 0;
            for i := 1 to pupil^.number do
              Write(f, pupil^.get(i)^);
            Close(f);
          end;

          10:
          begin
            repeat
              writeln('������ ��� 䠩�� ��� ����㧪� ���� ������');
              readln(fname);
              Assign(f, fname);
             {$I-}
              reset(f);
             {$I+}

              if IOresult <> 0 then
                writeln('�� 㤠���� ������ 䠩�!');
            until ioresult = 0;
            fls := filesize(f);
            pupil^.clear;
            for i := 1 to fls do
            begin
              Read(f, bufferstud);
              pupil^.add(bufferstud);
	    end;
	    Close(f);
          end;

          11:
          begin
            repeat
              writeln('������ ��� 䠩�� ��� save ���� ������');
              readln(fname);
              Assign(fnotype, fname);
             {$I-}
              rewrite(fnotype, 1);
             {$I+}
              if IOresult <> 0 then
                writeln('�� 㤠���� save 䠩�!');
            until ioresult = 0;
            fls:=pupil^.number;
            blockwrite(fnotype, fls, sizeof(fls));
            for i := 1 to fls do
            begin
              blockwrite(fnotype, pupil^.get(i)^, sizeof(pupil^.get(i)^));
            end;
            Close(fnotype);
          end;
          12:
          begin
            repeat
              writeln('������ ��� 䠩�� ��� upload ���� ������');
              readln(fname);
              Assign(fnotype, fname);
             {$I-}
              reset(fnotype, 1);
             {$I+}
              if IOresult <> 0 then
                writeln('�� 㤠���� upload 䠩�!')
              else
                writeln('���� ������ ����㦥��');
            until ioresult = 0;
            blockread(fnotype, fls, sizeof(fls));
            pupil^.clear;
            for i := 1 to fls do
            begin
              blockread(fnotype, bufferstud, sizeof(bufferstud));
              pupil^.add(bufferstud);
            end;
            Close(fnotype);
            readkey;
          end;
          13:
          begin
            clrscr;
            if pupil^.number > 0 then
              pupil^.sort;
          end;
        end;

  until (k = 14) or (key = #27);

    dispose(pupil,done);
end.
