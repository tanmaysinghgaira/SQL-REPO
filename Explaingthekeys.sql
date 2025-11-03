CREATE TABLE Department
(
    Depid int primary key ,
    -- parimary key constraint 
    deptname varchar(50) UNIQUE
    -- unique  key (no duplicate  value allowed  )

);
-- insert data into department table 

Insert into  Department
    (depid ,deptname)
Values
    (101, 'Sales'),
    (102, 'Marketing'),
    (103, 'Finance'),
    (104, 'HR'),
    (105, 'IT');

-- create employee table

CREATE TABLE Employee
(
    employee_id int primary key ,
    --prinmay key consteaint
    empnmae varchar(50) not null ,
    email varchar (50) unique,
    
    Depid int, -- foreign key  reference department talble

    foreign  key (Depid ) references Department (Depid)

);


-- inset data into employee table 
INSERT INTO Employee (employee_id, empnmae,  Depid) VALUES
(101, 'Amit Sharma',  1 ),
(102, 'Priya Verma',  2 ),
(103, 'Rahul Singh',  3 ),
(104, 'Sneha Gupta',  4 ),
(105, 'Vikram Patel',  5 );
select * from Employee;