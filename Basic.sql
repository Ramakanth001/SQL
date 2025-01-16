-- Creating a new DB
CREATE DATABASE practice_db;

-- Delete a DB
DROP DATABASE database_name;

-- Get a list of Databases
show databases;

-- select a DB to work
USE practice_db;

-- select current db
select DATABASE();

-- Add 2 numbers
select 3+4;

-- Create a Table
CREATE TABLE TABLE_NAME (
column_name_1 data_type,
column_name_2 data_type,
.............);

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

-- Dummy Insert (NULL values for all columns in a Record will be inserted)
INSERT INTO PEOPLE() VALUES ();

-- Insert into a table
INSERT INTO table_name (column_name_1, column_name_2) 
VALUES ('value_1', 'value_2');

-- Multip-le Inserts
INSERT INTO table_name (name, quantity) 
VALUES 
	('siri', 21), 
	('ravi', 22);

-- Quotes in values
INSERT INTO db (name, quantity) 
VALUES 
	('siri\s', 21), -- single quote
	('ravi"s"', 22); -- double quote
    
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

-- Usage NOT NULL and DEFAULT
CREATE TABLE orders  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);
INSERT INTO People2 (first_name, last_name, age)
VALUES
    ('NULL', 'serin', 22);
-- (While inserting a row, if no value is provided for name or age, the default values would be inserted but this is not redundant because even though the insert can never be null since you have default, it is possible that you can insert a NULL value manually)

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

-- Starts from 3 and goes till end of string
SELECT SUBSTRING('Rappa', 3)
AS COL;

-- Starts from 3 and goes till end of string. ans = ''
SELECT SUBSTR(title, 1, 10)
AS small_title
from books;

-- Starts from 3 and goes till end of string. ans = 'ppa'
SELECT SUBSTRING('Rappa', -3,3)
AS COL;

-- REPLACE (Does NOT modify rows - just for display)
SELECT REPLACE(title, 'e ', '3')
FROM books;

SELECT REPLACE('Super Star', ' ', '-');