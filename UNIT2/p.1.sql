CREATE TABLE cust(
empno number(4),
ename varchar2(20),
sal number(8,2),
deptno number(2)
);

insert into cust values(101,'ram',20000,10);
insert into cust values(102,'shyam',25000,20);
insert into cust values(103,'mohan',30000,10);
insert into cust values(104,'rahul',80000,30);

COMMIT;

set serveroutput on;

DECLARE
total_rows number(2):=0;
BEGIN
UPDATE cust SET sal =(sal*0.10)
WHERE deptno=10;

IF sql%notfound THEN
dbms_output.put_line(‘no cust selected’);
ELSIF sql%found THEN
total_rows:=sql%rowcount;
dbms_output.put_line(total_rows || ‘cust salary updated');
END IF;

COMMIT;

END;
/