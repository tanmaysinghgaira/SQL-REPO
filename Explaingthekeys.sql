CREATE TABLE Department (
    Depid INT PRIMARY KEY, -- primary key constraint
    DeptName VARCHAR(50) UNIQUE -- unique key (no duplicate value allowed)
);

-- insert data into Department table (use IDs 1..5 to match Employee inserts below)
INSERT INTO Department (Depid, DeptName) VALUES
    (1, 'Sales'),
    (2, 'Marketing'),
    (3, 'Finance'),
    (4, 'HR'),
    (5, 'IT');

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY, -- primary key constraint
    empname VARCHAR(50) NOT NULL, -- fixed typo (was empnmae)
    email VARCHAR(50) UNIQUE,
    Depid INT, -- foreign key reference Department table
    FOREIGN KEY (Depid) REFERENCES Department (Depid)
);

-- insert data into employee table (Depid values match Department.Depid above)
INSERT INTO Employee (employee_id, empname, Depid) VALUES
    (101, 'Amit Sharma', 1),
    (102, 'Priya Verma', 2),
    (103, 'Rahul Singh', 3),
    (104, 'Sneha Gupta', 4),
    (105, 'Vikram Patel', 5);

SELECT * FROM Employee;
CREATE TABLE Exam (
    StudentID INT,
    SubjectID INT,
    Marks INT,
    PRIMARY KEY (StudentID, SubjectID)   -- Composite Key (2 columns together form a unique record)
);

-- Insert records into Exam
INSERT INTO Exam (StudentID, SubjectID, Marks) VALUES
(1, 101, 88),
(1, 102, 92),
(2, 101, 75);

----------------------------------------------------------

-- Example of data retrieval
-- 1. Show all employees with their department names
SELECT e.employee_id AS EmpID, e.empname AS EmpName, d.DeptName, e.email
FROM Employee e
JOIN Department d ON e.Depid = d.Depid;
select * from Department;


-- use of in
 select * from Employee  
 where employee_id in (101, 103, 105);