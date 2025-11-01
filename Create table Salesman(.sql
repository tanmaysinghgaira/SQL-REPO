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
where city  in ('Delhi','Mumbai','pune');

--details those who live in cities other than delhi and mumbai

Select * from Salesman 
where city not in ('Delhi ','Mumbai',);

--names of different cities present in table
select distinct city from Salesman;

--salesman who recive commission more than 0.12
select  * from Salesman 
where commission >0.12;

--update the city of salesman from mumbai to delhi

UPDATE Salesman
set city ='delhi'
where city = 'mumbai';
--updatin details again

Update Salesman
set city = 'mumbai '
where city ='chennai';

-- update the city of salesman from delhi to pune whose id is 5004
update Salesman
set city ='pune '
where city ='delhi ' and salesman_id =5004;    

--total commission given to all salesman
SELECT sum (commission ) as taotal_commission  from Salesman;
 --testing

-- name of all salesman  whose name starts with 'A'
select name from Salesman
where name like  'A%';

--name of the salesman who is receiving the highest commission
select *from Salesman
where commission  = (select max (commission) from Salesman);