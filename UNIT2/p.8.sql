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

    -- Cursor using LIKE operator
    CURSOR C_EMPL IS
        SELECT EMPNO, ENAME, SALARY, DEPTNO
        FROM EMPL
        WHERE ENAME LIKE 'R%';

BEGIN

    -- Cursor FOR Loop
    FOR REC IN C_EMPL
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'EMPNO: ' || REC.EMPNO ||
            '  ENAME: ' || REC.ENAME ||
            '  SALARY: ' || REC.SALARY ||
            '  DEPTNO: ' || REC.DEPTNO
        );

    END LOOP;

END;
/
