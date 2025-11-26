-- DDL Commands (Create, Alter, Drop)
--1
Create TABLE Student
(
    StudentId int primary key,
    StudentName varchar(50),
    Age int,
    department varchar(50)
);

--2 Create tabel Course
DROP TABLE IF EXISTS Course;
-- Drop table if exists as samr name table may exist
Create table Course
(
    CourseID int primary key,
    Coursename varchar(50),
    Department varchar(50)
);
SELECT *
FROM Course;
--add eamil column to student tabel
Alter table Student add Email varchar(50);

-- modify age column data type
--Alter table Student  Age SMALLINT;

--Rename student tabel to studetnINfo
exec sp_rename 'Student', 'StudentInfo';

--Remove departmetn column from studentInfo tabel

AlTER TABle StudentInfo DROP COLUMN department;

--Create Department tabel
DROP TABLE IF EXISTS Depart;
CREATE TABLE Depart
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

--Dml Commands (Insert, Update, Delete, Select)
--1 Insert data into StudentInfo tabel
INSERT INTO StudentInfo (StudentId, StudentName, Age, Email) VALUES
(1, 'Tanmay', 22, 'tanmay@example.com'),
(2, 'Rohan', 23, 'rohan@example.com'),
(3, 'Sita', 21, 'sita@example.com');    
--

--Update age 
UPDATE StudentInfo SET Age = 24 Where StudentId =2;

-- Increse age by 1 for all students
UPDATE StudentInfo SET Age = Age +1 ;

--Delete student  Rohan 

DELETE FROM  StudentInfo WHERE StudentId =2;

--delete all records from studentinfo table

--DELETE FROM StudentInfo;

Select StudentName, Age from StudentInfo;
hello
Select * from StudentInfo;
   -- use

   --beteween operator
   SELECT * FROM StudentInfo WHERE Age BETWEEN 22 AND 24;
   new

-- ❌ NOT 1NF (repeating groups)
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(100),
    Items VARCHAR(500)  -- Contains multiple items separated by commas
);

-- ✅ 1NF (atomic values)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    Item VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- ❌ NOT 2NF (partial dependency)
CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    StudentName VARCHAR(100),  -- Depends only on StudentID, not the composite key
    PRIMARY KEY (StudentID, CourseID)
);

-- ✅ 2NF
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- ❌ NOT 3NF (transitive dependency)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    DepartmentName VARCHAR(100)  -- Depends on DepartmentID, not EmployeeID
);

-- ✅ 3NF
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
