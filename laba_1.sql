create table VDM_T(x number(30), s varchar(50));
insert all
into VDM_T(x,s) values (1,'aa')
into VDM_T(x,s) values (2,'bb')
into VDM_T(x,s) values (3,'cc')
into VDM_T(x,s) values (4,'dd')
select* from VDM_T;
commit;

select* from VDM_T;
drop table VDM_T;

update VDM_T set x= 10 where x=1 ;
update VDM_T set x= 20 where x=2 ;
commit;
select* from VDM_T;
select* from VDM_T where x>5;

delete from VDM_T where x=20;
commit;

drop table VDM_T;
commit;



