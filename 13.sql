declare
type tperson is record
(
name teacher.teacher_name%type,
pulpit teacher.pulpit%type
);
rec tperson;
procedure getperson(code teacher.pulpit%type, r out tperson)
is
begin
select teacher.teacher_name, teacher.pulpit into r
from
teacher
where pulpit = code;
end getperson;

begin
 getperson('ฮย',rec);
 dbms_output.put_line(rec.name||' '||rec.pulpit);
 exception
 when others then dbms_output.put_line(sqlerrm);
 end;
 
 ------
 declare
type tperson is record
(
teach_count int
);
rec tperson;
function getcount(code teacher.pulpit%type ) return tperson
is
r tperson;
begin
select count(*) into r
from
teacher
where pulpit = code;
return r;
end getcount;
begin
 rec:=getcount('ศั่า');
 dbms_output.put_line(rec.teach_count);
 exception
 when others then dbms_output.put_line(sqlerrm);
 end;
 ------
 select* from subject;

create or REPLACE procedure getsubject(code subject.pulpit%type)
is
birt_row subject%rowtype;
cursor curs_subject is select *
from subject
where pulpit = code;
begin
open curs_subject;
fetch curs_subject into birt_row;
while curs_subject%found
loop
dbms_output.put_line(birt_row.subject_name||' '|| birt_row.pulpit);
fetch curs_subject into birt_row;
end loop;
close curs_subject;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;

begin
 getsubject('ศั่า');
  exception
 when others then dbms_output.put_line(sqlerrm);
 end;
 -----------------------------------
 declare
type tsubject is record
(
subj_count int
);
rec tsubject;
function getcount1(code subject.pulpit%type ) return tsubject
is
r tsubject;
begin
select count(*) into r
from
subject
where pulpit = code;
return r;
end getcount1;
begin
 rec:=getcount1('ศั่า');
 dbms_output.put_line(rec.subj_count);
 exception
 when others then dbms_output.put_line(sqlerrm);
 end;
 
 -----------------
create or REPLACE procedure getfaculty(code faculty.faculty%type)
is
birt_row teacher%rowtype;
cursor curs_teacher is select *
from teacher
where faculty = code;
begin
open curs_teacher;
fetch curs_teacher into birt_row;
while curs_teacher%found
loop
dbms_output.put_line(birt_row.teacher_name||' '|| birt_row.faculty);
fetch curs_teacher into birt_row;
end loop;
close curs_teacher;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;

begin
 getfaculty('ิศา');
  exception
 when others then dbms_output.put_line(sqlerrm);
 end;
 
 ------
 declare
type tperson is record
(
teach_count int
);
rec tperson;
function getcount(code faculty.faculty%type ) return tperson
is
r tperson;
begin
select count(*) into r
from
teacher
where faculty = code;
return r;
end getcount;
begin
 rec:=getcount('ิศา');
 dbms_output.put_line(rec.teach_count);
 exception
 when others then dbms_output.put_line(sqlerrm);
 end;
 ----------------
 CREATE OR REPLACE PACKAGE TeachersP as
 type tperson is record
(
name teacher.teacher_name%type,
pulpit teacher.pulpit%type
);
type tsubject is record
(
subj_count int
);
 function getcount(code faculty.faculty%type ) return tperson;
 function getcount1(code subject.pulpit%type ) return tsubject;
  procedure getfaculty(code faculty.faculty%type);
  procedure getsubject(code subject.pulpit%type);
  end TeachersP;
  
  select* from user_errors;
  
  declare 
  rec teachersP.tperson;
  begin
  rec.name := 'AAA';
  rec.pulpit := 'ISIT';
  dbms_output.put_line(rec.name||' '||rec.pulpit);
  TeachersP.getcount('ศั่า');
  end;
  
  
  create or replace package body TeachersP as
   function getcount(code faculty.faculty%type ) return tperson is teach_count int;
type tperson is record
(
teach_count int
);
r tperson;
begin
select count(*) into r
from teacher where pulpit = code;
return r;
end ;
end;

create or replace function minn(a in number, b in number) return number is 
begin
return (a+b);
end;

create or replace package aaa is
 function minn(a in number, b in number) return number;
 end;
 
 create or replace package body aaa is
 function minn(a in number, b in number) return number is 
begin
return (a+b);
end minn;
end aaa;

begin
dbms_output.put_line(to_char(aaa.minn(10,2)));
end;

 
 