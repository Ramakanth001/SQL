-- Get current date and time
select sysdate() from dual;

-- Get a list of Databases
show databases;

-- Add 2 numbers
select 3+4;

-- Dummy Insert (NULL values for all columns in a Record will be inserted)
INSERT INTO PEOPLE() VALUES ();

-- Quotes in values
INSERT INTO db (name, quantity) 
VALUES 
	('siri\s', 21), -- single quote
	('ravi"s"', 22); -- double quote
    
-- Usage NOT NULL and DEFAULT
CREATE TABLE orders  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);
INSERT INTO People2 (first_name, last_name, age)
VALUES
    ('NULL', 'serin', 22);
-- (While inserting a row, if no value is provided for name or age, the default values would be inserted but this is not redundant because even though the insert can never be null since you have default, it is possible that you can insert a NULL value manually)

-- Writing NOT NULL constraint for a priamry key is reduntant

-- If you add an out of order column value to an AUTO-INCREMENT enabled row, next auto increment will happen from there. For example if the current sequence of cat_id is 20 and if you manually insert a row with cat_id 25, next insertions will happen from 26 not 21

