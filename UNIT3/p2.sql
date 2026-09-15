DECLARE
	rno RESULT.ROLLNO%TYPE;
	name RESULT.SNAME%TYPE;
	marks RESULT.MARKS%TYPE;

	FAIL_EXPCETION EXCEPTION;
BEGIN
	rno:=&enter rollno;
	select SNAME,MARKS into name,marks from RESULT
		where ROLLNO=rno;

	if marks >=40 then
		dbms_output.put_line("=============");
		dbms_output.put_line(" student result ");
		dbms_output.put_line("=============");
		dbms_output.put_line("roll no:"||rno);
		dbms_output.put_line("name:"||name);
		dbms_output.put_line("marks:"||marks);
		dbms_output.put_line("STATUS :FAIL");
		dbms_output.put_line("MESSAGE :student didn't pass");
		dbms_output.put_line("=============");
	
	when NO_DATA_FOUND THEN
		dbms_output.put_line("ERROR:rollno"||rno||'not found in result table');

	when others then
		dbms_output.put_line('ERROR:"||SQLERRM);
END;
/