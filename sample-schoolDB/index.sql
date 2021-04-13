-- create school db
CREATE DATABASE school;
-- use school db
USE school;

-- create tables 
CREATE TABLE students(
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    login VARCHAR(25),
    age INT,
    gpa REAL,
    house VARCHAR(100)
);


-- insert in to students
INSERT INTO students
(first_name,last_name,login,age,gpa,house)
VALUES
('Ebrima', '2ray', '2ray202', 15, 4.0,'Gamhome12'),
('Lamin', 'Gibba', 'lifeisgood', 15, 3.8, 'Gamhome12'),
('Jankey','Faal', 'fajan30', 18, 2.7, 'Gamhome12'),
('Bob', 'Sow', 'sow999', 23, 4.0, 'Fatplote4'),
('Sula', 'Dicko', 'dicko100', 14, 4.0, 'Hirmfirm3');


-- select first, last names
SELECT first_name, last_name FROM students;

-- read from the entire db
SELECT * FROM students;

-- select base one house name
SELECT * FROM students WHERE house = 'Gamhome12';

-- select students base om house and gpa scores
SElECT * FROM students WHERE house = 'Gamhome12' AND gpa > 3.8;

-- the like clause
SELECT first_name, last_name FROM students WHERE first_name LIKE 'E%';

-- the count, the number of column(s) in a table
SELECT COUNT(first_name) FROM students;

-- the limit
SELECT * FROM students LIMIT 3;

-- order by
SELECT * FROM students ORDER BY house;

-- the group by
SELECT COUNT(first_name), house FROM students GROUP BY house;
