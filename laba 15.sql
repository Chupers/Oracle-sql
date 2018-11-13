create table test(i int primary key);
drop table test;

declare 
k int :=0;
begin
while k<10
loop
insert into test(i)
values (k);
k:= k+1;
end loop;
end;

select * from test;

create or replace trigger Input_trig
after insert on test
begin
dbms_output.put_line('insert trigger');
end;

create or replace trigger Delete_trig
after delete on test
begin
dbms_output.put_line('delete trigger');
end;

create or replace trigger Update_trig
after update on test
begin
dbms_output.put_line('update trigger');

end;

update test set i = 15;
delete test;

create table AUDITS(OperationDate date,OperationType nvarchar2(50), TriggerName nvarchar2(50));



create or replace trigger Input_for_each_trig
after insert on test
for each row
begin
dbms_output.put_line('insert trigger');
end;

create or replace trigger Update_for_each_trig
after update on test
for each row
begin
dbms_output.put_line('Update trigger');
end;


create or replace trigger daelete_for_each_trig
after delete on test
for each row
begin
dbms_output.put_line('delete trigger');
end;

drop trigger daelete_for_each_trig;
drop trigger Input_for_each_trig;
drop trigger Update_for_each_trig;
drop trigger Input_trig;
drop trigger Delete_trig;
drop trigger Update_trig;

create or replace trigger new_trigg
after insert or update  or delete on test
begin
if inserting then
dbms_output.put_line('insert');
elsif updating then
dbms_output.put_line('update');
elsif deleting then
dbms_output.put_line('delete');
end if;
end;

drop trigger new_trigg1;

create or replace trigger new_trigg1
before insert or update  or delete on test
begin
if inserting then
dbms_output.put_line('before_insert');
insert into AUDITS(OperationDate,OperationType , TriggerName )
values (sysdate,'insert', 'new_trigg1');
elsif updating then
dbms_output.put_line('before_update');
insert into AUDITS(OperationDate,OperationType , TriggerName )
values (sysdate,'update', 'new_trigg1');
elsif deleting then
dbms_output.put_line('before_delete');
insert into AUDITS(OperationDate,OperationType , TriggerName )
values (sysdate,'delete', 'new_trigg1');
end if;
end;

select * from audits;

create or replace trigger drop_trigger
before drop on DATABASE
begin
raise_application_error(-20000,'cant drop');
end;

create view testview as select * from test;

select * from testview;

create or replace trigger test_trigg
instead of insert or update or delete on testview
for each row
begin
if inserting then
dbms_output.put_line('insert');
elsif updating then
dbms_output.put_line('update');
elsif deleting then
dbms_output.put_line('delete');
end if;
end test_trigg;

select * from user_errors;

insert into test (i) values(123);







