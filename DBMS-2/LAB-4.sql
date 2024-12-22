use CSE_5A_187

--1. Write a function to print "hello world".
create or alter function fn_printHelloWorld()
	returns varchar(50)
as
begin
	return 'Hello world'
end

select dbo.fn_printHelloWorld()

--2. Write a function which returns addition of two numbers.
create or alter function fn_addtion
(
	@num1 int,
	@num2 int
)
returns int
as
begin
	return @num1 + @num2
end

select dbo.fn_addtion(2 , 3)

--3. Write a function to check whether the given number is ODD or EVEN.
create or alter function fn_oddeven_number
(
	@number int
)
returns varchar(50)
as
begin
	declare @msg varchar(50)
	if @number % 2 = 0
		set @msg = 'Even number'
	else
		set @msg = 'Odd number'
	return @msg
end

select dbo.fn_oddeven_number(5)
--4. Write a function which returns a table with details of a person whose first name starts with B.
create or alter function fn_personDetails()
returns table
as
return 
	select FirstName
	from Person
	where FirstName like 'b%'

select * from dbo.fn_personDetails()
--5. Write a function which returns a table with unique first names from the person table.
create or alter function fn_uniqueName()
returns table
as
return 
		select FirstName
		from Person
		group by FirstName

select * from dbo.fn_uniqueName()		
--6. Write a function to print number from 1 to N. (Using while loop)
create or alter function fn_1ToN(@n int)
returns varchar(100)
as
begin
	declare @numbers varchar(100) , @i int
	set @numbers = ''
	set @i = 1
	while(@i <= @n)
		begin
			set @numbers = @numbers + ' ' + Cast(@i as varchar)
			set @i = @i + 1
		end
	return @numbers
end

select dbo.fn_1ToN(5)
--7. Write a function to find the factorial of a given integer.create or alter function fn_factorial(@n int)returns intasbegin	declare @i int , @fac int	set @i = 1	set @fac = 1	while(@i <= @n)		begin			set @fac = @fac * @i			set @i = @i + 1		end	return @facendselect dbo.fn_factorial(5)