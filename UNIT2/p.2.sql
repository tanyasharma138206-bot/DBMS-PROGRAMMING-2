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
	CURSOR cust1 IS SELECT sal FROM cust WHERE deptno=20 FOR UPDATE of sal;
	sal cust.sal%type;
BEGIN

	OPEN cust1;
	IF Sql%isopen THEN
		dbms_output.put_line('CURSOR IS OPEN');
	ELSE 
		dbms_output.put_line('CURSOR IS NOT OPEN');
	END IF;

	LOOP
		fetch cust1 INTO sal;
		EXIT WHEN cust1%notfound;


	UPDATE cust SET sal=sal+(sal*5/100) WHERE CURRENT OF cust1;
 	

	IF sql%notfound THEN
		dbms_output.put_line('no cust selected');

	ELSIF sql%found THEN

		total_rows:=cust1%rowcount;
		dbms_output.put_line(total_rows || 'cust salary updated');
	END IF;
	END LOOP;

COMMIT;

END;
/