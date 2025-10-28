-- Index Optimization Examples
-- Shows different types of indexes and their use cases

-- Create a sample orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status NVARCHAR(20),
    TotalAmount DECIMAL(10,2)
);

-- Create a clustered index (automatically created with PRIMARY KEY)
-- Already done by PRIMARY KEY constraint above

-- Create a simple nonclustered index
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID 
ON Orders(CustomerID);

-- Create a composite index
CREATE NONCLUSTERED INDEX IX_Orders_Status_Date 
ON Orders(Status, OrderDate);

-- Create a covering index (includes non-key columns)
CREATE NONCLUSTERED INDEX IX_Orders_Customer_Include 
ON Orders(CustomerID)
INCLUDE (OrderDate, TotalAmount);

-- Create a filtered index
CREATE NONCLUSTERED INDEX IX_Orders_HighValue 
ON Orders(OrderID, CustomerID)
WHERE TotalAmount > 1000;

-- Example queries that use these indexes effectively

-- Uses IX_Orders_CustomerID
SELECT OrderID, OrderDate
FROM Orders
WHERE CustomerID = 123;

-- Uses IX_Orders_Status_Date
SELECT OrderID, CustomerID
FROM Orders
WHERE Status = 'Pending'
AND OrderDate >= '2023-01-01';

-- Uses IX_Orders_Customer_Include (covering index)
SELECT CustomerID, OrderDate, TotalAmount
FROM Orders
WHERE CustomerID BETWEEN 100 AND 200;

-- Uses IX_Orders_HighValue
SELECT OrderID, CustomerID
FROM Orders
WHERE TotalAmount > 1000;

-- Example of analyzing index usage
SELECT 
    OBJECT_NAME(i.object_id) as TableName,
    i.name as IndexName,
    i.type_desc as IndexType,
    us.user_seeks,
    us.user_scans,
    us.user_lookups,
    us.user_updates
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats us
    ON i.object_id = us.object_id
    AND i.index_id = us.index_id
WHERE OBJECT_NAME(i.object_id) = 'Orders';