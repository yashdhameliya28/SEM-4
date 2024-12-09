use CSE_5A_187

CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE,
 ManagerID INT NOT NULL,
 Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employee (
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 DoB DATETIME NOT NULL,
 Gender VARCHAR(50) NOT NULL,
 HireDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 Salary DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Projects Table
CREATE TABLE Projects (
 ProjectID INT PRIMARY KEY,
 ProjectName VARCHAR(100) NOT NULL,
 StartDate DATETIME NOT NULL,
 EndDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location)
VALUES
 (1, 'IT', 101, 'New York'),
 (2, 'HR', 102, 'San Francisco'),
 (3, 'Finance', 103, 'Los Angeles'),
 (4, 'Admin', 104, 'Chicago'),
 (5, 'Marketing', 105, 'Miami');
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID,
Salary)
VALUES
 (101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00),
 (102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00),
 (103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00),
 (104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00),
 (105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00);
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID)
VALUES
 (201, 'Project Alpha', '2022-01-01', '2022-12-31', 1),
 (202, 'Project Beta', '2023-03-15', '2024-03-14', 2),
 (203, 'Project Gamma', '2021-06-01', '2022-05-31', 3),
 (204, 'Project Delta', '2020-10-10', '2021-10-09', 4),
 (205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);


-- 1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based
--on this you must give EmployeeID, DOB, Gender & Hiredate.
create procedure PR_employee_detail
	@FirstName varchar(100),
	@LastName varchar(100)
as
begin
	select EmployeeID , DoB , Gender , HireDate
	from Employee
	where FirstName = @FirstName and LastName = @LastName
end

exec PR_employee_detail 'Jane' , 'Smith'

--2. Create a Procedure that will accept Department Name and based on that gives employees list who
--belongs to that department.create or alter proc PR_search_emp_dept	@DeptName varchar(100)asbegin	select Employee.FirstName , Employee.LastName	from Employee	join Departments	on Employee.DepartmentID = Departments.DepartmentID	where Departments.DepartmentName = @DeptNameendexec PR_search_emp_dept 'IT'--3. Create a Procedure that accepts Project Name & Department Name and based on that you must give
--all the project related details.
create or alter proc PR_project_detail
	@ProjectName varchar(100),
	@DepartmentName varchar(100)
as
begin
	select *
	from Projects
	join Departments
	on Projects.DepartmentID = Departments.DepartmentID
	where Projects.ProjectName = @ProjectName and Departments.DepartmentName = @DepartmentName
end

exec PR_project_detail 'Project Alpha','IT'

--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those
--employee list comes in output.
create or alter proc PR_salary_detail
	@start Decimal(10,2),
	@end Decimal(10,2)
as
begin
	select *
	from Employee
	where Salary between @start and @end
end

exec PR_salary_detail 60000, 80000

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date.create or alter proc PR_hired_employee	@hired_date Datetimeasbegin	select FirstName , LastName 	from Employee	where HireDate = @hired_dateendexec PR_hired_employee '2010-06-15'