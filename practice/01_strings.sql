-- Convert the string to uppercase and reverse it; "Why does my cat look at me with such hatred?" becomes reversed and uppercased
SELECT UPPER(REVERSE("Why does my cat look at me with such hatred?"))
AS Upper;

-- Replace all spaces in the `title` column from the `books` table with '->' characters
SELECT REPLACE(title, ' ', '->')
AS title
FROM books;

-- Retrieve the last name of authors (`author_lname`) from the `books` table, display it normally and in reverse
SELECT author_lname AS forwards,
REVERSE(author_lname) AS backwards
FROM books;

-- Concatenate the author's last and first name from the `books` table, convert to uppercase, and display as full name
SELECT UPPER(CONCAT(author_lname, ' ', author_fname))
AS 'full name in caps'
FROM books;

-- Concatenate the `title` and `released_year` columns to form a sentence for each book in the `books` table
SELECT CONCAT(title, ' was released in ', released_year)
AS blurb
FROM books;

-- Display the `title` and calculate the character count for each title using the `CHAR_LENGTH` function
SELECT title, CHAR_LENGTH(title) AS 'character count'
FROM books;

-- Generate a summary for each book, including:
-- 1. A shortened version of the `title` (first 10 characters followed by '...')
-- 2. Author's name in the format "Last Name, First Name"
-- 3. Stock quantity with the phrase "in stock"
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') 
        AS 'Short Title',
    CONCAT(author_lname, ',', author_fname)
        AS author,
    CONCAT(stock_quantity, ' in stock')
        AS quantity
FROM books;
