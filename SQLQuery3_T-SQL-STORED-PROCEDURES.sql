--STORED PROCEDURES

--Stored procedures is group of SQL statements and it is a pre-compile and stored in the database object.
-- it provides the results through same execution plan
--it can be except input or output parameters
--we can handle errors in stored procedures by using try, catch methods

--Advantages of stored procedures
--1. It provides security
--2. It provides reusability
--3. It improve better query performance
--4. Easy to maintain

--Syntax for stored procedures

create procedure <ProcName>
(@<parametername> datatype, parametertype,....)
AS
BEGIN
statement (all SQL concepts)
END

--create a procedure with parameters

--write a sp to get employee with department details

create procedure usp_EmpDetails
AS
BEGIN
SELECT e.Employee_ID, e.First_Name, e.Last_Name, e.hire_date,d.department_name
FROM employees  as e
 JOIN departments as d
ON e.department_id = d.department_id
END

--execute the stored procedure

exec usp_EmpDetails


--create a procedure with input parameters

--write a sp to get employee with department details by user given department name?

Alter procedure usp_EmpDetails
(@deptname varchar(50) ) --input parameter
AS
BEGIN
SELECT e.Employee_ID, e.First_Name, e.Last_Name, e.hire_date,d.department_name
FROM employees  as e
 JOIN departments as d
ON e.department_id = d.department_id
where d.department_name = @deptname
END

exec usp_EmpDetails 'IT'


