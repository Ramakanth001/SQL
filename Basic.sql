-- Creating a new DB
CREATE DATABASE database_name;

-- Delete a DB
DROP DATABASE database_name;

-- select a DB to work
USE database_name;

-- select current db
select DATABASE();

-- Create a Table
CREATE TABLE TABLE_NAME (
column_name_1 data_type,
column_name_2 data_type,
.............);
- Example
CREATE TABLE robot (
r_name varchar(30),
id int,
robo_type varchar(20)
);

-- See tables in current db
SHOW TABLES;

-- Table description
SHOW COLUMNS FROM table_name;
(or)
DESC table_name;

-- To drop a table
DROP TABLE table_name;

-- Insert into a table
INSERT INTO table_name (column_name_1, column_name_2) 
VALUES ('value_1', 'value_2');

-- Multip-le Inserts
INSERT INTO db (name, quantity) 
VALUES 
	('siri', 21), 
	('ravi', 22);

-- NOT NULL constraint
CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- DEFAULT Constraint
CREATE TABLE orders  (    
    name VARCHAR(20) DEFAULT 'unnamed',    
    age INT DEFAULT 99  
);

-- PRIMARY KEY
CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
-- Another option:
CREATE TABLE unique_cats2 (
	cat_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

-- AUTO_INCREMENT
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);