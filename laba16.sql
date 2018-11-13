create table T_Range( id number, time_id date)
partition by range(id)
(
Partition p1 values less than (100) tablespace t1,
Partition p2 values less than (200) tablespace t2,
Partition p3 values less than (300) tablespace t3,
Partition pmax values less than (maxvalue) tablespace t4
);

insert into T_range(id, time_id)
values(505,'01-02-2018');

create tablespace t4
datafile 'C:\tablespaces\t4.dbf'
size 7 m
AUTOEXTEND on next 5 m
maxsize 20 m 
extent management local;

create table T_Interval( id number, time_id date)
partition by range(time_id)

interval (numtoyminterval(1,'month'))
(
partition p0 values less than  (to_date ('1-1-2009', 'dd-mm-yyyy')),
partition p1 values less than  (to_date ('1-1-2012', 'dd-mm-yyyy')),
partition p2 values less than  (to_date ('1-1-2013', 'dd-mm-yyyy'))
);

insert into T_Interval(id, time_id)
values(505,'01-02-2013');

create table T_hash (str varchar2 (50), id number)
partition by hash (str)
partitions 4 store in (t1,t2,t3,t4);

insert into T_hash (str,id)
values('asdssawesd', 1);

create table T_list(obj char(3))
partition by list (obj)
(
partition p1 values ('aaa'),
partition p2 values ('bbb'),
partition p3 values ('ccc')
);

select * from T_list partition (p2);
select * from T_range partition (p5);
select * from T_Interval partition (p2) ;

alter table t_range enable row movement;
update t_range
set id=208 where id=105;

alter table t_range merge partitions
p1,p2 into partition p5;

alter table T_list exchange partition  p3
with table T_list1
without validation ;

create table T_list1(obj char(3));

alter table t_interval split partition p2 at 
('01-02-2012') into (partition p6 tablespace t4, partition p5 tablespace t2);
