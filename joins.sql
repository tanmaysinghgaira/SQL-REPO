Create table Coustomer(
    Customer_id INT primary key , -- unique key constraint
    CustomerName varchar (50)
);
--step 2 insert the data into coustomer table
insert into Coustomer (Customer_id , CustomerName) VALUES
(101,'Tanmay'),
(102, 'rohan'),
(103,'sachin'),
(104,'rahul')

--step 3  :create the order table 

Create table Orders(
    OrderId int primary key,
    OrderDate date,
     Customer_id int, -- 
    Product varchar(50)

);
Insert into Orders(OrderId, OrderDate, Customer_id,Product )Values
(1,'2025-01-10',101,'Laptop'),
(2,2025-03-15,102,'Mobile'),
(3,'2025-04-20',103,'Tablet'),
(4,2025-05-25,104,'Desktop'); --Notice customer id  105 dosent exist in coustomer table


select Coustomer.Customer_id, Coustomer.CustomerName,Orders.Product
from Coustomer
inner join Orders
on Coustomer.Customer_id = Orders.Customer_id;



