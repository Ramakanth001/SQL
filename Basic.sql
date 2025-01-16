-- Creating a new DB
CREATE DATABASE practice_db;

-- Delete a DB
DROP DATABASE database_name;

-- select a DB to work
USE practice_db;

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
INSERT INTO table_name (name, quantity) 
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

-- Alias (AS)
SELECT name AS KittyName
FROM cats;

-- UPDATE 
UPDATE table_name
SET breed='Shorthair', name='ken' 
WHERE breed='Tabby';

-- DELETE 
DELETE FROM cats 
WHERE name='Egg';
--  (Delete all rows)
DELETE FROM cats;

-- Concat
SELECT CONCAT (author_fname, ' ', author_lname, '!!')
AS author_full_name
FROM books;

-- Concat WITH SEPERATOR 
SELECT CONCAT_WS('-',title, author_fname, author_lname) 
AS author_key
FROM books;

