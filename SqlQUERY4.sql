

 
-- Drop tables if they exist (drop child tables first to avoid FK errors)
IF OBJECT_ID('dbo.Marks', 'U') IS NOT NULL DROP TABLE dbo.Marks;
IF OBJECT_ID('dbo.Subjects', 'U') IS NOT NULL DROP TABLE dbo.Subjects;
IF OBJECT_ID('dbo.Students', 'U') IS NOT NULL DROP TABLE dbo.Students;
GO

CREATE TABLE Students ( 
    Roll_no INT PRIMARY KEY, 
    Name VARCHAR(100), 
    Address VARCHAR(200) 
); 
 
CREATE TABLE Subjects ( 
    sub_code VARCHAR(10) PRIMARY KEY, 
    sub_name VARCHAR(100) 
); 
 
CREATE TABLE Marks ( 
    Roll_no INT, 
    sub_code VARCHAR(10), 
    marks INT, 
    FOREIGN KEY (Roll_no) REFERENCES Students(Roll_no), 
    FOREIGN KEY (sub_code) REFERENCES Subjects(sub_code) 
); 
 
INSERT INTO Subjects (sub_code, sub_name) VALUES 
('BCA411', 'DBMS'), 
('BCA412', 'OS'), 
('BCA413', 'CC'), 
('BCA414', 'Maths'); 
 
INSERT INTO Students (Roll_no, Name, Address) VALUES  
(1, 'Student_1', 'Address_1'), (2, 'Student_2', 'Address_2'), (3, 'Student_3', 'Address_3'),  
(4, 'Student_4', 'Address_4'), (5, 'Student_5', 'Address_5'), (6, 'Student_6', 'Address_6'),  
(7, 'Student_7', 'Address_7'), (8, 'Student_8', 'Address_8'), (9, 'Student_9', 'Address_9'),  
(10, 'Student_10', 'Address_10'), (11, 'Student_11', 'Address_11'), (12, 'Student_12', 'Address_12'),  
(13, 'Student_13', 'Address_13'), (14, 'Student_14', 'Address_14'), (15, 'Student_15', 'Address_15'), 
(16, 'Student_16', 'Address_16'), (17, 'Student_17', 'Address_17'), (18, 'Student_18', 'Address_18'), 
(19, 'Student_19', 'Address_19'), (20, 'Student_20', 'Address_20'), (21, 'Student_21', 'Address_21'), 
(22, 'Student_22', 'Address_22'), (23, 'Student_23', 'Address_23'), (24, 'Student_24', 'Address_24'), 
(25, 'Student_25', 'Address_25'); 
 
INSERT INTO Marks (Roll_no, sub_code, marks) VALUES  
(1, 'BCA411', 66), (1, 'BCA412', 75), (1, 'BCA413', 46), (1, 'BCA414', 66), (2, 'BCA411', 53), 
(2, 'BCA412', 55), (2, 'BCA413', 51), (2, 'BCA414', 56), (3, 'BCA411', 40), (3, 'BCA412', 87),  
(3, 'BCA413', 41), (3, 'BCA414', 66), (4, 'BCA411', 49), (4, 'BCA412', 44), (4, 'BCA413', 61),  
(4, 'BCA414', 36), (5, 'BCA411', 100), (5, 'BCA412', 72), (5, 'BCA413', 46), (5, 'BCA414', 76), 
(6, 'BCA411', 48), (6, 'BCA412', 43), (6, 'BCA413', 99), (6, 'BCA414', 86), (7, 'BCA411', 68),  
(7, 'BCA412', 85), (7, 'BCA413', 44), (7, 'BCA414', 56), (8, 'BCA411', 47), (8, 'BCA412', 99),  
(8, 'BCA413', 58), (8, 'BCA414', 25), (9, 'BCA411', 50), (9, 'BCA412', 96), (9, 'BCA413', 99),  
(9, 'BCA414', 79), (10, 'BCA411', 83), (10, 'BCA412', 66), (10, 'BCA413', 48), (10, 'BCA414', 32), 
(11, 'BCA411', 96), (11, 'BCA412', 92), (11, 'BCA413', 93), (11, 'BCA414', 68), (12, 'BCA411', 94),  
(12, 'BCA412', 53), (12, 'BCA413', 71), (12, 'BCA414', 66), (13, 'BCA411', 95), (13, 'BCA412', 66),  
(13, 'BCA413', 84), (13, 'BCA414', 66), (14, 'BCA411', 47), (14, 'BCA412', 72), (14, 'BCA413', 92),  
(14, 'BCA414', 66), (15, 'BCA411', 71), (15, 'BCA412', 81), (15, 'BCA413', 48), (15, 'BCA414', 26), 
(16, 'BCA411', 81), (16, 'BCA412', 55), (16, 'BCA413', 94), (16, 'BCA414', 66), (17, 'BCA411', 76),  
(17, 'BCA412', 75), (17, 'BCA413', 40), (17, 'BCA414', 87), (18, 'BCA411', 93), (18, 'BCA412', 86),  
(18, 'BCA413', 52), (18, 'BCA414', 66), (19, 'BCA411', 78), (19, 'BCA412', 72), (19, 'BCA413', 68),  
(19, 'BCA414', 90), (20, 'BCA411', 86), (20, 'BCA412', 42), (20, 'BCA413', 54), (20, 'BCA414', 26), 
(21, 'BCA411', 87), (21, 'BCA412', 99), (21, 'BCA413', 45), (21, 'BCA414', 66), (22, 'BCA411', 91),  
(22, 'BCA412', 44), (22, 'BCA413', 88), (22, 'BCA414', 66), (23, 'BCA411', 67), (23, 'BCA412', 78),  
(23, 'BCA413', 91), (23, 'BCA414', 86), (24, 'BCA411', 81), (24, 'BCA412', 43), (24, 'BCA413', 42),  
(24, 'BCA414', 22), (25, 'BCA411', 64), (25, 'BCA412', 96), (25, 'BCA413', 99), (25, 'BCA414', 89);