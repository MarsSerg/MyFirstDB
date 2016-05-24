{****
 * TODO
 *   - git
 *   - robodoc
 *   - анти ord
 *   - 25 строк
 *   -
 *}
{1-1. База данных студентов группы.
Поля: фамилия, имя, отчество, пол, возрастаст.
Каждому студенту соответствует таблица оценок(для приложения к диплому)
с полями: предмет, оценка (отлично, хорошо, удовлетворительно, зачет), дата сдачи.
Сортировка по ФИО, нахождение информации по ФИО.}
program BD1;

uses
  crt, tips, Frames, Cin, cinfornumbers;

type
  subject = record
    lesson: string [20];
    Mark: (Exellent, Normal, Satisfactorily, Offset);
    Date: string [20];
  end;

type
  anketa = record
    Surname: string [20];
    Name: string [20];
    Secondname: string [20];
    Group: 201..208;
    numstudent: integer;
    subjects:array [1..100] of subject;
  end;
type
  DataItem = integer;
  DataArray = array [1..100] of anketa;


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

  {***f* writemenu
 *  NAME
 *  writemenu
 *  DESCRIPTION
 *  displays menu
 *  ARGUMENTS
 *   menu -- all points in menu
 ******}
  //процедура вывода меню
type
  enter = array [1..12] of string;
  //  label 9,10,11;
  procedure writemenu(menu: integer);
  var
    matrix: ENTER;
    i, j, x: integer;
    //TODO: Элементы - в массив
    //все в цикл
  begin
    matrix[1] := '1- вывести всех студентов';
    matrix[2] := '2- добавить нового студента';
    matrix[3] := '3- удалить студента';
    matrix[4] := '4- изменить студента';
    matrix[5] := '5- поиск';
    matrix[6] := '6- добавить новый предмет';
    matrix[7] := '7- удалить предмет';
    matrix[8] := '8- изменить предмет';
    matrix[9] := '9- сохранить файл';
    matrix[10] := '10- открыть из файла';
    matrix[11] := '11- сортировать по алфавиту';
    matrix[12] := '12-выход';
    cursoroff;
    for x := 1 to 12 do
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
  //сортировка пузырьковым методом
  procedure Bubble(var item: DataArray; Count: integer);
  var
    i, j: integer;
    x: anketa;
  begin
    for i := 2 to Count do
    begin
      for j := Count downto i do
        if item[j - 1].Surname > item[j].Surname then
        begin
          x := item[j - 1];
          item[j - 1] := item[j];
          item[j] := x;
        end;
    end;
  end;


  //основная программа
const
  fname = 'Students.txt';
var
  f: file of anketa;
  Student: Anketa;
  Count, p: word;
  g, default, s: string;
  x3, y3, x2, y2, h, w, x, y, j, k, i, n, nu, numberpupils,error, amount: integer;
  c, exit,ch, key: char;
  pupil: array [1..100] of anketa;
  sub: array [1..100] of subject;
  flag, parametr: boolean;
  t, t2: integer;
  test: DataArray;
  er:integer;

begin
  error:=0;
  numberpupils := 0;
  x3 := 1;
  y3 := 18;
  x2 := 15;
  y2 := 23;
  w := 40;
  h := 13;
  x := 9;
  y := 1;
  k := 1;
  repeat
    clrscr;
    tip(x2, y2,tipstring);
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
          k := 12;
      end;
      if key = #80 then
      begin
        k := k + 1;
        if k = 13 then
          k := 1;
      end;
      writemenu(k);
      gotoxy(1, k);
    until (key = #13) or (key = #27);
    gotoxy(1, 17);
    if (key = #13)  then
    if (k <> 12) and (key <> #27) then

    case k of
      1:
      begin
        if numberpupils < 0 then
        Write('Нет ни одного ученика')
        else
        i:=1;
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
      end;
    end;
  until false;

      end;

      2:
      begin
        writeln('Введите количество учеников');
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
            tip(x2, y2,tipstring2);
            gotoxy(x + 14, y + 1);
            textcolor(2);
            writeln('Введите информацию о ', i, ' студенте');
            for j := 1 to 80 do
              Write(#196);
            if parametr = False then
            begin
              gotoxy(x, y + 4);
              Inc(Count);
              writeln('Введите фамилию');
              littleframe(1, 6, 20, 2);
              gotoxy(2, 7);
              pupil[numberpupils + 1].Surname := readstring(2, 7, 19, parametr,false);
            end;

            if parametr = False then
            begin
              gotoxy(x, y + 8);
              writeln('Введите имя');
              littleframe(1, 10, 20, 2);
              gotoxy(2, 11);
              pupil[numberpupils + 1].Name := readstring(2, 11, 19, parametr,false);
            end;
            if parametr = False then
            begin
              gotoxy(x, y + 12);
              writeln('Введите отчество');
              littleframe(1, 14, 20, 2);
              gotoxy(2, 15);
              pupil[numberpupils + 1].secondName := readstring(2, 15, 19, parametr,false);
            end;
            if parametr = False then
            begin
              gotoxy(x, y + 16);
              writeln('Введите номер группы');
              littleframe(1, 18, 20, 2);
              gotoxy(2, 19);
              repeat
              s := readstring(2, 19, 19, parametr,true);
              val(s,er,error);
              gotoxy(37,19);
              if error<>0 then
              begin
              gotoxy(2, 19);
              write('':19);
              gotoxy(37,19);
	      write ('введите номер группы числом!');
              end
                else
                  write ('':40);
                 pupil[numberpupils + 1].Group:=er;
	      until error = 0 ;
              end;

          until parametr = True;
          numberpupils := numberpupils + 1;
        end;
        clrscr;
      end;

      3:
      begin
        if numberpupils > 0 then
        begin
          clrscr;
          repeat
            writeln('Введите номер ученика');
            readln(t);
            if (t < 1) or (t > numberpupils) then
              writeln('Неправильный номер ученика');
          until (t >= 1) and (t <= numberpupils);
          flag := False;
          for i := t to numberpupils - 1 do
            pupil[i] := pupil[i + 1];
          numberpupils := numberpupils - 1;
        end
        else
        begin
          clrscr;
          writeln('Неправильный номер ученика');
          readkey;
        end;
      end;
      4: if numberpupils > 0 then
      begin
          repeat
            writeln('Введите номер ученика для изменения');
            readln(i);
            if (i < 1) or (i > numberpupils) then
              writeln('неправильный номер ученика');
          until (i >= 1) and (i <= numberpupils);
        clrscr;
        parametr := False;
        repeat
          tip(x2, y2,tipstring2);
          gotoxy(x + 14, y + 1);
          textcolor(2);
          writeln('Введите информацию о ', i, ' студенте');
          for j := 1 to 80 do
            Write(#196);
          if parametr = False then
          begin
            begin
              gotoxy(x, y + 4);
              writeln('Введите фамилию');
              littleframe(1, 6, 20, 2);
              gotoxy(2, 7);
              pupil[i].Surname := readstring(2, 7, 19, parametr,false);
            end;
            if parametr = False then
            begin
              gotoxy(x, y + 8);
              writeln('Введите имя');
              littleframe(1, 10, 20, 2);
              gotoxy(2, 11);
              pupil[i].Name := readstring(2, 11, 19, parametr,false);
            end;
            if parametr = False then
            begin
              gotoxy(x, y + 12);
              writeln('Введите отчество');
              littleframe(1, 14, 20, 2);
              gotoxy(2, 15);
              pupil[i].secondName := readstring(2, 15, 19, parametr,false);
            end;
            if parametr = False then
                       begin
              gotoxy(x, y + 16);
              writeln('Введите номер группы');
              littleframe(1, 18, 20, 2);
              gotoxy(2, 19);
             // s := readstring(2, 19, 19, parametr);
              repeat
              s := readstring(2, 19, 19, parametr,true);
              val(s,er,error);
              gotoxy(37,19);
              if error<>0 then
              begin
              gotoxy(2, 19);
              write('':19);
              gotoxy(37,19);
	      write ('введите номер группы числом!');
              end
                else
                  write ('':40);
                 pupil[numberpupils + 1].Group:=er;
	      until error = 0 ;

	      end;
            end;
        until parametr = True;
      end;
      6:if numberpupils>0 then
      begin
      repeat
            writeln('Введите номер ученика для изменения');
            readln(i);
            if (i < 1) or (i > numberpupils) then
              writeln('неправильный номер ученика');
          until (i >= 1) and (i <= numberpupils);
         clrscr;
        parametr := False;
        repeat
          tip(x2, y2,tipstring2);
          gotoxy(x + 14, y + 1);
          textcolor(2);
          writeln('Введите информацию о ', i, ' студенте');
          for j := 1 to 80 do
            Write(#196);
          if parametr = False then
          begin
            begin
              gotoxy(x, y + 4);
              writeln('Введите предмет');
              littleframe(1, 6, 20, 2);
              gotoxy(2, 7);
              sub[i].lesson := readstring(2, 7, 19, parametr,false);

         end;
	  end;
	until parametr = true;

      end;
      9: if numberpupils > 0 then
        begin
          Assign(f, fname);
     {$I-}
          rewrite(f);
      {$I+}
          if IOResult = 0 then
            Write(f, student);
          Close(f);
          reset(f);
        end;
      10:
      begin
        clrscr;
        if numberpupils > 0 then
        begin
          clrscr;
          i := 1;
          while not EOF(f) do
          begin
            Read(f, student);
            if i > 1 then
              writeln('Студент', i, '- ', pupil[numberpupils].Surname,
                ' ', pupil[numberpupils].Name, ' ',
                pupil[numberpupils].secondName, ' ', pupil[numberpupils].Group);
            i := I + 1;
          end;
          Close(f);
        end
        else
          Write('Нет ни одного ученика');
        readkey;
      end;
      11:
      begin
        clrscr;
        if numberpupils > 0 then
          Bubble(pupil, numberpupils);
      end;
    end;

  until (k = 12) or (key = #27);
end.
end;
