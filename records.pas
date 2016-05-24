unit records;

{$mode objfpc}{$H+}

interface


type
       Tdate=record
         month:integer;
         year:integer;
         day:integer;
       end;

type
  subject = record
    lesson: string [20];
    Mark: string [20];
    date: Tdate;
  end;

type
  anketa = record
    Surname: string [20];
    Name: string [20];
    Secondname: string [20];
    Group: integer;
    numstudent: integer;
    subjects:array [1..100] of subject;
  end;

type
  DataItem = integer;
  DataArray = array [1..100] of anketa;



implementation

end.

