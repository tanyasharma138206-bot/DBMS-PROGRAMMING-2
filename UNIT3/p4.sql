SET SERVEROUTPUT ON;

CREATE TABLE employee
(
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(50),
    age NUMBER,
    salary NUMBER(10,2)
);

INSERT INTO employee
VALUES (101, 'John', 45, 40000);

INSERT INTO employee
VALUES (102, 'Rahul', 50, 55000);

INSERT INTO employee
VALUES (103, 'Priya', 35, 45000);

INSERT INTO employee
VALUES (104, 'Amit', 50, 60000);

INSERT INTO employee
VALUES (105, 'Neha', 28, 35000);

COMMIT;


SELECT * FROM employee;

DECLARE

    v_salary employee.salary%TYPE;

BEGIN

    SELECT salary
    INTO v_salary
    FROM employee
    WHERE age = 50;


    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Employee Found');
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Salary : ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('--------------------------------');

EXCEPTION


    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('No employee found whose age is 50 years.');
        DBMS_OUTPUT.PUT_LINE('--------------------------------');


    WHEN TOO_MANY_ROWS THEN

        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('More than one employee is 50 years old.');
        DBMS_OUTPUT.PUT_LINE('Cannot display a single salary.');
        DBMS_OUTPUT.PUT_LINE('--------------------------------');


    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE('--------------------------------');
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('--------------------------------');

END;
/
