unit records;

{$mode objfpc}{$H+}

interface


type
  Tdate = record
    month: integer;
    year: integer;
    day: integer;
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
    subjects: array [1..100] of subject;
  end;
  PAnketa = ^anketa;

type
  DataItem = integer;
  //DataArray = array [1..100] of anketa;
  DataContainer = object
    constructor init;
    procedure add(var a: anketa); virtual;
    function get(i: integer): PAnketa; virtual;
    function number: integer; virtual;
    procedure sort; virtual;
    procedure Delete(i: integer); virtual;
    procedure Clear; virtual;
    destructor done; virtual;
  end;
  PDataContainer = ^DataContainer;


  ArrayContainer = object(DataContainer)
    Data: array [1..100] of anketa;
    n: integer;

    constructor init;
    procedure add(var a: anketa); virtual;
    function get(i: integer): PAnketa; virtual;
    function number: integer; virtual;
    procedure sort; virtual;
    procedure Delete(i: integer); virtual;
    procedure Clear; virtual;
    destructor done; virtual;
  end;
  PArrayContainer = ^ArrayContainer;


  Tnode = object
    a: anketa;
    Next: ^TNode;
  end;
  PNode = ^Tnode;

  ListContainer = object(DataContainer)
    n: integer;
    First: pNode;

    constructor init;
    function newnode(var Value: anketa; Next: PNode): PNode;
    procedure add(var a: anketa); virtual;
    function get(i: integer): PAnketa; virtual;
    function number: integer; virtual;
    procedure sort; virtual;
    procedure Delete(i: integer); virtual;
    procedure Clear; virtual;
    destructor done; virtual;
  end;
  PListContainer = ^ListContainer;

implementation

procedure DataContainer.Delete(i: integer);
begin

end;

procedure DataContainer.Clear;
begin

end;

constructor DataContainer.init;
begin

end;

procedure DataContainer.add(var a: anketa);

begin
end;

function DataContainer.get(i: integer): PAnketa;
begin
  get := nil;
end;

function DataContainer.number: integer;
begin
  number := 0;
end;

procedure DataContainer.sort;
begin

end;

destructor Datacontainer.done;
begin

end;

{__________________________________________________}

procedure ArrayContainer.Delete(i: integer);
var
  j: integer;
begin
  for j := i to n - 1 do
    Data[j] := Data[j + 1];
  n := n - 1;
end;

procedure ArrayContainer.Clear;
begin
  n := 0;
end;

constructor ArrayContainer.init;
begin
  n := 0;
end;

procedure ArrayContainer.add(var a: anketa);
begin
  n := n + 1;
  Data[n] := a;

end;

function ArrayContainer.get(i: integer): PAnketa;
begin
  get := @(Data[i]);
end;

function ArrayContainer.number: integer;
begin
  number := n;
end;

procedure ArrayContainer.sort;
var
  i, j: integer;
  x: anketa;
begin
  for i := 2 to n do
  begin
    for j := n downto i do
      if Data[j - 1].Surname > Data[j].Surname then
      begin
        x := Data[j - 1];
        Data[j - 1] := Data[j];
        Data[j] := x;
      end;
  end;
end;

destructor ArrayContainer.done;
begin

end;

{__________________________________________________}

function ListContainer.newnode(var Value: anketa; Next: PNode): PNode;
var
  p: PNode;
begin
  new(p);
  p^.a := Value;
  p^.Next := Next;
  newnode := p;
end;

procedure ListContainer.Delete(i: integer);
var
  p, p1, p2: PNode;
  Count: integer;
  fldel: boolean;
begin
  p := First;
  Count := 1;
  if p <> nil then
    if i = 1 then
    begin
      p1 := p^.Next;
      dispose(p);
      First := p1;
      n := n - 1;
    end
    else
    begin
      p1 := First^.Next;
      fldel := False;
      while (p1 <> nil) or (fldel = False) do
      begin
        Count := Count + 1;
        if (Count = i) then
        begin
          p2 := p1^.Next;
          dispose(p1);
          p^.Next := p2;
          p1 := p2;
          fldel := True;
          n := n - 1;
        end
        else
        begin
          p := p1;
          p1 := p1^.Next;
        end;
      end;
    end;
end;

procedure ListContainer.Clear;
var
  p1, p2: PNode;
begin
  p1 := First;
  while not (p1 = nil) do
  begin
    p2 := p1^.Next;
    dispose(p1);
    p1 := p2;
  end;

  n := 0;
  First := nil;
end;

constructor ListContainer.init;
begin
  n := 0;
  First := nil;
end;

procedure ListContainer.add(var a: anketa);
var
  p: PNode;
begin
  if First = nil then
    First := newnode(a, nil)
  else
  begin
    p := First;
    while p^.Next <> nil do
      p := p^.Next;
    p^.Next := newnode(a, nil);
  end;
  n := n + 1;
end;

function ListContainer.get(i: integer): PAnketa;
var
  j: integer;
  p: Pnode;
begin
  p := First;
  j := 1;
  while (p <> nil) and (j <> i) do
  begin
    p := p^.Next;
    j := j + 1;
  end;
  if p = nil then
  begin
    writeln('error - wrong number of element');
    get := nil;
  end
  else
    get := @p^.a;
end;

function ListContainer.number: integer;
begin
  number := n;
end;

procedure ListContainer.sort;
var
  i, j: integer;
  x: anketa;
  p, p1: pnode;
  flag: boolean;
begin
  flag := True;
  while flag do
  begin
    flag := False;
    p := First;
    if p <> nil then
    begin
      p1 := p^.Next;

      while p1 <> nil do
      begin
        if p1^.a.Surname < p^.a.Surname then
        begin
          x := p1^.a;
          p1^.a := p^.a;
          p^.a := x;
          flag:=true;
        end;
        p:=p1;
        p1:=p1^.Next;
      end;
    end;
  end;
end;

destructor Listcontainer.done;
begin
  Clear;
end;



end.
