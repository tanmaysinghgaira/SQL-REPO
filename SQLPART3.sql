CREATE TABLE trader(
    id INT PRIMARY KEY IDENTITY(3,3),
    name VARCHAR(30) NOT NULL ,
    Age INT
);
INSERT INTO trader(name,Age) VALUES
('John',25),
('Smith',30);
SELECT * FROM trader;

INSERT INTO trader ( Name, Age)
VALUES ( 'John Doe', 3);