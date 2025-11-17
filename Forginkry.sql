CREATE  TABLE Child_tabel(
    Customer INT PRIMARY KEY,
    Name Varchar (100),
    City VARCHAR(50)
);


DROP TABLE IF EXISTS Child_tabel;

CREATE TABLE  Ord(
    Order_Id INT PRIMARY KEY,
    Order_Date DATE,
    Customer INT,
    Product VARCHAR(50),
    CONSTRAINT FK_Orders_Child FOREIGN KEY (Customer) REFERENCES Child_tabel(Customer)
);

INSERT INTO Child_tabel (Customer, Name, City )VALUES
(1,'TANMAY','UTTRAKHAND'),
(2, 'RAM','NANITAL'),
(3,'SHAM','DEHTADUN');

INSERT into Ord(Order_Id,Order_Date,Customer,Product)
VALUES
(1,'2024-01-10',1,'LAPTOP'),
(2,'2024-03-15',2,'MOBILE'),
(3,'2024-04-20',3,'TABLET'),
(4,'2024-05-25',2,'DESKTOP');

SELECT * FROM Ord;