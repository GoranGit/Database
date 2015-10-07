USE TelerikAcademy
--Write a SQL query to find all information about all departments (use "TelerikAcademy" database).
SELECT *
FROM Departments

--Write a SQL query to find all department names.
SELECT e.Name
FROM Departments e

--Write a SQL query to find the salary of each employee.
SELECT e.FirstName + ' ' + e.LastName AS [FullName], e.Salary
FROM Employees e

--Write a SQL to find the full name of each employee.
SELECT e.FirstName + ' ' + e.LastName AS [FullName]
FROM Employees e

--Write a SQL query to find the email addresses of each employee (by his first and last name). 
--Consider that the mail domain is telerik.com. Emails should look like “John.Doe@telerik.com".
-- The produced column should be named "Full Email Addresses".
SELECT e.FirstName + '.' + e.LastName + '@telerik.com' AS  [Full Email Address]
FROM Employees e

--Write a SQL query to find all different employee salaries.
SELECT DISTINCT e.Salary 
FROM Employees e

--Write a SQL query to find all information about the employees whose job title is “Sales Representative“.
SELECT *
FROM Employees
WHERE JobTitle = 'Sales Representative'

--Write a SQL query to find the names of all employees whose first name starts with "SA".
SELECT e.FirstName+' '+e.LastName AS [Full Name]
FROM Employees e
WHERE FirstName LIKE 'SA%'


--Write a SQL query to find the names of all employees whose last name contains "ei".
SELECT e.FirstName+' '+e.LastName AS [Full Name]
FROM Employees e
WHERE LastName LIKE '%ei%'


--Write a SQL query to find the salary of all employees whose salary is in the range [20000…30000].
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary>19999 AND Salary<30001


--Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary = 25000 OR Salary = 14000 OR Salary = 12500 OR Salary = 23600


--Write a SQL query to find all employees that do not have manager.
SELECT *
FROM Employees
WHERE ManagerId IS NULL


--Write a SQL query to find all employees that have salary more than 50000. 
--Order them in decreasing order by salary.
SELECT * 
FROM Employees
WHERE Salary>50000
ORDER BY Salary DESC


--Write a SQL query to find the top 5 best paid employees.
SELECT TOP 5 * 
FROM Employees
WHERE Salary>50000
ORDER BY Salary DESC


--Write a SQL query to find all employees along with their address. Use inner join with ON clause.
SELECT e.FirstName, e.LastName, a.AddressText 
FROM Employees e
INNER JOIN Addresses a
ON e.AddressId = a.AddressId


--Write a SQL query to find all employees and their address. Use equijoins (conditions in the WHERE clause).
SELECT e.FirstName, e.LastName, a.AddressText 
FROM Employees e, Addresses a
WHERE e.AddressId = a.AddressId


--Write a SQL query to find all employees along with their manager.
SELECT e.FirstName+' '+e.LastName AS [Employee], ISNULL(m.FirstName+' '+m.LastName,'Has no manager') AS [Manager]
FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerId = m.EmployeeId

--Write a SQL query to find all employees, along with their manager and their address. 
--Join the 3 tables: Employees e, Employees m and Addresses a.
SELECT e.FirstName+' '+e.LastName AS [Employee], ISNULL(m.FirstName+' '+m.LastName,'Has no manager') AS [Manager], a.AddressText
FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerId = m.EmployeeId
LEFT OUTER JOIN  Addresses a
ON e.AddressId = a.AddressId


--Write a SQL query to find all departments and all town names as a single list. Use UNION
SELECT Name FROM Departments
UNION
SELECT Name FROM Towns


--Write a SQL query to find all the employees and the manager for each of them along with the employees that do not have manager.
-- Use right outer join. Rewrite the query to use left outer join.
SELECT e.FirstName+' '+e.LastName AS [Employee], ISNULL(m.FirstName+' '+m.LastName,'Has no manager') AS [Manager]
FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerId = m.EmployeeId


SELECT e.FirstName+' '+e.LastName AS [Employee], ISNULL(m.FirstName+' '+m.LastName,'Has no manager') AS [Manager]
FROM Employees m
RIGHT OUTER JOIN Employees e
ON m.EmployeeId = e.ManagerId



--Write a SQL query to find the names of all employees from the departments "Sales" and 
--"Finance" whose hire year is between 1995 and 2005.
SELECT e.FirstName, e.LastName, e.HireDate, d.Name
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentId = d.DepartmentId
WHERE e.HireDate BETWEEN '1995-01-01 00:00:00' AND '2005-01-01 00:00:00'
AND d.Name = 'Sales' OR d.Name = 'Finance'
