unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, PrintersDlgs, Forms, Controls, Graphics,
  Dialogs, Unit2, StdCtrls, ExtCtrls,IniFiles,XMLread,DOM,
  XMLWrite,printers,syncobjs;

type

  { TForm1 }



  TForm1 = class(TForm)
		    Button1: TButton;
		    Button2: TButton;
		    Button3: TButton;
		    Button4: TButton;
		    PrintDialog1: TPrintDialog;
		    printeras: TButton;
		    Label1: TLabel;
		    Label2: TLabel;
		    Label3: TLabel;
		    Label4: TLabel;
		    LoadINI: TButton;
		    Caption1: TEdit;
		    left1: TEdit;
		    top1: TEdit;
		    width1: TEdit;
    HideSearch: TButton;
    ChangeStud: TButton;
    forfind: TEdit;
    ForSurname: TLabel;
    ForName: TLabel;
    ForSecondName: TLabel;
    ForGroup: TLabel;
    ForSearch: TLabel;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    Surname: TEdit;
    name1: TEdit;
    SecondName: TEdit;
    Groupnumber: TEdit;
    Finish: TButton;
    deleteStud: TButton;
    ShowAllStudents: TButton;
    AddStud: TButton;
    DeleteSubject: TButton;
    Find: TButton;
    AddSubject: TButton;
    ListBox1: TListBox;
    SaveTypezFile: TButton;
    ChangeSubject: TButton;
    SaveunTpzd: TButton;
    LoadUntzd: TButton;
    Sort: TButton;
    LoadTpzed: TButton;
    procedure AddStudClick(Sender: TObject);
    procedure AddSubjectClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure name1Change(Sender: TObject);
    procedure printerasClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);

    procedure LoadINIClick(Sender: TObject);

    procedure FinishClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure HideSearchClick(Sender: TObject);
    procedure ChangeStudClick(Sender: TObject);
    procedure deleteStudClick(Sender: TObject);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
		      State: TDragState; var Accept: Boolean);
    procedure Panel1Click(Sender: TObject);
    procedure ShowAllStudentsClick(Sender: TObject);
    procedure FindClick(Sender: TObject);
    procedure forfindChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure LoadTpzedClick(Sender: TObject);
    procedure LoadUntzdClick(Sender: TObject);
    procedure SaveTypezFileClick(Sender: TObject);
    procedure SaveunTpzdClick(Sender: TObject);
    procedure SortClick(Sender: TObject);
    procedure SurnameChange(Sender: TObject);

   // procedure save_untyped(filename : string);

  private
    { private declarations }
    pupil: PDataContainer;
    sub: array [1..100] of subject;
    itemnum: integer;
    procedure showdb;

  public
    { public declarations }
  end;
  type
TMyThread = class(TThread)
private
{ Private declarations }
protected
procedure Execute; override;
end;

var
  TCS: TCriticalSection;
  Mythread: TMyThread;

var
  IniFile: TIniFile;
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.showdb;
var
  s: string;
  i: integer;
begin
  ListBox1.Clear;
  for  i := 1 to pupil^.number do
  begin
    s := '№' + ' ' + IntToStr(i) + ' ' + pupil^.get(i)^.Surname + ' ' +
      pupil^.get(i)^.Name + ' ' + pupil^.get(i)^.Secondname + ' ' +
      IntToStr(pupil^.get(i)^.Group);

    listbox1.Items.Add(s);

  end;

end;



procedure TForm1.FinishClick(Sender: TObject);
begin
      Form1.Close;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  try
    IniFile.Free;
    except showmessage('error!');

    end;
end;

procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String
		  );
  var
  fnotype: file;
  fls, i: integer;
  bufferstud: anketa;
  begin
    Assignfile(fnotype, FileNames[0]);
             {$I-}
    reset(fnotype, 1);
             {$I+}
    if IOresult <> 0 then
      ShowMessage('Не удалось upload файл!')
    else
    begin
      ShowMessage('База данных загружена');
      if ioresult = 0 then
      begin
        blockread(fnotype, fls, sizeof(fls));
        pupil^.Clear;
        for i := 1 to fls do
        begin
          blockread(fnotype, bufferstud, sizeof(bufferstud));
          pupil^.add(bufferstud);
        end;
        closefile(fnotype);
      end;
    end;
    showdb;
  end;







procedure TForm1.ShowAllStudentsClick(Sender: TObject);
begin
  showdb;
end;

procedure TForm1.FindClick(Sender: TObject);
var
  i: integer;
  s, s1, s3: string;
begin
  s := forfind.Text;
  listbox2.Visible := True;
  listbox2.Clear;
  for i := 1 to pupil^.number do
  begin
    s1 := copy(pupil^.get(i)^.surname, 1, length(s));
    if s1 = s then
    begin
      s3 :=
        '№' + ' ' + IntToStr(i) + ' ' + pupil^.get(i)^.Surname + ' ' +
        pupil^.get(i)^.Name + ' ' + pupil^.get(i)^.Secondname + ' ' +
        IntToStr(pupil^.get(i)^.Group);


    listbox2.Items.Add(s3);


    end;
  end;
end;

procedure TForm1.forfindChange(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
  pupil := new(PArrayContainer, init);
  itemnum := -1;
  IniFile:=TIniFile.Create('C:\New\myini.ini');
  except showmessage('error!');

  end;
  tcs := tcriticalsection.create;
end;



procedure TForm1.ListBox1Click(Sender: TObject);
begin
  if listbox1.ItemIndex > -1 then
  begin

    Surname.Text := pupil^.get(listbox1.ItemIndex + 1)^.surname;
    secondname.Text := pupil^.get(listbox1.ItemIndex + 1)^.Secondname;
    name1.Text := pupil^.get(listbox1.ItemIndex + 1)^.Name;
    groupnumber.Text := IntToStr(pupil^.get(listbox1.ItemIndex + 1)^.Group);
    itemnum := listbox1.ItemIndex;
  end;
end;






procedure TForm1.LoadTpzedClick(Sender: TObject);
var
  f: text;
  fls, i: integer;
  bufferstud: anketa;
begin
//   if opendialog1.Execute = True then
//  begin
//    Assign(f, opendialog1.FileName);
//             {$I-}
//    reset(f);
//             {$I+}
//    if IOresult <> 0 then
//      ShowMessage('Не удалось upload файл!')
//    else
//    begin
//      ShowMessage('База данных загружена');
//      if ioresult = 0 then
//      begin
//            fls := filesize(f);
//            pupil^.clear;
//            for i := 1 to fls do
//            begin
//              Read(f, bufferstud);
//              pupil^.add(bufferstud);
//	    end;
//	    Close(f);
//          end;
//    end;
//    showdb;
//end;
//
//end;
//begin
//
end;

procedure TForm1.LoadUntzdClick(Sender: TObject);
var
  fnotype: file;
  fls, i: integer;
  bufferstud: anketa;
begin
  if opendialog1.Execute = True then
  begin
    Assignfile(fnotype, opendialog1.FileName);
             {$I-}
    reset(fnotype, 1);
             {$I+}
    if IOresult <> 0 then
      ShowMessage('Не удалось upload файл!')
    else
    begin
      ShowMessage('База данных загружена');
      if ioresult = 0 then
      begin
        blockread(fnotype, fls, sizeof(fls));
        pupil^.Clear;
        for i := 1 to fls do
        begin
          blockread(fnotype, bufferstud, sizeof(bufferstud));
          pupil^.add(bufferstud);
        end;
        closefile(fnotype);
      end;
    end;
    showdb;
  end;

end;

procedure TForm1.SaveTypezFileClick(Sender: TObject);
 var f:text;
   i:integer;
begin
//   if savedialog1.Execute = True then
//  begin
//                  Assign(f, savedialog1.FileName);
//             {$I-}
//              rewrite(f);
//             {$I+}
//              if IOresult <> 0 then
//                writeln('Не удалось save файл!')
//            else
//           if  ioresult = 0 then
//           begin
//            for i := 1 to pupil^.number do
//              Write(f, pupil^.get(i)^);
//            Close(f);
//	   end;
//end;
//
end;



procedure TForm1.SaveunTpzdClick(Sender: TObject);
var
  fnotype: file;
  fls, i: integer;
begin
  if savedialog1.Execute = True then
  begin
    //ShowMessage(savedialog1.FileName);
    AssignFile(fnotype, savedialog1.FileName);

                 {$I-}
    rewrite(fnotype, 1);
             {$I+}
    if IOresult <> 0 then
      ShowMessage('Не удалось save файл!')
    else
    if (ioresult = 0) then
    begin
      fls := pupil^.number;
      blockwrite(fnotype, fls, sizeof(fls));
      for i := 1 to fls do

        blockwrite(fnotype, pupil^.get(i)^, sizeof(pupil^.get(i)^));
      CloseFile(fnotype);
    end;
    //if IOresult <> 0 then

  end;

end;

procedure TForm1.SortClick(Sender: TObject);
begin
  pupil^.sort;
  showdb;
end;

procedure TForm1.SurnameChange(Sender: TObject);
begin

end;

procedure TForm1.deleteStudClick(Sender: TObject);
begin
  if (itemnum > -1) and (itemnum < pupil^.number) then
  begin
    pupil^.Delete(itemnum + 1);
    showdb;
  end;
end;

procedure TForm1.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
s: string;
begin
if Source = ListBox1 then
begin
 s := ListBox1.Items[ListBox1.ItemIndex];
 ListBox1.Items.Delete(ListBox1.ItemIndex);
 ListBox1.Items.Insert(ListBox1.ItemAtPos(Point(X, Y), False), s);

end;
end;

procedure TForm1.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
		  State: TDragState; var Accept: Boolean);
begin
      Accept := (Source is TListBox) and ((Source as TListBox).ItemIndex >= 0);
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

procedure TForm1.AddStudClick(Sender: TObject);
var
  bufferstud: anketa;
begin
  bufferstud.Surname := Surname.Text;
  bufferstud.Secondname := secondname.Text;
  bufferstud.Name := name1.Text;
  bufferstud.Group := strtointdef(groupnumber.Text, 1);

  pupil^.add(bufferstud);

  showdb;
end;

procedure TForm1.AddSubjectClick(Sender: TObject);
begin
                 // showmessage(inputbox('a','b','c'));
end;

procedure TMyThread.Execute;
begin
TCS.enter;
try
IniFile.WriteString('FormInfo','Caption',form1.Caption);
IniFile.WriteInteger('FormInfo','Left',form1.Left);
IniFile.WriteInteger('FormInfo','Top',form1.Top);
IniFile.WriteInteger('FormInfo','Width',form1.Width);
//IniFile.WriteDateTime('FormInfo', 'Date',form1.Date);
except
on E: Exception do
ShowMessage('Невозможно прочесть файл');
end;
TCS.leave;

end;


procedure TForm1.Button1Click(Sender: TObject);

  begin

    Mythread:=TMythread.Create(true);
    Mythread.freeonterminate := true;
    Mythread.priority:= tplowest;
    Mythread.Start;



end;

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

procedure TForm1.Button3Click(Sender: TObject);
 var
  document : TXMLDocument;
  element: TDOMElement;
  root : TDOMNode;
  anket:anketa;
begin
  try
    ReadXMLFile(document,'C:\New\Myxml.xml' );
    root := document.FirstChild;

    element := TDOMElement(root.FindNode('students').FirstChild);
    while element <> nil do
    begin
                  Anket.Name:=element.GetAttribute('first_name');
                  Anket.Secondname:=element.GetAttribute('second_name');
                  Anket.Surname:=element.GetAttribute('surname_name');
                  //element.GetAttribute('group');
                    pupil^.add(anket);
      element := TDOMElement(element.NextSibling);
    end;
    document.free;
    showdb;
  except
    on E : Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;


procedure TForm1.Button4Click(Sender: TObject);
var
  document : TXMLDocument;
  root, studentsNode, subjectsNode : TDOMNode;
  element : TDOMElement;
  tmp_string : string;
  i : Integer;
begin
  try
    document := TXMLDocument.Create;
    root := document.CreateElement('database');
    studentsNode := document.CreateElement('students');
    for i := 1 to pupil^.number  do
    begin
      element := document.CreateElement('teacher');
      element.SetAttribute('first_name', pupil^.get(i)^.name);
      element.SetAttribute('surname_name', pupil^.get(i)^.surname);
      element.SetAttribute('second_name', pupil^.get(i)^.secondname);
      //element.SetAttribute('group_name', pupil^.get(i)^.group);
      studentsNode.AppendChild(element);
    end;



    root.AppendChild(studentsNode);
    document.AppendChild(root);

    WriteXMLFile (document, 'C:\New\Myxml.xml');
    document.Free();

  except
    on E : Exception do MessageDlg(e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 tcs.free;
end;

procedure TForm1.name1Change(Sender: TObject);
begin

end;

procedure TForm1.printerasClick(Sender: TObject);
var i,y,c:integer;
    Prn:TextFile;

begin
    if printdialog1.execute then
    begin
     with printer do
begin
    beginDoc;
  Canvas.Font.Name:='Times New Roman';
  Canvas.Font.Size:=12;
   y:=0;

   for i:=0 to ListBox1.Items.Count-1 do
   begin

     y:=y+Canvas.TextHeight('W');
    Canvas.TextOut(0,y,ListBox1.Items[i]);

  if  i=60   then
  begin
   newpage;
   y:=0;
  end;

end;
   EndDoc;


     end;

    end;

end;



procedure TForm1.Label2Click(Sender: TObject);
begin

end;


procedure TForm1.LoadINIClick(Sender: TObject);
var ddate :  TDateTime;
begin
       ddate:=0.0;
       try
       Panel1.Visible:=true;
       Caption1.Text:=IniFile.ReadString('FormInfo','Caption','хз');
       Left1.Text:=IniFile.ReadString('FormInfo','Left','хз');
       top1.Text:=IniFile.ReadString('FormInfo','Top','хз');
       width1.Text:=IniFile.ReadString('FormInfo','Width','хз');
       //date1.Text:=IniFile.Strtofloat('FormInfo','Date',ddate);

       except showmessage('There`s a little mistake...');
       end;
end;



procedure TForm1.HidesearchClick(Sender: TObject);
begin
  ListBox2.Visible := False;

end;




procedure TForm1.ChangeStudClick(Sender: TObject);
begin
  if (itemnum > -1) and (itemnum < listbox1.Items.Count) then
  begin

    pupil^.get(itemnum + 1)^.surname := Surname.Text;
    pupil^.get(itemnum + 1)^.Secondname := secondname.Text;
    pupil^.get(itemnum + 1)^.Name := name1.Text;
    pupil^.get(itemnum + 1)^.Group := strtointdef(groupnumber.Text, 1);

    showdb;
  end;
end;

end.
