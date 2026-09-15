SET SERVEROUTPUT ON;

CREATE TABLE EMP (
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(20),
    JOB    VARCHAR2(20),
    SAL    NUMBER(10,2),
    DEPTNO NUMBER(2)
);

INSERT INTO EMP VALUES (101, 'SMITH',  'CLERK',    8000, 10);
INSERT INTO EMP VALUES (102, 'ALLEN',  'SALESMAN', 12000, 20);
INSERT INTO EMP VALUES (103, 'WARD',   'SALESMAN', 11000, 20);
INSERT INTO EMP VALUES (104, 'JONES',  'MANAGER',  20000, 30);
INSERT INTO EMP VALUES (105, 'MARTIN', 'SALESMAN', 12500, 20);
INSERT INTO EMP VALUES (106, 'CLARK',  'MANAGER',  18000, 10);
INSERT INTO EMP VALUES (107, 'SCOTT',  'ANALYST',  25000, 30);

COMMIT;

CREATE TABLE EMP_BACKUP (
    EMPNO  NUMBER(4),
    ENAME  VARCHAR2(20),
    JOB    VARCHAR2(20),
    SAL    NUMBER(10,2),
    DEPTNO NUMBER(2)
);

DECLARE

    V_DEPTNO NUMBER := &DEPT_NO;
    V_COUNT NUMBER := 0;
    NO_DEPT_FOUND EXCEPTION;
    CURSOR C_EMP IS
        SELECT EMPNO,
               ENAME,
               JOB,
               SAL,
               DEPTNO
        FROM EMP
        WHERE DEPTNO = V_DEPTNO;

    V_EMP C_EMP%ROWTYPE;

BEGIN

    OPEN C_EMP;

    LOOP

        FETCH C_EMP INTO V_EMP;

        EXIT WHEN C_EMP%NOTFOUND;

        INSERT INTO EMP_BACKUP
        (
            EMPNO,
            ENAME,
            JOB,
            SAL,
            DEPTNO
        )
        VALUES
        (
            V_EMP.EMPNO,
            V_EMP.ENAME,
            V_EMP.JOB,
            V_EMP.SAL,
            V_EMP.DEPTNO
        );

        V_COUNT := V_COUNT + 1;

    END LOOP;

    CLOSE C_EMP;

    IF V_COUNT = 0 THEN

        RAISE NO_DEPT_FOUND;

    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        V_COUNT || ' employee record(s) inserted into EMP_BACKUP.'
    );

EXCEPTION

    WHEN NO_DEPT_FOUND THEN

        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No employee records found for Department Number '
            || V_DEPTNO
        );

END;
/