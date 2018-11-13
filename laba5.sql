select tablespace_name, status,contents logging from sys.dba_tablespaces;

create tablespace VDM_QDATA
datafile 'VDM_QDATA.dbf'
size 10 m
offline;

alter tablespace VDM_QDATA online;

create table test_table( x int primary key, b char) tablespace VDM_T1;
insert into test_table(x,b)
values (8,'d');

select* from dba_segments where tablespace_name='VDM_QDATA';
select segment_name from dba_segments where tablespace_name='VDM_T1';
drop table test_table;
select* from USER_RECYCLEBIN;

FLASHBACK table test_table to before drop;

declare i int := 0;
begin
for i in 1..1000
loop
insert into test_table(x,b)
values (i+9,'a');
end loop;
end;

select* from test_table;
select* from dba_segments where tablespace_name='VDM_T1';

drop tablespace VDM_QDATA;

select* from v$log;
select* from v$log where status = 'CURRENT';
alter system switch logfile ;
alter database add logfile group 4 'E:\app\4.log' size 50m blocksize 512;
alter database add logfile member  'E:\app\4211.log' to group 4;

alter database drop logfile member  'E:\app\4211.log' ;
alter database drop logfile member  'E:\app\41.log' ;
alter database drop logfile group 4;

select name,log_mode from v$database;
select* from v$database;


select name from v$controlfile;
create pfile = 'E:\app\VDM.ORA' from spfile;
select* from v$controlfile;

select* from v$pwfile_users;

select* from v$diag_info;