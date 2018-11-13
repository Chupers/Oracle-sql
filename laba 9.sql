create sequence S1
increment by 10
start with 1000
nomaxvalue
nominvalue
nocycle
nocache
noorder;

select * from sys.all_sequences where sequence_name = 'S1';

create sequence S2
increment by 10
start with 10
maxvalue 100
nominvalue
nocycle
nocache
noorder;

select s3.currval from dual;

create sequence S3
increment by -10
start with 10
maxvalue 10
minvalue -100
nocycle
nocache
noorder;

alter sequence s3 minvalue -300;

alter sequence s2 maxvalue 300;



create sequence S4
increment by 1
start with 11
maxvalue 100
minvalue 10
cycle
cache 5
noorder;

select * from sys.all_sequences where sequence_owner = 'VDM_ADMIN';

drop table T1;

create table T1(n1 number(20), n2 number(20), n3 number(20), n4 number(20)) 
storage(buffer_pool keep) ;

insert into T1(n1,n2,n3,n4)
values (s1.nextval, s2.nextval, s3.nextval, s4.nextval);

select* from T1;

create cluster ABC (x number(10), v varchar (20)) hashkeys 200;

create table A(xa number(10), va varchar(20), xz int)
cluster ABC(xa,va);

create table b(xb number(10), vb varchar(20), xzz int)
cluster ABC(xb,vb);

create table c(xc number(10), vc varchar(20), xzzz int)
cluster ABC(xc,vc);

select* from all_clusters;

create public synonym Table1 for a;
create synonym Table2 for b;

Create table User_Name1(name varchar(50),  id int primary key);
create table Age2(age int, id2 int );

insert into User_Name1(name,id)
values('AfdgbAr', 1);
select* from User_name1;

insert into Age2(age, id2)
values(s1.nextval, 1);

Create View V1 as select * from 
USER_NAME1 inner join Age2 on user_name1.id = Age2.ID2;

select * from v1;

create materialized view MV 
build immediate
refresh complete start WITH TO_DATE('10-oct-2018','DD-MON-YYYY')('0-2')
as select
p.xa, f.xb 
from 
(select count(*) xa from a) p, 
(select count(*) xb from b) f;


create materialized view MV1 
build immediate
refresh complete start with (sysdate) next (sysdate +1/1440) with rowid 
as select * from T1;
commit;
select count(*) from MV1;
insert into T1(n1,n2,n3,n4)
values (s1.nextval, s2.nextval, s3.nextval, s4.nextval);
select count(*) from T1;