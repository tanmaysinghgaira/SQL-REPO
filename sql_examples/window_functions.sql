-- Window Functions Examples
-- Shows common window function use cases in SQL Server

-- Create sample employee data
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE
);

-- Sample data
INSERT INTO Employees VALUES 
    (1, 1, 50000, '2020-01-15'),
    (2, 1, 60000, '2019-03-20'),
    (3, 2, 55000, '2021-02-10'),
    (4, 2, 65000, '2018-06-05'),
    (5, 1, 70000, '2017-12-25');

-- ROW_NUMBER: Assign sequential numbers
SELECT 
    EmployeeID,
    DepartmentID,
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) as SalaryRank,
    ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) as DeptSalaryRank
FROM Employees;

-- RANK and DENSE_RANK: Handle ties differently
SELECT 
    EmployeeID,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) as SalaryRank,
    DENSE_RANK() OVER (ORDER BY Salary DESC) as DenseSalaryRank
FROM Employees;

-- Running totals and moving averages
SELECT 
    EmployeeID,
    Salary,
    SUM(Salary) OVER (ORDER BY HireDate) as RunningTotalSalary,
    AVG(Salary) OVER (ORDER BY HireDate ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) as MovingAvgSalary
FROM Employees;

-- First/last values in groups
SELECT 
    EmployeeID,
    DepartmentID,
    Salary,
    FIRST_VALUE(Salary) OVER (PARTITION BY DepartmentID ORDER BY HireDate) as FirstSalaryInDept,
    LAST_VALUE(Salary) OVER (PARTITION BY DepartmentID ORDER BY HireDate 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as LastSalaryInDept
FROM Employees;