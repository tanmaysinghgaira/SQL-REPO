-- example_new.sql
-- Small join + aggregation example (SQLite-compatible SQL)
-- Creates tiny sample tables and runs a join + aggregation

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    Amount DECIMAL
);

-- Sample data (idempotent for SQLite)
INSERT OR IGNORE INTO Customers (CustomerID, Name) VALUES (1, 'Alice');
INSERT OR IGNORE INTO Customers (CustomerID, Name) VALUES (2, 'Bob');

INSERT OR IGNORE INTO Orders (OrderID, CustomerID, Amount) VALUES (1, 1, 100.00);
INSERT OR IGNORE INTO Orders (OrderID, CustomerID, Amount) VALUES (2, 1, 50.00);
INSERT OR IGNORE INTO Orders (OrderID, CustomerID, Amount) VALUES (3, 2, 200.00);

-- Aggregation: total spent per customer
SELECT
    c.CustomerID,
    c.Name,
    COUNT(o.OrderID) AS OrdersCount,
    COALESCE(SUM(o.Amount), 0) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC;
