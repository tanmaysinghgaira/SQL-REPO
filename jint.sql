CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- step 2: insert data into customers table
INSERT INTO Customers (Customer_id, CustomerName) VALUES
    (101, 'Tanmay'),
    (102, 'Rohan'),
    (103, 'Sachin'),
    (104, 'Rahul');

-- step 3: create the orders table (note plural name to avoid reserved word)
SELECT * FROM Customers;

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    OrderDate DATE,
    Customer_id INT,
    Product VARCHAR(50),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

INSERT INTO Orders (OrderId, OrderDate, Customer_id, Product) VALUES
    (1, '2025-01-10', 101, 'Laptop'),
    (2, '2025-03-15', 102, 'Mobile'),
    (3, '2025-04-20', 103, 'Tablet'),
    (4, '2025-05-25', 104, 'Desktop'); -- all customer IDs exist in Customers

-- Correct join between Customers and Orders
SELECT c.Customer_id,
       c.CustomerName,
       o.Product
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_id = o.Customer_id;



