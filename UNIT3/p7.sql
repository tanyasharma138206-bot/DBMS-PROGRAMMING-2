DECLARE
    num NUMBER;
    invalid_number EXCEPTION;

BEGIN
    num := -10;

    IF num < 0 THEN
        RAISE invalid_number;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Valid Number: ' || num);

EXCEPTION
    WHEN invalid_number THEN
        DBMS_OUTPUT.PUT_LINE('INVALID_NUMBER Exception: Number cannot be negative.');
END;
/