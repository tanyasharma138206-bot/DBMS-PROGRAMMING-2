SET SERVEROUTPUT ON;

DECLARE
	n NUMBER;
	i NUMBER;
BEGIN
	n:=&n;

	i:=1;
	LOOP
	         EXIT WHEN i>n;
	         DBMS_OUTPUT.PUT_LINE(i);
	          i:=i+1;
	END LOOP;
END;
/
	

	