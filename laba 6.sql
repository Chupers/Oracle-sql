select username, service_name, server from v$session where username  is not null; 

select* from v$SGA;

select sum(value) from v$SGA;

select* from v$sga_dynamic_free_memory;

select
 component,
 current_size,
 max_size,
 last_oper_mode,
 last_oper_time,
 granule_size,
 current_size/granule_size as Ratio
 from v$sga_dynamic_components
where current_size>0;

select
 component,
 current_size,
 max_size
  from v$sga_dynamic_components;
  
  select name,
  resize_state,
  block_size, 
  buffers, 
  prev_buffers from v$buffer_pool;

select* from v$buffer_pool;

alter system set db_cache_size =600 m scope=spfile;
alter system set db_keep_cache_size =100 m scope=spfile;
alter system set db_recycle_cache_size =100 m scope=spfile;

create table xxx( k int) storage(buffer_pool keep) tablespace users;

create table yyy( y int) storage(buffer_pool default) tablespace users;
insert into xxx values(1);
insert into yyy values(1);

select segment_name, segment_type, tablespace_name, buffer_pool from user_segments
where SEGMENT_NAME in('xxx','yyy');

show parameter log_buffer; 

select distinct component, current_size
from v$sga_dynamic_components where rownum <=10  order by current_size;

select pool, 
name,bytes from v$sgastat where pool='large pool' 
and  name = 'free memory';

select username from v$session;
select username, server from v$session where username is not null;
