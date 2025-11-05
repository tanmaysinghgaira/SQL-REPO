Create table Coustomer(
    Customer_id INT primary key , -- unique key constraint
    CustomerName varchar (50)
);
--step 2 insert the data into coustomer table
insert into Coustomer (Customer_id , CoustomerName) VALUES
(101,'Tanmay'),
(102, 'rohan'),
(103,'sachin'),
(104,'rahul')

--step 3  :create the order table 

Create table Orders(
    OrderId int primary key,
    OrderDate date,
    Customer_id int,

);