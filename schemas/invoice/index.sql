CREATE DATABASE invoice

USE invoice

-- create vendor table
CREATE TABLE VENDOR (
V_CODE INTEGER NOT NULL UNIQUE,
V_NAME VARCHAR(35) NOT NULL,
V_CONTACT VARCHAR(25) NOT NULL,
V_AREACODE CHAR(3) NOT NULL,
V_PHONE CHAR(8) NOT NULL,
V_STATE CHAR(2) NOT NULL,
V_ORDER CHAR(1) NOT NULL,
PRIMARY KEY (V_CODE)
);

-- create product table
CREATE TABLE PRODUCT (
P_CODE VARCHAR(10) NOT NULL,
P_DESCRIPT VARCHAR(35) NOT NULL,
P_INDATE DATE NOT NULL,
P_QOH SMALLINT NOT NULL,
P_MIN SMALLINT NOT NULL,
P_PRICE DECIMAL(8,2) NOT NULL,
P_DISCOUNT DECIMAL(5,2) NOT NULL,
V_CODE INT,
PRIMARY KEY(P_CODE),
FOREIGN KEY (V_CODE) REFERENCES VENDOR(V_CODE)
);

-- add foreign key to product table
ALTER TABLE PRODUCT
ADD FOREIGN KEY (V_CODE) REFERENCES VENDOR(V_CODE);


CREATE TABLE CUSTOMER (
CUS_CODE INT,
CUS_LNAME VARCHAR(15) NOT NULL,
CUS_FNAME VARCHAR(15) NOT NULL,
CUS_INITIAL CHAR(1),
CUS_AREACODE CHAR(3) DEFAULT '615' NOT NULL,
CUS_PHONE CHAR(8) NOT NULL,
CUS_BALANCE DECIMAL(9,2) DEFAULT 0.00,
PRIMARY KEY(CUS_CODE)
);

CREATE TABLE INVOICE (
INV_NUMBER INT,
CUS_CODE INT NOT NULL,
INV_DATE DATETIME,
PRIMARY KEY(INV_NUMBER)
);


-- add foreign key after creating invoice

CREATE TABLE LINE (
INV_NUMBER INT NOT NULL,
LINE_NUMBER INT NOT NULL,
P_CODE VARCHAR(10) NOT NULL,
LINE_UNITS DECIMAL(9,2) DEFAULT 0.00,
LINE_PRICE DECIMAL(9,2) DEFAULT 0.00,
PRIMARY KEY(INV_NUMBER, LINE_NUMBER),
FOREIGN KEY(INV_NUMBER) REFERENCES INVOICE(INV_NUMBER) ON DELETE CASCADE,
FOREIGN KEY (P_CODE) REFERENCES PRODUCT(P_CODE) ON DELETE CASCADE
);

-- insert into vendor
INSERT INTO VENDOR
 VALUES (21225,'Bryson, Inc.','Smithson','615','223-3234','TN','Y');


INSERT INTO VENDOR
 VALUES (
     21226,'Superloo, Inc.','Flushing','904','215-8995','FL','N');

-- inert into product
INSERT INTO PRODUCT VALUES ('11QER31','Power painter', '03-11-15', 15, 3,109.99,0.00,21225);  
INSERT INTO PRODUCT VALUES ('11QER32','Bread raw', '03-12-15', 25, 5,209.99,0.00,21226); 
INSERT INTO PRODUCT VALUES ('11QER33','Ice stack', '12-10-20', 25, 5,209.99,0.00,21226); 
INSERT INTO PRODUCT VALUES ('11QER34','Beans raw', '03-04-15', 25, 5,209.99,0.00,21225); 

-- update record in produc teble
UPDATE PRODUCT
SET P_DESCRIPT = 'Beans'
WHERE P_CODE = '11QER34'



-- insert into customer
INSERT INTO customer
(cus_code, cus_lname, cus_fname, cus_areacode, cus_phone, cus_balance)
values(1, 'alieu', 'saidy', 'c02', '220234',250.30);

INSERT INTO customer
(cus_code, cus_lname, cus_fname, cus_areacode, cus_phone, cus_balance)
values(2, 'khadijah', 'touray', 'e02', '220434',290.30);

INSERT INTO customer
(cus_code, cus_lname, cus_fname, cus_areacode, cus_phone, cus_balance)
values(3, 'mariama', 'sowe', 'p12', '90993',190.30);

INSERT INTO customer
(cus_code, cus_lname, cus_fname, cus_areacode, cus_phone, cus_balance)
values(4, 'mariama', 'saidy', 'z02', '10993',180.00);
