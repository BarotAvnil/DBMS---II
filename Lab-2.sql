--Lab 2

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




CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT
	@DEPARTMENTID INT,
	@DEPARTMENTNAME VARCHAR(100)
AS
BEGIN
	INSERT INTO DEPARTMENT
	(
		DepartmentID,
		DepartmentName
	)
	VALUES
	(
		@DEPARTMENTID,
		@DEPARTMENTNAME
	)
END

EXEC PR_DEPARTMENT_INSERT 1, 'Admin'
EXEC PR_DEPARTMENT_INSERT 2, 'IT'
EXEC PR_DEPARTMENT_INSERT 3, 'HR' 
EXEC PR_DEPARTMENT_INSERT 4, 'Account'


--CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT
--	@DEPARTMENTID INT,
--	@DEPARTMENTNAME VARCHAR(100)
--AS
--BEGIN
--	INSERT INTO DEPARTMENT
--	(
--		DepartmentID,
--		DepartmentName
--	)
--	VALUES
--	(
--		@DEPARTMENTID,
--		@DEPARTMENTNAME
--	)
--END

CREATE OR ALTER PROCEDURE PR_DESIGNATION_INSERT
	@DESIGNATIONID INT,
	@DESIGNATIONNAME VARCHAR(100)
AS
BEGIN
	INSERT INTO DESIGNATION
	(
		DesignationID,
		DesignationName
	)
	VALUES
	(
		@DESIGNATIONID,
		@DESIGNATIONNAME
	)
END

EXEC PR_DESIGNATION_INSERT 11,'Jobber'
EXEC PR_DESIGNATION_INSERT 12,'Welder'
EXEC PR_DESIGNATION_INSERT 13,'Clerk'
EXEC PR_DESIGNATION_INSERT 14,'Manager'
EXEC PR_DESIGNATION_INSERT 15,'CEO'


CREATE OR ALTER PROCEDURE PR_PERSON_INSERT
	@FIRSTNAME VARCHAR(100),
	@LASTNAME VARCHAR(100),
	@SALARY INT,
	@JOININGDATE DATETIME,
	@DEPARTMENTID INT,
	@DESIGNATION INT
AS
BEGIN
	INSERT INTO PERSON
	VALUES
	(
		@FIRSTNAME,
		@LASTNAME,
		@SALARY,
		@JOININGDATE,
		@DEPARTMENTID,
		@DESIGNATION
	)
END

EXEC PR_PERSON_INSERT 'Rahul','Anshu',56000,'01-JAN-1990',1,12
EXEC PR_PERSON_INSERT 'Hardik','Hinsu',18000,'25-SEP-1990',2,11
EXEC PR_PERSON_INSERT 'Bhavin','Kamani',25000,'14-MAY-1991',NULL,11
EXEC PR_PERSON_INSERT 'Bhoomi','Patel',39000,'20-FEB-2014',1,13
EXEC PR_PERSON_INSERT 'Rohit','Rajgor',17000,'23-JUL-1990',2,15
EXEC PR_PERSON_INSERT 'Priya','Mehta',25000,'18-OCT-1990',2,NULL
EXEC PR_PERSON_INSERT 'Neha','Trivedi',18000,'20-FEB-2014',3,15

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY
CREATE OR ALTER PROC PR_SELECT_BY_PK_Person
	@PersonID INT
AS
BEGIN
	SELECT * FROM Person
	WHERE PersonID = @PersonID
END

CREATE OR ALTER PROC PR_SELECT_BY_PK_Department
	@DepartmentID INT
AS
BEGIN
	SELECT * FROM Department
	WHERE DepartmentID = @DepartmentID
END

CREATE OR ALTER PROC PR_SELECT_BY_PK_Designation
	@DesignationID INT
AS
BEGIN
	SELECT * FROM Designation
	WHERE DesignationID = @DesignationID
END

--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take
--columns on select list)

CREATE OR ALTER PROC PR_ALL_DETAIL
AS
BEGIN
	SELECT * FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation 
	ON Person.DesignationID = Designation.DesignationID
END

EXEC PR_ALL_DETAIL

--4. Create a Procedure that shows details of the first 3 persons.

CREATE OR ALTER PROC PR_TOP3_PERSON
AS
BEGIN
	SELECT TOP 3 * FROM Person
	JOIN Department
	ON Person.DepartmentID = Department.DepartmentID
	JOIN Designation 
	ON Person.DesignationID = Designation.DesignationID
END

EXEC PR_TOP3_PERSON



