-- Step 1: Create the database
CREATE DATABASE StudentAttendance;
GO

-- Step 2: Use the newly created database
USE StudentAttendance;
GO

-- Step 3: Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    AttendanceDate DATE,
    IsPresent BIT
);
GO

-- Step 4: Insert sample data
INSERT INTO Students (StudentID, FirstName, LastName, AttendanceDate, IsPresent)
VALUES 
(1, 'Aarav', 'Sharma', GETDATE(), 1),
(2, 'Isha', 'Verma', GETDATE(), 0),
(3, 'Rohan', 'Singh', GETDATE(), 1),
(4, 'Sneha', 'Patel', GETDATE(), 1),
(5, 'Kabir', 'Mehta', GETDATE(), 0);
GO

-- Step 5: View the data
SELECT * FROM Students;
GO
