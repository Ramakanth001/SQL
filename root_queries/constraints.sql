-- Create a table named `contacts` with two columns: `name` and `phone`. 
-- The `name` column is required and can hold up to 100 characters. 
-- The `phone` column is required, can hold up to 15 characters, and must be unique.
CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

-- Insert a record into the `contacts` table with the name "billybob" and phone "8781213455".
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

-- Create a table named `users` with two columns: `username` and `age`.
-- The `username` column is required and can hold up to 20 characters.
-- The `age` column must be a positive integer (greater than 0).
CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

-- Create a table named `palindromes` with a single column `word`.
-- The `word` column must contain a palindrome (a string that reads the same backward as forward).
CREATE TABLE palindromes (
    word VARCHAR(100) CHECK (REVERSE(word) = word)
);

-- Create a table named `users2` with two columns: `username` and `age`.
-- The `username` column is required and can hold up to 20 characters.
-- The `age` column must be non-negative (greater than or equal to 0). This constraint is named `age_not_negative`.
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

-- Create a table named `palindromes2` with a single column `word`.
-- The `word` column must contain a palindrome. This constraint is explicitly named `word_is_palindrome`.
CREATE TABLE palindromes2 (
    word VARCHAR(100),
    CONSTRAINT word_is_palindrome CHECK (REVERSE(word) = word)
);

-- Create a table named `companies` with two columns: `name` and `address`.
-- Both columns are required. A UNIQUE constraint is applied to ensure no two rows have the same `name` and `address` combination.
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);

-- Create a table named `houses` with two columns: `purchase_price` and `sale_price`.
-- Both columns are required, and the `sale_price` must be greater than or equal to the `purchase_price`.
CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sprice_gt_pprice CHECK (sale_price >= purchase_price)
);

-- Add a new column named `phone` to the `companies` table. The column can hold up to 15 characters.
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

-- Add a new column named `employee_count` to the `companies` table.
-- The column is required and has a default value of 1.
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- Remove the `phone` column from the `companies` table.
ALTER TABLE companies DROP COLUMN phone;

-- Rename the `companies` table to `suppliers`.
RENAME TABLE companies TO suppliers;

-- Rename the `suppliers` table back to `companies`.
ALTER TABLE suppliers RENAME TO companies;

-- Rename the column `name` in the `companies` table to `company_name`.
ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- Modify the `company_name` column in the `companies` table to have a maximum length of 100 characters and a default value of 'unknown'.
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

-- Rename the `business` column in the `suppliers` table to `biz_name` and change its data type to VARCHAR(50).
ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

-- Add a constraint to the `houses` table to ensure the `purchase_price` is non-negative.
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

-- Remove the `positive_pprice` constraint from the `houses` table.
ALTER TABLE houses DROP CONSTRAINT positive_pprice;

-- If amount is NULL, it will return 0
SELECT first_name, last_name, ifnull(amount, 0)
FROM customers;
