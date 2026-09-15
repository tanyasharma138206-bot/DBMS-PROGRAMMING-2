CREATE TABLE empl (
    empno NUMBER(4),
    ename VARCHAR2(30),
    salary NUMBER(8,2),
    deptno NUMBER(2)
);

INSERT INTO empl VALUES (101, 'Rahul', 85000, 10);
INSERT INTO empl VALUES (102, 'Priya', 65000, 20);
INSERT INTO empl VALUES (103, 'Amit', 95000, 30);
INSERT INTO empl VALUES (104, 'Neha', 70000, 20);
INSERT INTO empl VALUES (105, 'Karan', 90000, 10);

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_top3 IS
        SELECT ename, salary
        FROM
        (
            SELECT ename, salary
            FROM empl
            ORDER BY salary DESC
        )
        WHERE ROWNUM <= 3;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 3 Highest Paid Employees');
    DBMS_OUTPUT.PUT_LINE('----------------------------');

    FOR mgr_rec IN c_top3 LOOP
        DBMS_OUTPUT.PUT_LINE('Employee Name : ' || mgr_rec.ename ||
                             '   Salary : ' || mgr_rec.salary);
    END LOOP;
END;
/


