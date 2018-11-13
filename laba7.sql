select * from v$services;
select * from v$session where username is not null;
select* from v$process;

select addr, program , tracefile from v$process 
where background is not null;

select addr, program , tracefile from v$process 
where pname  like '%DBW%';

declare k number (18);
begin
 for i in 1..1000000000000
 loop 
 k:=i;
 end loop;
 end;

select paddr, name, network , status from v$dispatcher;