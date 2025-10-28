-- Stored Procedures Examples
-- Demonstrates creating and using stored procedures in SQL Server

-- Create a table for products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

-- Basic stored procedure to insert a product
CREATE PROCEDURE InsertProduct
    @Name NVARCHAR(100),
    @Price DECIMAL(10,2),
    @Stock INT
AS
BEGIN
    INSERT INTO Products (Name, Price, Stock)
    VALUES (@Name, @Price, @Stock);
    
    SELECT SCOPE_IDENTITY() as NewProductID;
END;

-- Stored procedure with error handling
CREATE PROCEDURE UpdateProductStock
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE Products 
            SET Stock = Stock + @Quantity
            WHERE ProductID = @ProductID;

            IF @@ROWCOUNT = 0
                THROW 50001, 'Product not found', 1;
            
            IF (SELECT Stock FROM Products WHERE ProductID = @ProductID) < 0
                THROW 50002, 'Insufficient stock', 1;
        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        
        THROW;
    END CATCH;
END;

-- Example of using the stored procedures
-- Execute InsertProduct
EXEC InsertProduct 'Laptop', 999.99, 10;

-- Execute UpdateProductStock
EXEC UpdateProductStock @ProductID = 1, @Quantity = -2;