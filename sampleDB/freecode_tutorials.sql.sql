UPDATTE student 
SET major = 'Bio'
WHERE major = 'Biology';

-- updating a speacific attribute
UPDATTE student 
SET major = 'Bio'
WHERE student_id = 5;

-- updating a two attributes combining two majors together
UPDATTE student 
SET major = 'Bio'
WHERE major = 'Biology' OR 'Comp Sci';

-- Making a queries for a mulitples column
UPDATTE student 
SET major = 'Bio', name = 'Undecided';
WHERE student_id = 1;

-- This one will affect avery single column in the datbase
UPDATE student
SET major = 'Undecided';

-- Deleting rows from a table
DELETE FROM student

-- Speacific deleting
DELETE FROM student
WHERE student_id = 5;

-- Deleting from mulitples column
DELETE FROM student
SET major = 'Bio', name = 'Undecided';

-- Speacific queries (fancy one)
SELECT name FROM student;
SELECT student.name, student.major
FROM student;

-- Seleting in ascending oder
SELECT name FROM student;
SELECT student.name, student.major
FROM student
ORDER BY name;

-- Seleting in Descending oder
SELECT name FROM student;
SELECT student.name, student.major
FROM student
ORDER BY name DESC;

-- Seleting in ascending oder 
SELECT * FROM student;
ORDER BY student_id ASC;

-- Seleting in descending oder 
SELECT * FROM student;
ORDER BY student_id DESC;

-- Selecting from two columns in a ascending order by major
SELECT * FROM student
ORDER BY major, student_id;

-- Selecting from two columns in a ascending order by student_id
SELECT * FROM student
ORDER BY major, student_id DESC;

-- Limiting the result of your query
SELECT * FROM student
ORDER BY student_id DESC
LIMIT 2;

-- <, >, =<, =>, =, <>, AND< OR (Operators in SQL)
-- Not equals to statement
SELECT name, major
FROM student 
WHERE major <> 'Com Sci'

-- Lessthan Operator
SELECT *
FROM student
WHERE student_id <3;

-- Greaterthan Operator
SELECT *
FROM student
WHERE student_id >3;

-- Greaterthan Operator
SELECT *
FROM student
WHERE student_id =<3 AND <> 'Jack';

-- Selecting for those who fit the condition
SELECT * FROM student
WHERE name In ('Mariama', 'Alieu', 'Jainaba');

-- Selecting for those who fit the condition
SELECT * FROM student
WHERE name In ('Mariama', 'Alieu', 'Jainaba') AND student_id >2;

-- Foreign key referencing
FOREING KEY (mgr_id) references employee(emp_id) ON DELETE  SET NULL

--  Adding a foreign key
ALERT TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCE branch(branch_id)
ON DELETE SET NULL;

--  Composite Primary Key Tbale
CREATE TABLE work_with (
emp_id INT,
client_id INt,
total_sales INT,
FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCASE,
PRIMARY KEY (emp_id, client_id)
);

--  Table consist of two KEYS, one is a PRIMARY KEY and the other is a FOREIGN KEY
CREAT TABLE branch_supplier (
branch_id INT,
supplier_name VARCHAR(30),
supply_type VARCHAR(30),
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
PRIMARY KEY (branch_id, supplier_name)
);

-- Add a column in an existence table
ALTER table department	
add emp_id INT;