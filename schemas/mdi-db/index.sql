CREATE DATABASE mdiDatabase;

USE mdiDatabase;

CREATE TABLE department(
    dept_code VARCHAR(10) NOT NULL,
    dept_name VARCHAR(100) NOT NULL,
    dept_HOD int,
    PRIMARY KEY(dept_code)
);

-- insert into department    
INSERT INTO department
(dept_code, dept_name) 
values('it', 'information technology');
INSERT INTO department(dept_code, dept_name) values('fn', 'financial department');
INSERT INTO department(dept_code, dept_name) values('gnd', 'gender department');
INSERT INTO department(dept_code, dept_name) values('bs', 'business studies');
INSERT INTO department(dept_code, dept_name) values('hr', 'human resource');

-- create HOD for each department
UPDATE department SET dept_HOD = '14' WHERE dept_code = 'it';
UPDATE department SET dept_HOD = '6' WHERE dept_code = 'fn';
UPDATE department SET dept_HOD = '9' WHERE dept_code = 'gnd';
UPDATE department SET dept_HOD = '10' WHERE dept_code = 'bs';
UPDATE department SET dept_HOD = '13' WHERE dept_code = 'hr';



CREATE TABLE employee(
    emp_id INT AUTO_INCREMENT,
    emp_lName VARCHAR(35) NOT NULL,
    emp_fName VARCHAR(35) NOT NULL,
    emp_init CHAR(5),
    emp_department VARCHAR(10),
    PRIMARY KEY(emp_id),
    FOREIGN KEY(emp_department) REFERENCES department(dept_code)
);

INSERT INTO employee
(emp_lName, emp_fName, emp_department)
 values('jobe', 'lamin', 'it');

 INSERT INTO employee
(emp_lName, emp_fName,emp_init, emp_department)
 values('manneh', 'mariam', 'm', 'it');

  INSERT INTO employee
(emp_lName, emp_fName,emp_init, emp_department)
 values('jarju', 'malang', 'm', 'it');

-- finance dept
 INSERT INTO employee
(emp_lName, emp_fName, emp_department)
 values('nyassi', 'kebba', 'fn');

 INSERT INTO employee
(emp_lName, emp_fName,emp_init, emp_department)
 values('faye', 'mariam', 'm', 'fn');

--  insert. into gender dept
INSERT INTO employee
(emp_lName, emp_fName, emp_department)
 values('jobe', 'lamin', 'gnd');

 INSERT INTO employee
(emp_lName, emp_fName,emp_init, emp_department)
 values('manneh', 'mariam', 'm', 'gnd');

--  insert into business studies dept
INSERT INTO employee
(emp_lName, emp_fName, emp_department)
 values('jobe', 'lamin', 'bs');

 INSERT INTO employee
(emp_lName, emp_fName,emp_init, emp_department)
 values('manneh', 'mariam', 'm', 'bs');

--  insert into human resourse dept
INSERT INTO employee
(emp_lName, emp_fName, emp_department)
 values('jobe', 'lamin', 'hr');

 INSERT INTO employee
(emp_lName, emp_fName,emp_init, emp_department)
 values('manneh', 'mariam', 'm', 'hr');

-- add foreign to department atfer creating employee table
ALTER TABLE department ADD FOREIGN KEY(dept_HOD) REFERENCES employee(emp_id);

CREATE TABLE program(
    prog_code VARCHAR(10),
    prog_name VARCHAR(100) NOT NULL,
    prog_duration VARCHAR(15) NOT NULL,
    prog_cost DECIMAL(7,2) DEFAULT 0.00,
    PRIMARY KEY(prog_code)
);

-- create computer science program
INSERT INTO program(prog_code, prog_name, prog_duration, prog_cost)
values('cms', 'computer science', '2 years', 50000);

-- create computer science program
INSERT INTO program(prog_code, prog_name, prog_duration, prog_cost)
values('cyb', 'cyber security', '6 months', 25000);

-- create gender and devlopment program
INSERT INTO program(prog_code, prog_name, prog_duration, prog_cost)
values('gn', 'gender and devlopment', '6 months', 15000);

-- create course for banking and finance 
INSERT INTO program(prog_code, prog_name, prog_duration, prog_cost)
values('cat', 'certificate in accountance', '6 months', 35000);

CREATE TABLE course(
    course_id VARCHAR(15),
    course_name VARCHAR(75) NOT NULL UNIQUE,
    course_duration VARCHAR(15) NOT NULL,
    course_pass_mark int,
    PRIMARY KEY(course_id)
);

-- add column to course and position
ALTER TABLE course ADD COlUMN prog_code VARCHAR(10) AFTER course_name;

-- add foreign key to course table
ALTER TABLE course ADD FOREIGN KEY(prog_code) REFERENCES program(prog_code);

-- insert into course
INSERT INTO course(course_id, course_name, prog_code, course_duration, course_pass_mark)
VALUES('db101', 'database1', 'cms', '1 year', 50);

INSERT INTO course(course_id, course_name, prog_code, course_duration, course_pass_mark)
VALUES('web101', 'web development1', 'cms', '1 year', 50);

INSERT INTO course(course_id, course_name, prog_code, course_duration, course_pass_mark)
VALUES('cybsc', 'cyber security', 'cyb', '6 months', 40);

INSERT INTO course(course_id, course_name, prog_code, course_duration, course_pass_mark)
VALUES('web102', 'web development2', 'cms', '1 year', 50);

INSERT INTO course(course_id, course_name, prog_code, course_duration, course_pass_mark)
VALUES('java101', 'java1', 'cms', '1 year', 50);

INSERT INTO course(course_id, course_name, prog_code, course_duration, course_pass_mark)
VALUES('gnd101', 'gender and devlopment', 'gnd', '6 months', 50);


CREATE TABLE student(
    stu_id INT AUTO_INCREMENT,
    stu_lName VARCHAR(45) NOT NULL,
    stu_fName VARCHAR(45) NOT NULL,
    stu_init CHAR(5),
    stu_gender CHAR(1),
    stu_address VARCHAR(100),
    stu_phone VARCHAR(12),
    stu_contact_person VARCHAR(12),
    stu_GPA DECIMAL(3,2) DEFAULT 0.00,
    stu_credit_hour INT NOT NULL DEFAULT 0,
    stu_dept VARCHAR(10),
    PRIMARY KEY(stu_id),
    FOREIGN KEY(stu_dept) REFERENCES department(dept_code)
);

-- insert into student
INSERT INTO student(stu_lName, stu_fName, stu_gender, stu_address, stu_phone, stu_contact_person, stu_GPA, stu_credit_hour, stu_dept)
VALUES('jallow', 'ousman', 'm', 'NYC', '3899484', 'mother', 4.0, 30.00, 'it');

INSERT INTO student(stu_lName, stu_fName, stu_gender, stu_address, stu_phone, stu_contact_person, stu_GPA, stu_credit_hour, stu_dept)
VALUES('njie', 'maimuna', 'f', 'banjul', '3699484', 'brother', 3.80, 30.00, 'fn');

INSERT INTO student(stu_lName, stu_fName, stu_gender, stu_address, stu_phone, stu_contact_person, stu_GPA, stu_credit_hour, stu_dept)
VALUES('jallow', 'jarrie', 'f', 'west feild', '9899484', 'sister', 4.0, 30.00, 'it');

INSERT INTO student(stu_lName, stu_fName, stu_gender, stu_address, stu_phone, stu_contact_person, stu_GPA, stu_credit_hour, stu_dept)
VALUES('saidy', 'alieu', 'm', 'kanifing', '2899484', 'father', 4.0, 30.00, 'hr');

-- delete student from record
DELETE FROM student WHERE stu_id = 2;

-- update student department
UPDATE student SET stu_dept = 'fn' WHERE stu_id = 3;
--update student GPA
UPDATE student SET stu_GPA = 3.20 WHERE stu_id = 3;

CREATE TABLE semester(
    semester_code VARCHAR(10),
    semester_start_date DATE NOT NULL,
    semester_end_date DATE NOT NULL,
    PRIMARY KEY(semester_code)
);

INSERT INTO semester(semester_code, semester_start_date, semester_end_date) 
VALUES('sm2021-1', '2021-01-15', '2021-06-23');

INSERT INTO semester(semester_code, semester_start_date, semester_end_date) 
VALUES('sm2021-2', '2021-07-15', '2021-12-23');




CREATE TABLE enrollment(
    stu_id INT,
    course_id VARCHAR(15),
    semester_period VARCHAR(10),
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(stu_id, course_id, semester_period),
    FOREIGN KEY(stu_id) REFERENCES student(stu_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id),
    FOREIGN KEY(semester_period) REFERENCES semester(semester_code)
);

-- insert into enrollment 
INSERT INTO enrollment(stu_id, course_id, semester_period)
VALUES(1, 'db101', 'sm2021-2');


