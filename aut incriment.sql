CREATE TABLE trader(
    id INT PRIMARY KEY IDENTITY(3,3),--IDENTITY(1,1) → means start at 1 and increase by 1 for every new row.
    ---name column is NOT NULL → every student must have a name.
    name VARCHAR(30) NOT NULL ,
    Age INT --age is normal → it can be NULL (empty).
);
INSERT INTO trader(name,Age) VALUES
('John',25),
('Smith',30);
SELECT * FROM trader;

INSERT INTO trader ( Name, Age)
VALUES ( 'John Doe', 3);
DBCC CHECKIDENT ('trader', RESEED, 100);---set the current identity value to 100
INSERT INTO trader ( Name, Age)
VALUES ( ' Doe', 30);