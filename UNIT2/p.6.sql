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

CREATE TABLE EMP_BACKUP
(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(20),
    SALARY NUMBER(8,2),
    DEPTNO NUMBER(2)
);

SET SERVEROUTPUT ON;

DECLARE

    -- User-defined exception
    NO_DEPT_FOUND EXCEPTION;

    -- Variable to store entered department number
    V_DEPTNO NUMBER := &DEPT_NO;

    -- Cursor to find employees from EMPL
    CURSOR C_EMP IS
        SELECT EMPNO, ENAME, SALARY, DEPTNO
        FROM EMPL
        WHERE DEPTNO = V_DEPTNO;

    -- Counter to check whether records are found
    V_COUNT NUMBER := 0;

BEGIN

    -- Fetch records using cursor
    FOR EMP_REC IN C_EMP
    LOOP

        -- Insert records into EMP_BACKUP
        INSERT INTO EMP_BACKUP
        VALUES
        (
            EMP_REC.EMPNO,
            EMP_REC.ENAME,
            EMP_REC.SALARY,
            EMP_REC.DEPTNO
        );

        V_COUNT := V_COUNT + 1;

    END LOOP;

    -- Raise exception if no record is found
    IF V_COUNT = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        V_COUNT || ' record(s) inserted into EMP_BACKUP.'
    );

EXCEPTION

    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No employees found for Department '
            || V_DEPTNO
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );

END;
/
