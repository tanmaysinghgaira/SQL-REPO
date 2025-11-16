-- DDL Commands (Create, Alter, Drop)
--1
Create TABLE Student(
    StudentId int primary key,
    StudentName varchar(50),
    Age int,
    department varchar(50)
);

--2 Create tabel Course
DROP TABLE IF EXISTS Course; -- Drop table if exists as samr name table may exist
Create table Course(
    CourseID int primary key,
    Coursename varchar(50),
    Department varchar(50)
);
 SELECT * FROM Course;
--add eamil column to student tabel
Alter table Student add Email varchar(50);

-- modify age column data type
Alter table Student MODIFY Age SMALLINT;

--Rename student tabel to studetnINfo
Rename table Student TO StudentInfo   ;