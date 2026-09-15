CREATE TABLE EMPL
(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SALARY NUMBER(8,2),
    DEPTNO NUMBER(2)
);

INSERT INTO EMPL VALUES (101, 'Rahul', 85000, 10);
INSERT INTO EMPL VALUES (102, 'Priya', 65000, 20);
INSERT INTO EMPL VALUES (103, 'Amit', 95000, 30);
INSERT INTO EMPL VALUES (104, 'Neha', 70000, 20);
INSERT INTO EMPL VALUES (105, 'Karan', 90000, 10);

COMMIT;


SET SERVEROUTPUT ON;

DECLARE
    CURSOR c1 IS
        SELECT empno, ename, salary, deptno
        FROM empl
        ORDER BY salary ASC;

    v_empno  empl.empno%TYPE;
    v_ename  empl.ename%TYPE;
    v_salary empl.salary%TYPE;
    v_deptno empl.deptno%TYPE;

BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_empno, v_ename, v_salary, v_deptno;
        EXIT WHEN c1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Emp No : ' || v_empno ||
            '  Name : ' || v_ename ||
            '  Salary : ' || v_salary ||
            '  Dept No : ' || v_deptno
        );
    END LOOP;

    CLOSE c1;
END;
/
