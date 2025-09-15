-- Create a simple database
CREATE DATABASE SimpleDB;

-- Use the database


-- Create a simple table
CREATE TABLE mployees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert some information
INSERT INTO mployees (EmployeeID, FirstName, LastName, Department) VALUES
(1, 'John', 'Doe', 'HR'),
(2, 'Jane', 'Smith', 'Finance'),
(3, 'Mike', 'Brown', 'IT');
SELECT * FROM mployees;
