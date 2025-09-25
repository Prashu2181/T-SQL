--TRIGGERS

--Triggers are used to managed the Audit of a tables
--when the Event fires on a table the trigger automatically fired
--when user perform DML operations on a table, trigger automatically executed and stored the information other table

--TYPES OF TRIGGERS

--1. DML Triggers
--2. DDL Triggers
--3.Log on Triggers

--1.DML Triggers:- are classified into two types
        --1. After Trigger
		--2. Befor Trigger

--After Trigger:- whne we perform DML operations After it inserted the log information into an audit table

--Magic tables / Mutating trigger:-
--server automatically create a magic table, when we perform events on a table by inserted, updates and deleted

--syntax for After Triggers:

create trigger <triggername>
on <tablename>
After insert
As
begin
<statement>
End;


--table 1    EMP-T1

create table Emp_T1
(
EID int,
Ename Varchar(50),
Gender char(1),
salary int
)

insert into Emp_T1
values(101, 'Ram', 'M', 50000),
      (102, 'Sita','F', 40000)

-- table 2  Emp_T2

create table Emp_T2
(
EID int, Ename varchar(30), Gender char(1), salary int, 
recordinserteddate datetime, username varchar(30), servername varchar(50)
)

create trigger TRG_emp
on Emp_T1
after insert
as 
begin
insert into Emp_T2
select EID, Ename, Gender, salary, getdate(), SYSTEM_USER, @@SERVERNAME from inserted
end;


select * from Emp_T1

select * from Emp_T2




--TRANSACTIONS-----

--it is a single unit of work
--Either all transactions are succeded or in progress, failed

--Transactions Properties

-- ACID

--A - Atomicity :- all operations success or not at all
--C - Consistency :- Database moves from one valid state to another valid state
--I - Isolation :- each transaction runs independently uneffected by other trasactions
--D - Durability :- once committed, changes are permanent, if the system crashes


--DEADLOCK

--when two or more processes block each other permanently it is known as Deadlock.

-- How to handle deadlock?

select * from employees (NOlock)

