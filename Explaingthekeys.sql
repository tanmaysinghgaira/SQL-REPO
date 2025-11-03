CREATE  TABLE Department (
     Depid int primary key , -- parimary key constraint 
     deptname  varchar(50) UNIQUE -- unique  key (no duplicate  value allowed  )

);
-- insert data into department table 

Insert into  Department (depid ,deptname) Values 
(101,'Sales'),
(102,'Marketing'),
(103,'Finance'),
(104,'HR'),
(105,'IT');

-- create employee table

CREATE TABLE Employee (
     employee_id  int primary key , --prinmay key consteaint
     empnmae  varchar(50) not null ,  
);;