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

-- String manipulation using insert
-- INSERT(str,pos,len,newstr) 
SELECT INSERT('Quadratic', 3, 4, 'What');
Ans -> 'QuWhattic';
(3rd letter is 'a' 4th letter from this letter is 'a' So the string 'adra' is replaced by 'What')

SELECT INSERT('Quadratic', 3, 2, 'Where');
Ans -> 'QuWhrereratic';
(3rd letter is 'a' 2nd letter from this letter is 'd' So the string 'ad' is replaced by 'Where')

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

-- Add 2 numbers
select 3+4;

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