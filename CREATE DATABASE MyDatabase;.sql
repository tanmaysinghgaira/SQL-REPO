CREATE DATABASE MyDatabase;
GO
USE MyDatabase;
GO
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    HireDate DATE
);
GO
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate)
VALUES (1, 'John', 'Doe', '2025-09-13'),
       (2, 'Jane', 'Smith', '2025-09-12');
GO
SELECT * FROM Employees;
GO
