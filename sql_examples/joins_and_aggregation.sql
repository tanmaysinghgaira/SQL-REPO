-- joins_and_aggregation.sql
-- 5 examples demonstrating JOINs and aggregation functions
-- Create sample tables: Customers and Orders
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    City TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate TEXT,
    TotalAmount INTEGER,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Acme Corp', 'New York'),
(2, 'Blue Retail', 'Chicago'),
(3, 'Cedar Supplies', 'Seattle');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2024-01-10', 500),
(102, 1, '2024-02-05', 1500),
(103, 2, '2024-03-12', 250),
(104, 1, '2024-03-20', 750);

-- Example 1: INNER JOIN
-- Problem: list orders with their customer names (only matching rows)
SELECT o.OrderID, c.CustomerName, o.OrderDate, o.TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Example 2: LEFT JOIN
-- Problem: show all customers and any orders they have (customers without orders appear with NULLs)
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;

-- Example 3: GROUP BY with COUNT
-- Problem: count how many orders each customer has
SELECT c.CustomerName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

-- Example 4: HAVING to filter groups
-- Problem: customers with more than 1 order
SELECT c.CustomerName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(o.OrderID) > 1;

-- Example 5: Aggregation functions (SUM, AVG, MAX)
-- Problem: total and average order amount per customer
SELECT c.CustomerName,
       COALESCE(SUM(o.TotalAmount), 0) AS TotalAmountAllOrders,
       COALESCE(ROUND(AVG(o.TotalAmount),2), 0) AS AvgOrderAmount,
       COALESCE(MAX(o.TotalAmount), 0) AS LargestOrder
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
