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

