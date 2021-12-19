CREATE DATABASE mdiDatabase;

USE mdiDatabase;

CREATE TABLE department(
    dept_code VARCHAR(10) NOT NULL,
    dept_name VARCHAR(100) NOT NULL,
    dept_HOD int,
    PRIMARY KEY(dept_code)
);

-- add foreign to department
ALTER TABLE department ADD FOREIGN KEY(dept_HOD) REFERENCES employee(emp_id);

CREATE TABLE employee(
    emp_id INT AUTO_INCREMENT,
    emp_lName VARCHAR(35) NOT NULL,
    emp_fName VARCHAR(35) NOT NULL,
    emp_init CHAR(5),
    emp_department VARCHAR(10),
    PRIMARY KEY(emp_id),
    FOREIGN KEY(emp_department) REFERENCES department(dept_code)
);

CREATE TABLE program(
    prog_code VARCHAR(10),
    prog_name VARCHAR(100) NOT NULL,
    prog_duration VARCHAR(15) NOT NULL,
    prog_cost DECIMAL(7,2) DEFAULT 0.00,
    PRIMARY KEY(prog_code)
);

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


CREATE TABLE student(
    stu_id INT AUTO_INCREMENT,
    stu_lName VARCHAR(45) NOT NULL,
    stu_fName VARCHAR(45) NOT NULL,
    stu_init CHAR(5),
    stu_gender CHAR(1),
    stu_address VARCHAR(100),
    stu_phone VARCHAR(12),
    stu_contact_person VARCHAR(12),
    stu_GPA DECIMAL DEFAULT 0.00,
    stu_credit_hour INT NOT NULL DEFAULT 0,
    stu_dept VARCHAR(10),
    PRIMARY KEY(stu_id),
    FOREIGN KEY(stu_dept) REFERENCES department(dept_code)
);

CREATE TABLE semester(
    semester_code VARCHAR(10),
    semester_start_date DATE NOT NULL,
    semester_end_date DATE NOT NULL,
    PRIMARY KEY(semester_code)
);


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