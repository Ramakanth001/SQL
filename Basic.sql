-- Creating a new DB
CREATE DATABASE database_name;

-- Delete a DB
DROP DATABASE database_name;

-- select a DB to work
USE Datta_DB;

-- select current db
select DATABASE();

-- Create a Table
CREATE TABLE TABLE_NAME (
column_name_1 data_type,
column_name_2 data_type,
.............);
-- Example
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

-- To drop a table:
DROP TABLE table-name;

