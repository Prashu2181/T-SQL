--STORED PROCEDURES

--Write a program to get employee details with dept name based on user given dept name?

create procedure usp_Edetails
(@Dname varchar(50))
as
begin
  select d.department_name,E.* 
  from employees as E
  join
  departments as D
  on E.department_id = d.department_id
  where D.department_name = @Dname
  End

Execute usp_Edetails


--write a program to get the employee details by given year number along with department name?

create procedure usp_Edetails
(@Dname varchar(50), @year int)
as
begin
  select d.department_name,E.* 
  from employees as E
  join
  departments as D
  on E.department_id = d.department_id
  where D.department_name = @Dname and year(hire_date) = year
  End

Execute usp_Edetails 'IT', 2025

--Write a Stored procedure to insert the values into employee table

create or alter procedure usp_insert
(
@empid int, @Ename varchar(30), @gender char(1), @Emailid varchar(30), @salary int, @ DOJ date, @deptid int
)
As
Begin
  insert into ganga.dbo.emps
  select empid, @Ename, @gender, @Emailid, @salary, @ DOJ, @deptid
end

execute usp_insert 
     103, 'Ram', 'M', 'ram@gmail.com', 45000, '2025-09-22', 10



--Error Handling or Exception Handling Stored Procedures
 --we handle Eceptions in Stored Proceduers by using try, catch methods

 --syntax for try, catch:-

 Begin try
 statment
 end try

 begin catch
 statement 
 begin catch


 --Built-in functions for Error captures

 select Error-number() as Errornumber
       ,Error_line() as Errorlinenumber
	   ,Error_state() as ErrorState
	   ,ERROR_MESSAGE() as ErrorMessage
	   ,ERROR_SEVERITY() as ErrorSeverity
	   ,ERROR_PROCEDURE() as Procname

create proc usp_errorinfo 
as
 begin
 select Error-number() as Errornumber
       ,Error_line() as Errorlinenumber
	   ,Error_state() as ErrorState
	   ,ERROR_MESSAGE() as ErrorMessage
	   ,ERROR_SEVERITY() as ErrorSeverity
	   ,ERROR_PROCEDURE() as Procname
end

create procedure usp_errors
(@a int, @b int)
as
begin
begin try
select @a/@b
end try

begin catch
execute usp_errorinfo
end catch
end

execute usp_errors 10, 2


--USER DEFINED FUNCTIONS:- 

--created by the user to encapsulate reusable logic
--UDF can accept input parameters, perform calculations and return results

--TYPES OF FUNCTIONS:-
--1.Scalar function
--2.Inline table valued functions
--3.Multi-Statement table valued function

--1.Scalar function:- it always return a single value as a result.

--syntax for Scalar function:

create function <functionname>
(@Parameter Datatype)

returns datatype
as
begin
return statement
end

--write a function concatenate any two given inputs?

create or alter function [dbo].[udf_concat]
(@fname varchar(50), lname varchar(50))
returns varchar(50)
as 
begin
return(select concat(@fname,' ', @lname))
end

select employee_id, dbo.udf_concat(first_name, last_name)
as Ename, salary
from employees



--INLINE TABLE VALUED FUNCTIONS:

--This function returns a table

--syntax:
create function <functionname>
(@parameter datatype)
returns table
as
return
(
statement
)

--write a function to create a table with employee and department details bt the user given department name?

create or alter function udf_Empinfo(@Ename varchar(50))

returns table 
as
return
(
select E.*, d.department_name
from employees as E
join 
departments as D
on E.department_id = D.department_id
where D.department_name = @D.Ename
)

select * from udf_empinfo('IT')


--MULTI-STATEMENT TABLE VALUED FUNCTIONS:-

--It returns a table but it can be supported DML commands
--DML operations not impacted on base table
--so we can apply the changes on table variables

--syntax 

create function<functionname>
(@parameter datatype)
 returns @<tablename> table
 (
 columnname datatype,
 columnname1 datatype,
 ...
 )
 as
 begin
 statement
 end


 create function udf_Edetails()
 returns @Emp table
 (
 EmpId int,
 Ename varchar(50),
 salary int
 )

as
begin
insert into @Emp
select employee_id, dbo.ufo_concat(first_name,last_name), salary from employees
update @emp set salary = salary + 1000
return
end
select * from udf_Edetails()
