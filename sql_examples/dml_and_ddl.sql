-- dml_and_ddl.sql
-- 5 DDL/DML examples: CREATE TABLE, INSERT, UPDATE, DELETE, ALTER
-- 1) CREATE TABLE with primary key and NOT NULL
-- Converted for SQL Server: use IF OBJECT_ID(...) check instead of 'IF NOT EXISTS' clause
IF OBJECT_ID('dbo.Products','U') IS NULL
BEGIN
    CREATE TABLE Products (
        ProductID INT PRIMARY KEY,
        ProductName NVARCHAR(200) NOT NULL,
        Price DECIMAL(10,2) NOT NULL,
        Stock INT CONSTRAINT DF_Products_Stock DEFAULT 0
    );
END

-- 2) INSERT rows (single and multiple)
INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES (1, 'Notebook', 5, 100);
INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES
(2, 'Pen', 1, 500),
(3, 'Stapler', 10, 20);

-- 3) UPDATE with WHERE
-- Problem: increase price of 'Pen' by 20%
UPDATE Products
SET Price = ROUND(Price * 1.20, 0)
WHERE ProductName = 'Pen';

-- Verify update
SELECT ProductID, ProductName, Price, Stock FROM Products;

-- 4) DELETE rows
-- Problem: remove products with zero stock
DELETE FROM Products WHERE Stock = 0;


-- 5) ALTER TABLE (add column) and then backfill data
-- SQL Server syntax: ADD <column> <type>
IF COL_LENGTH('dbo.Products', 'Category') IS NULL
BEGIN
    ALTER TABLE Products ADD Category NVARCHAR(100);
END

-- Fill category for existing rows
UPDATE Products
SET Category = CASE
    WHEN ProductName LIKE '%Pen%' THEN 'Writing'
    WHEN ProductName LIKE '%Note%' THEN 'Paper'
    ELSE 'Office'
END;

SELECT * FROM Products;
