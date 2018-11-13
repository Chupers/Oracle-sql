create tablespace TS_VDM
datafile 'TS_VDM_1.dbf'
size 7 m
AUTOEXTEND on next 5 m
maxsize 20 m 
extent management local;

create temporary tablespace TS_VDM_TEMP
tempfile 'TS_VDM_TEMP.dbf'
size 5 m
AUTOEXTEND on next 3 m
maxsize 30 m 
extent management local;

select tablespace_name , status, contents logging from DBA_TABLESPACES


create role C##crl_vdmcore;



grant create session to C##crl_vdmcore;
grant create table to C##crl_vdmcore;
grant drop table to C##crl_vdmcore;
grant create view to C##crl_vdmcore;
grant create procedure to C##crl_vdmcore;

create profile PF_VDMCORE limit
password_life_time 180
sessions_per_user 3
failed_login_attempts 7
password_lock_time 1
password_reuse_time 10
password_grace_time DEFAULT
connect_time 180
idle_time 30

select* from DBA_PROFILES where profile = 'PF_VDMCORE'

create user VDM_CORE identified by 12345
default tablespace TS_VDM quota unlimited on TS_VDM
TEMPORARY TABLESPACE TS_VDM_TEMP
profile PF_VDMCORE
account unlock
password expire

grant C##crl_vdmcore to VDMCORE

create table Laba2(x int, s varchar(50));
insert into Laba2(x,s) values(1,'bb');
select* from Laba2;

create tablespace VDM_DATA
datafile 'VDM_DATA.dbf'
size 10 m
AUTOEXTEND on next 5 m
maxsize 20 m 
offline
extent management local;

alter tablespace VDM_DATA 
online 


create user VDM identified by 12345
default tablespace VDM_DATA quota 2m on VDM_DATA
TEMPORARY TABLESPACE TS_VDM_TEMP
profile PF_VDMCORE
account unlock
password expire

grant C##crl_vdmcore to VDM

create tablespace VDM_T1
datafile 'VDM_1.dbf'
size 7 m
AUTOEXTEND on next 5 m
maxsize 20 m 
extent management local;

create table AAA (x int);
insert into AAA values (1);
insert into AAA values (2);
insert into AAA values (3);
select* from AAA