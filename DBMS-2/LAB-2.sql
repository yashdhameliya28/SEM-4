use CSE_5A_187

-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);

-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

-- QUESTION-1
--STORED PROCEDURE OF INSERT :- 

create procedure PR_department_insert
	@DepartmentID int,
	@DepartmentName varchar(100)
as 
begin
	insert into Department
	(
		DepartmentID,
		DepartmentName
	)
	values
	(
		@DepartmentID,
		@DepartmentName
	)
end

exec PR_department_insert 1,'Admin'
exec PR_department_insert 2,'IT'
exec PR_department_insert 3,'HR'
exec PR_department_insert 4,'Account'

select * from Department

create procedure PR_designation_insert
	@DesignationID int,
	@DesignationName varchar(100)
as
begin
	insert into Designation
	(
		DesignationID,
		DesignationName
	)
	values
	(
		@DesignationID,
		@DesignationName
	)
end

exec PR_designation_insert 11,'Jobber'
exec PR_designation_insert 12,'Welder'
exec PR_designation_insert 13,'Clerk'
exec PR_designation_insert 14,'Manager'
exec PR_designation_insert 15,'CEO'

select * from Designation

create procedure PR_person_insert
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@Salary DECIMAL(8, 2),
	@JoiningDate DATETIME,
	@DepartmentID INT,
	@DesignationID INT
as
begin
	insert into Person
	(
		FirstName,
		LastName,
		Salary,
		JoiningDate,
		DepartmentID,
		DesignationID
	)
	values 
	(
		@FirstName,
		@LastName,
		@Salary,
		@JoiningDate,
		@DepartmentID,
		@DesignationID
	)
end


exec PR_person_insert 'Rahul','Anshu',56000,'1990-01-01',1,12
exec PR_person_insert 'Hardik','Hinsu',18000,'1990-09-25',2,11
exec PR_person_insert 'Bhavin','Kamani',25000,'1991-05-14',null,11
exec PR_person_insert 'Bhoomi','Patel',39000,'2014-02-20',1,13
exec PR_person_insert 'Rohit','Rajgor',17000,'1990-07-23',2,15
exec PR_person_insert 'Priya','Mehta',25000,'1990-10-18',2,null
exec PR_person_insert 'Neha','Trivedi',18000,'2014-02-20',3,15

select * from Person


--STORED PROCEDURE OF UPDATE:-

create procedure PR_department_update
	@DepartmentID int,
	@DepartmentName varchar(100)
as
begin
	update Department
	set	DepartmentName = @DepartmentName
	where DepartmentID = @DepartmentID
end

create procedure PR_designation_update
	@DesignationID int,
	@DesignationName varchar(100)
as
begin
	update Designation
	set DesignationName = @DesignationName
	where DesignationID = @DesignationID
end


create procedure Pr_person_update
	@PersonID int,
	@FirstName VARCHAR(100),
	@LastName VARCHAR(100),
	@Salary DECIMAL(8, 2),
	@JoiningDate DATETIME,
	@DepartmentID INT,
	@DesignationID INT
as
begin
	update Person
	set FirstName = @FirstName,
		LastName = @LastName,
		Salary = @Salary,
		JoiningDate = @JoiningDate,
		DepartmentID = @DepartmentID,
		DesignationID = @DesignationID
	where PersonID = @personID
end


--SRORED PROCEDURE OF DELETE :-

create  procedure PR_Department_delete
	@DepartmentID int,
	@DepartmentName varchar(100)
as
begin
	delete from Department
	where DepartmentID = @DepartmentID
end


create procedure PR_Designation_delete
	@DesignationID int
as
begin
	delete from Designation
	where DesignationID = @DesignationID
end


create procedure PR_Person_delete
	@PersonID int
as
begin
	delete from Person
	where PersonID = @PersonID
end

--QUESTION-2
--SELECT BY PRIMARYKEY

create or alter proc PR_department_select
	@DepartmentID int
as 
begin
	select *
	from Department
	where DepartmentID = @DepartmentID
end

exec PR_department_select 1

create or alter proc PR_designation_select
	@DesignationID int
as
begin
	select *
	from Designation
	where DesignationID = @DesignationID
end

exec PR_designation_select 15

create or alter proc PR_person_select
	@PersonID int
as
begin
	select * 
	from Person
	where PersonID = @PersonID
end

exec PR_person_select 101


--QUESTION-3

create or alter proc PR_person_details
	@DepartmentName varchar(100),
	@DesignationName varchar(100)
as
begin
	select Person.FirstName , Person.LastName , Person.Salary
	from Person
	join Department
	on Person.DepartmentID = Department.DepartmentID
	join Designation
	on Person.DesignationID = Designation.DesignationID
	where Department.DepartmentName = @DepartmentName and
			Designation.DesignationName = @DesignationName
end

exec PR_person_details 'it','ceo'

--QUESTION-4

create or alter proc PR_person_detail
as
begin
	select top 3 *
	from Person
end

exec PR_person_detail




