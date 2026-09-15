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

    CURSOR c_emp(p_deptno NUMBER) IS
        SELECT ENAME, SALARY
        FROM EMPL
        WHERE DEPTNO = p_deptno;

    v_total NUMBER;

BEGIN

    FOR d IN (SELECT DISTINCT DEPTNO FROM EMPL ORDER BY DEPTNO) LOOP

        v_total := 0;

        DBMS_OUTPUT.PUT_LINE('Department No : ' || d.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('------------------------------');

        FOR emp_rec IN c_emp(d.DEPTNO) LOOP

            DBMS_OUTPUT.PUT_LINE('Employee Name : ' || emp_rec.ENAME);
            DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || emp_rec.SALARY);

            v_total := v_total + emp_rec.SALARY;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('------------------------------');
        DBMS_OUTPUT.PUT_LINE('Department Total Salary : ' || v_total);
        DBMS_OUTPUT.PUT_LINE('==============================');

    END LOOP;

END;
/