-- Retrieve titles from the `books` table where the title contains the word "stories" anywhere
SELECT title
FROM books
WHERE title LIKE '%stories%';

-- Retrieve the title and page count of the book with the highest number of pages by sorting `pages` in descending order and limiting to the top result
SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1;

-- Concatenate the title and release year with " - " as a separator, sort by the release year in descending order, and retrieve the top 3 newest books
SELECT CONCAT_WS(' - ', title, released_year)
AS summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

-- Retrieve titles and last names of authors whose last name contains a space (indicating multiple-word last names)
SELECT title, author_lname
FROM books
WHERE author_lname LIKE '% %';

-- Retrieve the title, release year, and stock quantity of the 3 books with the lowest stock; in case of ties, sort by release year in descending order
SELECT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity, released_year DESC
LIMIT 3;

-- Retrieve titles and authors' last names, sorted first by last name and then by title in ascending order
SELECT title, author_lname
FROM books
ORDER BY author_lname, title;

-- Create an uppercase string announcing a favorite author using their first and last name, and order by last name alphabetically
SELECT UPPER(CONCAT('MY FAVORITE AUTHOR IS ', author_fname, ' ', author_lname, '!'))
AS yell
FROM books
ORDER BY author_lname;

-- Retrieve all columns and all rows from the `books` table
SELECT *
FROM books;