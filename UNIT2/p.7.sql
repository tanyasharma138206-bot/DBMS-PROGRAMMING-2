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


SET SERVEROUTPUT ON;

DECLARE

    -- Declare explicit cursor
    CURSOR C_CUST IS
        SELECT EMPNO, ENAME, SAL, DEPTNO
        FROM CUST;

    -- Variables to store cursor data
    V_EMPNO  CUST.EMPNO%TYPE;
    V_ENAME  CUST.ENAME%TYPE;
    V_SAL    CUST.SAL%TYPE;
    V_DEPTNO CUST.DEPTNO%TYPE;

BEGIN

    -- Open the cursor
    OPEN C_CUST;

    -- Fetch records one by one
    LOOP

        FETCH C_CUST
        INTO V_EMPNO, V_ENAME, V_SAL, V_DEPTNO;

        -- Exit when no more records are available
        EXIT WHEN C_CUST%NOTFOUND;

        -- Display the records
        DBMS_OUTPUT.PUT_LINE(
            'EMPNO: ' || V_EMPNO ||
            '  ENAME: ' || V_ENAME ||
            '  SALARY: ' || V_SAL ||
            '  DEPTNO: ' || V_DEPTNO
        );

    END LOOP;

    -- Close the cursor
    CLOSE C_CUST;

END;
/