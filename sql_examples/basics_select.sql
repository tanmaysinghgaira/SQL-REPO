-- basics_select.sql
-- 5 basic SELECT examples with sample table and data
-- Run in sqlite3 or any SQL client that supports standard SQL.

-- 1) Create a sample table `Employees` and insert sample rows
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Department TEXT,
    Salary INTEGER
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'Alice', 'Nguyen', 'Engineering', 80000),
(2, 'Bob', 'Smith', 'Marketing', 60000),
(3, 'Carol', 'Lee', 'Engineering', 90000),
(4, 'David', 'Patel', 'HR', 55000),
(5, 'Eve', 'Garcia', 'Marketing', 65000);

-- Example 1: Simple SELECT (show all rows)
-- Problem: show all employees
SELECT * FROM Employees;

-- Example 2: SELECT with WHERE (filter rows)
-- Problem: find employees in Engineering earning more than 85000
SELECT FirstName, LastName, Department, Salary
FROM Employees
WHERE Department = 'Engineering' AND Salary > 85000;

-- Example 3: ORDER BY and LIMIT (sort and take top N)
-- Problem: show top 3 highest-paid employees
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

-- Example 4: DISTINCT (remove duplicates)
-- Problem: list departments without duplicates
SELECT DISTINCT Department FROM Employees;

-- Example 5: Column alias and expressions
-- Problem: show full name and salary after 10% raise (calculated)
SELECT FirstName || ' ' || LastName AS FullName,
       Salary AS OldSalary,
       ROUND(Salary * 1.10, 0) AS SalaryAfter10PercentRaise
FROM Employees;
