DECLARE
   marks NUMBER:=100;
BEGIN
   IF marks>=90 then
	dbms_output.put_line('Grade A');
   END IF;
END;
/
