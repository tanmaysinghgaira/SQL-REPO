
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_age INT
);

INSERT INTO Employees VALUES (101, 'Alice', 30);
INSERT INTO Employees VALUES (102, 'Bob', 25);

-- Column alias example
SELECT emp_name AS EmployeeName, emp_age AS Age
FROM Employees;

-- Table alias example
SELECT e.emp_name, e.emp_age
FROM Employees AS e;
SELECT * FROM Employees;