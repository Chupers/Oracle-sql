--task1
begin
null;
end;
--task2
begin
DBMS_OUTPUT.PUT_LINE('hello world');
end;
--TASK3
declare
x NUMBER (3) :=  1;
y Number(3) := 0;
z number (10,2);
begin
DBMS_OUTPUT.PUT_LINE('x='||x);
DBMS_OUTPUT.PUT_LINE('y='||y);
z:= x/y;
DBMS_OUTPUT.PUT_LINE('z='||z);
exception
when others
then DBMS_OUTPUT.PUT_LINE('exceptio - '||sqlerrm);
end;
--task 4
declare
x NUMBER (3) :=  1;
y Number(3) := 0;
z number (10,2);
begin
DBMS_OUTPUT.PUT_LINE('x='||x);
DBMS_OUTPUT.PUT_LINE('y='||y);
begin
z:= x/y;
DBMS_OUTPUT.PUT_LINE('z='||z);
exception
when others
then DBMS_OUTPUT.PUT_LINE('exceptio - '||sqlerrm);
end;
DBMS_OUTPUT.PUT_LINE('z='||z);
end;
--task6
select keyword from v$reserved_words
where length=1;
--task7
select keyword from v$reserved_words
where length>1;
--task8
declare
n1 number (4) := 10.2;
n2 number (4):= 2.4;
n3 number (3,3);
n4 number;
begin
n3:= n2/n1;
n4:=n2*n1;
DBMS_OUTPUT.PUT_LINE('n3='||n3);
DBMS_OUTPUT.PUT_LINE('n4='||n4);
end;
--task14

declare
bf binary_float:=234.123;
bd binary_double:=1234.1234;
b1 boolean:=true;
begin
DBMS_OUTPUT.PUT_LINE('bf='||bf);
DBMS_OUTPUT.PUT_LINE('bd='||bd);
end;
--task18
declare 
n1 constant int :=1;
n2 constant date :=sysdate;
begin
DBMS_OUTPUT.PUT_LINE('n1='||n1);
DBMS_OUTPUT.PUT_LINE('n2='||n2);
end;
--task19
declare 
subject subject.subject%type;
pulpit pulpit.pulpit%type;
faculty_rec faculty%rowtype;
begin
subject := 'DB';
pulpit := 'ISiT';
faculty_rec.faculty := 'FIT';
DBMS_OUTPUT.PUT_LINE(subject);
DBMS_OUTPUT.PUT_LINE(pulpit);
end;

--21
declare 
x pls_integer :=17;
begin
if 8>x 
then
DBMS_OUTPUT.PUT_LINE('8>'||x);
end if;
----
if 8>x 
then
DBMS_OUTPUT.PUT_LINE('8>'||x);
else
DBMS_OUTPUT.PUT_LINE('8<='||x);

end if;
------
end;

--23
declare 
x pls_integer :=17;
begin
case x
when 1 then
DBMS_OUTPUT.PUT_LINE('1');
else DBMS_OUTPUT.PUT_LINE('else');
end case;
case
when x between 13 and 20 then
DBMS_OUTPUT.PUT_LINE('13<='||x||'<=20');
else
DBMS_OUTPUT.PUT_LINE('else');
end case;
end;

--24,25,26
declare 
x pls_integer :=0;
begin
loop
x:=x+1;
DBMS_OUTPUT.PUT_LINE(x);
exit when x>5;
end loop;
for k in 1..5
loop
DBMS_OUTPUT.PUT_LINE(k);
end loop;
while (x>0)
loop
x:=x-1;
DBMS_OUTPUT.PUT_LINE(x);
end loop;
end;










