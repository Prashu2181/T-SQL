--T-SQL(Transact-SQL)


-- it is a group of  SQL Statements
-- we used few basic programming techniques to read the data dynamically or validate the data based on conditions

--1.Variables
--2.IF-Else
--3.While
--4.Stored Procedures (SP)
--5.Triggers
--6.User Defined Functions(UDF)
--7.Cursors
--8.Transactions
--9.Normalization


--Variable:- Variables are used to allocate a value to that name that name can be reused into multiple places with in the session is known as Variables

--Types of Variables

--1.Local Variable(User Defined Variable)
--2.Global Variable(System Defined Variable)

----1.Local Variable:-Local Variables can be created by user with single @Prefix infront of variable name along with the declare keyword

--Syntax for create a variable:-
--Declare @<variablename> <Datatype>

--Syntax for assign a value to a variable:-
--SET @<variablename> = <value/statement>

--syntax for read a variable values:-
--Print @<variablename> -->message format result
--OR
--select@<variablename> -->structure format result


--write a query to add two given numbers

declare @a int
declare @b int
declare @c int
set @a = 20
set @b = 80
set @c = @a + @b
print @C


--Using Variables in Queries.

--Write a query to get highest salary with employee details without using TOP, Subquery and CTE

declare @sal int
set @sal =(select max(salary) from employees)
select * from employees
where salary = @sal

--write a query to get repeated characters count in your name?



--IF-ELSE:-

--It is used to check the given condition, if the given condition is true, then Trueblock will get executed otherwise it executed Elseblock

--syntax for if-else

if(condition)
Begin
statement
end
Else
Begin
statement
end


--write aquery to find the given number is positive or negative

declare @i int
set @i = 10

if(@i >= 0)
begin
print 'The given number is positive'
end
else
begin
print 'The given number is negative'
end

          select * from employees
--write a query to find the given employee id is existing or not in employee table, if id is existing then display employee details, if id is not existed then display please provide correct employee id or details

declare @Empid int 
set @Empid = 101

if exists(select 1 from employees
          where employee_id = @Empid)

	Begin
	select *
	from employees 
	where employee_id = @Empid;
	end
else
    begin
	print 'please provide correct employee id'
	end
	

--write a program to check the given employee id salary should be increase 5000, if the salary is below 5000

declare @Emp_id int 
set @Emp_id = 101

if exists (select 1 from employees
           where employee_id = @Emp_id)

	begin
	if(select salary from employees 
	   where employee_id = @Emp_id) < 5000

	begin
	update employees
	set salary = salary + 5000
	where employee_id = @Emp_id;

	print 'salary increased by 5000'
	     
end

Else
begin
print 'salary is already 5000 or more no increment applied' 
end
end

else 
begin
print 'employee id not found, please provide correct employee id'
end


--write a program to check the given employee id salary is more than 5000 and below 10000 then display low salary, if the salary is more than 10000 and below 20000 then display medium salary, and the salary is more than 20000 then display high ssalary

DECLARE @EmployeeId INT = 101;  
DECLARE @Salary INT;

IF EXISTS (SELECT 1 FROM Employees WHERE employee_id = @EmployeeId)
BEGIN
    
    SELECT @Salary = Salary 
    FROM Employees
    WHERE Employee_ID = @EmployeeId;

    IF @Salary > 5000 AND @Salary < 10000
        print 'Low Salary'

    ELSE IF @Salary >= 10000 AND @Salary < 20000
       print 'Medium Salary' 

    ELSE IF @Salary >= 20000
       print 'High Salary' 

    ELSE
        SELECT 'Salary is 5000 or below' 
END
ELSE
BEGIN
    SELECT 'Employee ID not found, please provide correct employee id' 
END