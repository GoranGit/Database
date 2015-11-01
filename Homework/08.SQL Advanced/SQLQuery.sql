-- 01.Write a SQL query to find the names and salaries of the employees that take 
-- the minimal salary in the company. Use a nested SELECT statement.

SELECT FirstName + ' ' + LastName AS [Full Name], Salary
FROM Employees
WHERE Salary =
	(SELECT MIN(Salary) FROM Employees)

-- 02.Write a SQL query to find the names and salaries of the employees that have a salary
-- that is up to 10% higher than the minimal salary for the company.

SELECT FirstName + ' ' + LastName AS [Full Name], Salary
FROM Employees
WHERE Salary <
	(SELECT MIN(Salary) FROM Employees) * 1.1

-- 03.Write a SQL query to find the full name, salary and department of the employees
-- that take the minimal salary in their department. Use a nested SELECT statement.

SELECT FirstName + ' ' + LastName AS [Full Name], Salary, d.Name
FROM Employees e, Departments d
WHERE Salary =
	(SELECT MIN(Salary) FROM Employees) AND (d.DepartmentID = e.DepartmentID)

-- 04.Write a SQL query to find the average salary in the department #1.

SELECT AVG(Salary) AS [Avarage Salary]
FROM Employees
WHERE DepartmentID = 1

-- 05.Write a SQL query to find the average salary in the "Sales" department.

SELECT AVG(Salary) AS [Avarage Salary]
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'

-- 06.Write a SQL query to find the number of employees in the "Sales" department.

SELECT Count(*) AS [Number of employees in Sales]
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name = 'Sales'


-- 07.Write a SQL query to find the number of all employees that have manager.

SELECT COUNT(ManagerID) AS [Number of employees with manager]
FROM Employees

-- 08.Write a SQL query to find the number of all employees that have no manager.
SELECT COUNT(*) AS [Employees without manager]
FROM Employees e
WHERE ManagerID IS NULL

-- 09.Write a SQL query to find all departments and the average salary for each of them.
SELECT d.Name AS [Department Name], AVG(e.Salary) AS [Avarage salary]
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name

-- 10.Write a SQL query to find the count of all employees in each department and for each town.\

SELECT COUNT(*) AS [Employees Count], d.Name AS [Department Name], t.Name AS [Town Name]
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
JOIN Addresses a
ON a.AddressID = e.AddressID
JOIN Towns t
ON t.TownID = a.TownID
GROUP BY d.Name, t.Name
ORDER BY d.Name

-- 11.Write a SQL query to find all managers that have exactly 5 employees.
-- Display their first name and last name.

SELECT m.FirstName, m.LastName, COUNT(*) AS [Emploees Count]
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID
GROUP BY m.EmployeeID, m.FirstName, m.LastName
HAVING COUNT(*) = 5


-- 12.Write a SQL query to find all employees along with their managers.
-- For employees that do not have manager display the value "(no manager)".

SELECT e.FirstName + ' ' +  e.LastName AS [Emploee Name], ISNULL(m.FirstName + ' ' + m.LastName, 'no manager') AS [Manager name]
FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID

-- 13.Write a SQL query to find the names of all employees whose last name
-- is exactly 5 characters long. Use the built-in LEN(str) function.

SELECT FirstName + ' ' +  LastName AS [Emploee Name]
FROM Employees
WHERE LEN(LastName) = 5

-- 14.Write a SQL query to display the current date and time in the
-- following format "day.month.year hour:minutes:seconds:milliseconds".

Select FORMAT(GETDATE(), 'd.MM.yyyy HH:mm:ss:ff');

-- 15.Write a SQL statement to create a table Users.
-- Users should have username, password, full name and last login time.
--	*Choose appropriate data types for the table fields. Define a primary key column with a primary key constraint.
--  *Define the primary key column as identity to facilitate inserting records.
--	*Define unique constraint to avoid repeating usernames.
--	*Define a check constraint to ensure the password is at least 5 characters long.

CREATE TABLE Users (
  UserId int IDENTITY,
  Username nvarchar(30) UNIQUE NOT NULL,
  Password nvarchar(50) CHECK (DATALENGTH([Password]) >= 5) NOT NULL,
  FullName nvarchar(100) NOT NULL,
  LastLogin DATETIME NOT NULL,
  CONSTRAINT PK_Persons PRIMARY KEY(UserId)
)
GO
-- 16.Write a SQL statement to create a view that displays the users from the Users table
-- that have been in the system today. Test if the view works correctly.

CREATE VIEW [Today Loged Users] AS
SELECT Username, LastLogin
FROM Users
WHERE CONVERT(VARCHAR(10), LastLogin, 102) <= CONVERT(VARCHAR(10) ,GETDATE(), 102)
GO

-- 17.Write a SQL statement to create a table Groups. Groups should have unique name (use unique constraint).
-- Define primary key and identity column.

CREATE TABLE Groups (
  GroupId int IDENTITY,
  Name nvarchar(30) UNIQUE NOT NULL,
  CONSTRAINT PK_Groups PRIMARY KEY(GroupId)
)
GO

-- 18.Write a SQL statement to add a column GroupID to the table Users.
--	*Fill some data in this new column and as well in the `Groups table.
--	*Write a SQL statement to add a foreign key constraint between tables Users and Groups tables.

ALTER TABLE Users
ADD GroupId int

ALTER TABLE Users
ADD CONSTRAINT FK_Users_Groups
FOREIGN KEY (GroupId)
REFERENCES Groups(GroupId)

-- 19.Write SQL statements to insert several records in the Users and Groups tables.

INSERT INTO Users (Username, Password, FullName, LastLogin)
VALUES('Stamat', '123456', 'Stamat Ivanov', GETDATE()),
		('Stamina', '123456', 'Stamina Carey', GETDATE()),
		('Ivan', '123456', 'Ivan Petrov', GETDATE())

INSERT INTO Groups (Name)
VALUES ('GROUP 1'), ('GROUP 2'), ('GROUP 3')

-- 20.Write SQL statements to update some of the records in the Users and Groups tables.

UPDATE Users
SET Username = 'Johny'
WHERE UserId = 1

UPDATE Groups
SET Name = 'Some Group'
WHERE GroupId = 1

-- 21.Write SQL statements to delete some of the records from the Users and Groups tables.

DELETE FROM Users
WHERE UserId = 1

DELETE FROM Groups
WHERE GroupId = 1

-- 22.Write SQL statements to insert in the Users table the names of all employees from the Employees table.
--	*Combine the first and last names as a full name.
--	*For username use the first letter of the first name + the last name (in lowercase).
--	*Use the same for the password, and NULL for last login time.

-- Get the first 3 characters from the first name, becouse the password needs to be at least 6 characters.
INSERT INTO Users (Username, Password, FullName)
SELECT LOWER(LEFT(FirstName, 3) + LastName),
	   LOWER(LEFT(FirstName, 3) + LastName),
	   (FirstName + ' ' + LastName)
FROM Employees

-- 23.Write a SQL statement that changes the password to NULL for
-- all users that have not been in the system since 10.03.2010.

UPDATE Users
SET Password = NULL
WHERE DATEDIFF(day, LastLogin, '2010-3-10 00:00:00') > 0

-- 24.Write a SQL statement that deletes all users without passwords (NULL password).

DELETE FROM Users
WHERE Password IS NULL

-- 25.Write a SQL query to display the average employee salary by department and job title.

SELECT AVG(Salary) AS [Avarage Salary], d.Name AS [Department Name], e.JobTitle
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle
ORDER BY AVG(Salary)

-- 26.Write a SQL query to display the minimal employee salary by department
-- and job title along with the name of some of the employees that take it.

SELECT MIN(Salary) AS [Minimal Salary], d.Name AS [Department Name], e.JobTitle, MIN(CONCAT(e.FirstName, ' ', e.LastName)) AS [Employee]
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle
ORDER BY MIN(Salary)

-- 27.Write a SQL query to display the town where maximal number of employees work.
SELECT TOP 1 t.Name AS [Town Name], COUNT(e.EmployeeID) as [Employees count]
FROM Employees e
JOIN Addresses a
ON e.AddressID = a.AddressID
JOIN Towns t
ON t.TownID = a.TownID
GROUP BY t.Name
ORDER BY COUNT(e.EmployeeID) DESC

-- 28.Write a SQL query to display the number of managers from each town.
SELECT t.Name, COUNT(e.EmployeeID) as [ManagersCount]
FROM Employees e
JOIN Addresses a
ON a.AddressID = e.AddressID
JOIN Towns t
ON t.TownID = a.TownID
GROUP BY t.Name

-- 29.Write a SQL to create table WorkHours to store work reports for each
-- employee (employee id, date, task, hours, comments).
--	*Don't forget to define identity, primary key and appropriate foreign key.
--	*Issue few SQL statements to insert, update and delete of some data in the table.
--	*Define a table WorkHoursLogs to track all changes in the WorkHours table with triggers.
--	*For each change keep the old record data, the new record data and the command (insert / update / delete).

--- TABLE: WorkHours
CREATE TABLE WorkHours (
    WorkReportId int IDENTITY,
    EmployeeId Int NOT NULL,
    OnDate DATETIME NOT NULL,
    Task nvarchar(256) NOT NULL,
    Hours Int NOT NULL,
    Comments nvarchar(256),
    CONSTRAINT PK_Id PRIMARY KEY(WorkReportId),
    CONSTRAINT FK_Employees_WorkHours 
        FOREIGN KEY (EmployeeId)
        REFERENCES Employees(EmployeeId)
) 
GO

--- INSERT
DECLARE @counter int;
SET @counter = 20;
WHILE @counter > 0
BEGIN
    INSERT INTO WorkHours(EmployeeId, OnDate, Task, [Hours])
    VALUES (@counter, GETDATE(), 'TASK: ' + CONVERT(varchar(10), @counter), @counter)
    SET @counter = @counter - 1
END

--- UPDATE
UPDATE WorkHours
    SET Comments = 'Work hard or go home!'
    WHERE [Hours] > 10

--- DELETE
DELETE
    FROM WorkHours
    WHERE EmployeeId IN (1, 3, 5, 7, 13)

--- TABLE: WorkHoursLogs
CREATE TABLE WorkHoursLogs (
    WorkLogId int,
    EmployeeId Int NOT NULL,
    OnDate DATETIME NOT NULL,
    Task nvarchar(256) NOT NULL,
    Hours Int NOT NULL,
    Comments nvarchar(256),
    [Action] nvarchar(50) NOT NULL,
    CONSTRAINT FK_Employees_WorkHoursLogs
        FOREIGN KEY (EmployeeId)
        REFERENCES Employees(EmployeeId),
    CONSTRAINT [CC_WorkReportsLogs] CHECK ([Action] IN ('Insert', 'Delete', 'DeleteUpdate', 'InsertUpdate'))
) 
GO

--- TRIGGER FOR INSERT
CREATE TRIGGER tr_InsertWorkReports ON WorkHours FOR INSERT
AS
INSERT INTO WorkHoursLogs(WorkLogId, EmployeeId, OnDate, Task, [Hours], Comments, [Action])
    SELECT WorkReportId, EmployeeID, OnDate, Task, [Hours], Comments, 'Insert'
    FROM inserted
GO

--- TRIGGER FOR DELETE
CREATE TRIGGER tr_DeleteWorkReports ON WorkHours FOR DELETE
AS
INSERT INTO WorkHoursLogs(WorkLogId, EmployeeId, OnDate, Task, [Hours], Comments, [Action])
    SELECT WorkReportId, EmployeeID, OnDate, Task, [Hours], Comments, 'Delete'
    FROM deleted
GO

--- TRIGGER FOR UPDATE
CREATE TRIGGER tr_UpdateWorkReports ON WorkHours FOR UPDATE
AS
INSERT INTO WorkHoursLogs(WorkLogId, EmployeeId, OnDate, Task, [Hours], Comments, [Action])
    SELECT WorkReportId, EmployeeID, OnDate, Task, [Hours], Comments, 'InsertUpdate'
    FROM inserted

INSERT INTO WorkHoursLogs(WorkLogId, EmployeeId, OnDate, Task, [Hours], Comments, [Action])
    SELECT WorkReportId, EmployeeID, OnDate, Task, [Hours], Comments, 'DeleteUpdate'
    FROM deleted
GO

--- TEST TRIGGERS
DELETE 
    FROM WorkHoursLogs

INSERT INTO WorkHours(EmployeeId, OnDate, Task, [Hours])
    VALUES (25, GETDATE(), 'TASK: 25', 25)

DELETE 
    FROM WorkHours
    WHERE EmployeeId = 25

UPDATE WorkHours
    SET Comments = 'Updated'
    WHERE EmployeeId = 2


-- 30.Start a database transaction, delete all employees from the 'Sales'
-- department along with all dependent records from the pother tables.
--	*At the end rollback the transaction.

BEGIN TRAN
	ALTER TABLE Departments
	DROP CONSTRAINT FK_Departments_Employees

	ALTER TABLE WorkHours
	DROP CONSTRAINT FK_WorkHours_Employees

	DELETE FROM Employees
	SELECT d.Name
	FROM Employees e
		JOIN Departments d
			ON e.DepartmentID = d.DepartmentID
	WHERE d.Name = 'Sales'
	GROUP BY d.Name
ROLLBACK TRAN

-- 31.Start a database transaction and drop the table EmployeesProjects.
--	*Now how you could restore back the lost table data?

BEGIN TRANSACTION

    DROP TABLE EmployeesProjects

ROLLBACK TRANSACTION

-- 32.Find how to use temporary tables in SQL Server.
--	*Using temporary tables backup all records from EmployeesProjects and
--	 restore them back after dropping and re-creating the table.

CREATE TABLE #TemporaryTable (
	EmployeeId INT,
	ProjectId INT
)

INSERT INTO #TemporaryTable
SELECT EmployeeId, ProjectId
FROM EmployeesProjects

DROP TABLE EmployeesProjects

CREATE TABLE EmployeesProjects (
	EmployeeId INT,
	ProjectId INT,
	CONSTRAINT PK_EmployeesProjects PRIMARY KEY(EmployeeID, ProjectID),
	CONSTRAINT FK_EmployeesProjects_Employees FOREIGN KEY(EmployeeID) 
	REFERENCES Employees(EmployeeID),
	CONSTRAINT FK_EmployeesProjects_Projects FOREIGN KEY(ProjectID) 
	REFERENCES Projects(ProjectID)
)

INSERT INTO EmployeesProjects
SELECT EmployeeId, ProjectId
FROM #TemporaryTable