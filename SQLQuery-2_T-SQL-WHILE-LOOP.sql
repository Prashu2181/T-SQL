--WHILE LOOP:- It is used to Execute SQL statements repeatedly untill the given condition is false

--syntax:

while(condition)
Begin
statement
End

--write a query to display 1 to 100 number?

Declare @i int = 1
while (@i <= 100)
Begin
print @i
set @i = @i + 1
end

--using recursive method

with CTE
as
(
select 1 as ID
union all
select ID + 1 from CTE where ID < 100
)
select * from CTE
  