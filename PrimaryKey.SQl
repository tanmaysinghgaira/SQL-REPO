CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

INSERT INTO Students VALUES (1, 'Tanmay', 18);  -- ✅ Works
INSERT INTO Students VALUES (2, 'Ravi', 19);    -- ✅ Works
--INSERT INTO Students VALUES (1, 'Aman', 20);    -- ❌ Error (id=1 already exists)
--INSERT INTO Students VALUES (NULL, 'Priya', 21);-- ❌ Error (Primary Key cannot be NULL)
SELECT * FROM Students;