Create table Salesman(
    salesman_id INT primary key,
    name Varchar (100) ,
    city varchar (100),
    commission  DECIMAL(10,2)
);
--Insert the data into salesman table
Insert into Salesman (Salesman_id,name ,city,commission)VALUES(5001,'Ajay','Mumbai',0.12);
Insert into Salesman (Salesman_id,name ,city,commission)VALUES(5002,'Vijay','Bangalore',0.15);
Insert into Salesman (Salesman_id,name ,city,commission)VALUES(5003,'Sanjay','Chennai',0.13);
Insert into Salesman (Salesman_id,name ,city,commission)VALUES(5004,'Ravi','Delhi',0.14);
Insert into Salesman (Salesman_id,name ,city,commission)VALUES(5005,'Amit','Kolkata',0.11);

--details those who  come from delhi and mumbai
SELECT * from Salesman
where city  in ('Delhi','Mumbai');

--details those who live in cities other than delhi and mumbai

Select * from Salesman 
where city not in ('Delhi ','Mumbai');