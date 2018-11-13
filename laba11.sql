
declare
faculty_r faculty%rowtype;
b1 boolean;
begin
select * into faculty_r from faculty where faculty='ИДиП';
dbms_output.put_line(faculty_r.faculty);
exception
when others
then DBMS_OUTPUT.PUT_LINE(sqlerrm);
end;


declare
faculty_r faculty%rowtype;
begin
select * into faculty_r from faculty;
dbms_output.put_line(faculty_r.faculty);
exception
when others
then DBMS_OUTPUT.PUT_LINE(sqlerrm);
end;
--------
declare
faculty_r faculty%rowtype;
begin
select * into faculty_r from faculty;
dbms_output.put_line(faculty_r.faculty);
exception
when too_many_rows
then DBMS_OUTPUT.PUT_LINE('result include more than 1 row'||sqlcode);
end;
------------
declare
faculty_r faculty%rowtype;
begin
select * into faculty_r from faculty where faculty='XXX';
dbms_output.put_line(faculty_r.faculty);
exception
when no_data_found 
then DBMS_OUTPUT.PUT_LINE('Data not found '||sqlcode);
end;
----

declare
faculty_r faculty%rowtype;
b1 boolean;
begin
select * into faculty_r from faculty where faculty='ИДиП';
b1:=sql%isopen;
dbms_output.put_line(faculty_r.faculty);
if b1 then dbms_output.put_line('true');
else dbms_output.put_line('false');
end if;
exception
when no_data_found 
then DBMS_OUTPUT.PUT_LINE('Data not found '||sqlcode);
end;

------
declare
n pls_integer;
auditorium_cur auditorium%rowtype;
begin
update auditorium set
auditorium = '112-1',
auditorium_name='112-1',
auditorium_capacity=90,
auditorium_type = 'lk'
where auditorium= '103-4';
dbms_output.put_line(auditorium_cur.auditorium_name||
' '|| auditorium_cur.auditorium_capacity||' '||
auditorium_cur.auditorium_type);
n:= sql%rowcount;
DBMS_OUTPUT.PUT_LINE('n= '||n);
commit;
--rollback;
exception 
when others
then dbms_output.put_line(sqlerrm);
end;
--------
declare
n pls_integer;
auditorium_cur auditorium%rowtype;
begin
insert into  auditorium(
auditorium,
auditorium_name,
auditorium_capacity,
auditorium_type)
values('1111-5','1111-5',90,'ЛК');

n:= sql%rowcount;
dbms_output.put_line(auditorium_cur.auditorium_name||
' '|| auditorium_cur.auditorium_capacity||' '||
auditorium_cur.auditorium_type);
DBMS_OUTPUT.PUT_LINE('n= '||n);
commit;
--rollback;
exception 
when others
then dbms_output.put_line(sqlerrm);
end;

select* from auditorium;
----
declare
n pls_integer;
begin
delete auditorium where auditorium = '111-5';
n:=sql%rowcount;
dbms_output.put_line('n= '||n);
rollback;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;
------------------------
select *from teacher;
select count(*) from teacher;

declare 
cursor teacher_cursor is select
teacher, teacher_name, pulpit
from teacher;
n_teacher TEACHER.TEACHER%type;
n_teacher_name TEACHER.TEACHER_NAME%type;
n_pulpit TEACHER.PULPIT%type;
begin
open teacher_cursor;
DBMS_OUTPUT.PUT_LINE('rowcount = '||teacher_cursor%rowcount);
loop
fetch teacher_cursor into
n_teacher,n_teacher_name, n_pulpit;
exit when teacher_cursor%notfound;
dbms_output.put_line(' '||n_teacher||' '||n_teacher_name
||' '||n_pulpit);
end loop;
DBMS_OUTPUT.PUT_LINE('rowcount = '||teacher_cursor%rowcount);
close teacher_cursor;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;

---
declare
cursor curs_subject is select 
subject, subject_name, pulpit from subject;
rec_subject subject%rowtype;
begin
open curs_subject;
DBMS_OUTPUT.PUT_LINE('rowcount = '||curs_subject%rowcount);
fetch curs_subject into rec_subject;
while curs_subject%found
loop
dbms_output.put_line(rec_subject.subject||' '||
rec_subject.pulpit||' '||
rec_subject.subject_name);
fetch curs_subject into rec_subject;
end loop;
DBMS_OUTPUT.PUT_LINE('rowcount = '||curs_subject%rowcount);
close curs_subject;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;

---
select pulpit.pulpit, teacher.teacher_name from pulpit join teacher
on pulpit.pulpit = teacher.pulpit;

declare
cursor teach_subject is select pulpit.pulpit, teacher.teacher_name from pulpit join teacher
on pulpit.pulpit = teacher.pulpit;
rec_subject subject%rowtype;
begin
open teach_subject;
DBMS_OUTPUT.PUT_LINE('rowcount = '||teach_subject%rowcount);
for  rec_subject in teach_subject
loop
dbms_output.put_line(rec_subject.pulpit||' '||
rec_subject.teacher);
end loop;
DBMS_OUTPUT.PUT_LINE('rowcount = '||teach_subject%rowcount);
close teach_subject;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;

---
declare
cursor curs_auditorium(
capacity AUDITORIUM.AUDITORIUM%type)
is select auditorium, auditorium_capacity
from auditorium
where auditorium_capacity >= capacity;
aum auditorium.auditorium%type;
begin
for aum in curs_auditorium(80)
loop
dbms_output.put_line(aum.auditorium||' '|| aum.auditorium_capacity);
end loop;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;

----
variable x refcursor;
declare
 type teacher_type is ref cursor return teacher%rowtype;
 xcurs teacher_type;
 rec_teacher teacher%rowtype;
 begin
 open xcurs for select * from teacher;
 :x:=xcurs;
 exception
 when others
 then dbms_output.put_line(sqlerrm);
 end;
 
 print x;
-------
declare
cursor curs_aut
is select auditorium_type,
cursor (
select auditorium 
from auditorium aum
where aut.auditorium_type = aum.auditorium_type)
from auditorium_type aut;
curs_aum sys_refcursor;
aut auditorium_type.auditorium_type%type;
txt varchar2(1000);
aum auditorium.auditorium%type;
begin
open curs_aut;
fetch curs_aut into aut, curs_aum;
while (curs_aut%found)
loop
 txt:= rtrim(aut)||':';
 loop
 fetch curs_aum into aum;
 exit when curs_aum%notfound;
 txt:=txt||','||rtrim(aum);
 end loop;
 DBMS_OUTPUT.PUT_LINE(txt);
 fetch curs_aut into aut, curs_aum;
 end loop;
 close curs_aut;
 exception
 when others
 then dbms_output.put_line(sqlerrm);
 end;
 -------------
 
 declare 
 cursor curs_auditorium
 (capacity auditorium.auditorium%type)
 is select auditorium, auditorium_capacity
 from auditorium
 where auditorium_capacity >=capacity for update;
 aum auditorium.auditorium%type;
 cty auditorium.auditorium_capacity%type;
 begin
 open curs_auditorium(0);
 fetch curs_auditorium into aum, cty;
 while(curs_auditorium %found)
 loop
 if cty between 40 and 80
 then 
 cty:= cty* 0.9;
 update auditorium
 set auditorium_capacity = cty
 where current of curs_auditorium;
 end if;
 dbms_output.put_line(aum||' '||cty);
 fetch curs_auditorium into aum,cty;
 end loop;
 close curs_auditorium;
 rollback;
 exception
 when others
 then dbms_output.put_line(sqlerrm);
 end;
 
 select* from auditorium;
 ----------
 
 declare 
 cursor curs_auditorium
 (capacity auditorium.auditorium%type)
 is select auditorium, auditorium_capacity
 from auditorium
 where auditorium_capacity >=capacity for update;
 aum auditorium.auditorium%type;
 cty auditorium.auditorium_capacity%type;
 begin
 open curs_auditorium(0);
 fetch curs_auditorium into aum, cty;
 while(curs_auditorium %found)
 loop
 if cty < 31
 then 
 delete auditorium
 where current of curs_auditorium;
 end if;
 
 fetch curs_auditorium into aum,cty;
 end loop;
 close curs_auditorium;
 for pp in curs_auditorium(0)
 loop
 dbms_output.put_line(pp.auditorium||' ' 
 || pp.auditorium_capacity);
 end loop;
 rollback;
 exception
 when others
 then dbms_output.put_line(sqlerrm);
 end;
 
 select* from auditorium;
 -------
select rtrim(teacher), rowid,
substr(rowid,1,7)"сегмент",
substr(rowid,8,3)"№ файла",
substr(rowid,11,6)"№ блока",
substr(rowid,16,3)"№ строки"
from teacher;
-------------
declare 
cursor teacher_cursor is select
teacher, teacher_name, pulpit
from teacher;
n_teacher TEACHER.TEACHER%type;
n_teacher_name TEACHER.TEACHER_NAME%type;
n_pulpit TEACHER.PULPIT%type;
i int;
begin
open teacher_cursor;
DBMS_OUTPUT.PUT_LINE('rowcount = '||teacher_cursor%rowcount);
for i in 1 .. 10
loop
fetch teacher_cursor into
n_teacher,n_teacher_name, n_pulpit;
exit when teacher_cursor%notfound;

dbms_output.put_line(' '||n_teacher||' '||n_teacher_name
||' '||n_pulpit);
if mod(i,3)=0
then
dbms_output.put_line('///////////');
end if;
end loop;
DBMS_OUTPUT.PUT_LINE('rowcount = '||teacher_cursor%rowcount);
close teacher_cursor;
exception
when others 
then dbms_output.put_line(sqlerrm);
end;
