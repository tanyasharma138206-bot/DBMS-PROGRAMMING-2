SET SERVEROUTPUT ON;

CREATE TABLE employees
(
    employee_id NUMBER PRIMARY KEY,
    first_name   VARCHAR2(50),
    salary       NUMBER(10,2)
);

INSERT INTO employees
VALUES (101, 'John', 50000);

INSERT INTO employees
VALUES (102, 'Rahul', 45000);

INSERT INTO employees
VALUES (103, 'Priya', 55000);

INSERT INTO employees
VALUES (104, 'Amit', 40000);

INSERT INTO employees
VALUES (105, 'Neha', 60000);

COMMIT;

SELECT * FROM employees;

DECLARE

   
    v_emp_name employees.first_name%TYPE;

    
    v_salary employees.salary%TYPE;

BEGIN

   
    v_emp_name := '&Employee_Name';

    
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE UPPER(first_name) = UPPER(v_emp_name);

    
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Employee Details');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || v_emp_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('--------------------------------');

EXCEPTION

    
    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('Employee does not exist.');
        DBMS_OUTPUT.PUT_LINE('Please enter a valid employee name.');
        DBMS_OUTPUT.PUT_LINE('--------------------------------');

    
    WHEN TOO_MANY_ROWS THEN

        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('Multiple employees found with this name.');
        DBMS_OUTPUT.PUT_LINE('Please enter a unique employee name.');
        DBMS_OUTPUT.PUT_LINE('--------------------------------');


    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('--------------------------------');

END;
/