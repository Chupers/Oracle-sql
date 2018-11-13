select* from dictionary;
select* from v$pdbs;
select * from v$option;

select * from all_users 

create tablespace U1_VDM_PDB
datafile ' U1_VDM_PDB.dbf'
size 7 m
AUTOEXTEND on next 5 m
maxsize 20 m 
extent management local;
select tablespace_name , status, contents logging from DBA_TABLESPACES


create role vdm_pdb1;

grant create session vdm_pdb1;
grant create table to vdm_pdb1;
grant drop table to vdm_pdb1;
grant create view to vdm_pdb1;
grant create procedure to vdm_pdb1;

create profile PF_VDMCORE1 limit
password_life_time 180
sessions_per_user 3
failed_login_attempts 7
password_lock_time 1
password_reuse_time 10
password_grace_time DEFAULT
connect_time 180
idle_time 30

select* from DBA_PROFILES where profile = 'PF_VDMCORE'

grant create session to U1_VDM_PDB;
grant create table to U1_VDM_PDB;

create user U1_VDM_PDB identified by 12345
default tablespace U1_VDM_PDB quota unlimited on U1_VDM_PDB
profile PF_VDMCORE
account unlock
password expire

grant vdm_pdb1 to  U1_VDM_PDB

create table VDM (x int);
insert into VDM values (1);
insert into VDM values (2);
insert into VDM values (3);
select* from VDM

