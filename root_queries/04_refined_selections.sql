
-- DISTINCT	(Both of the below work in the same way)
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books; -- (considers combination of columns but not the first column)

-- ORDER BY
SELECT * FROM books
ORDER BY author_lname DESC;

SELECT *
FROM books
ORDER BY 2;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 2 desc;
 
SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname;

-- LIMIT
SELECT title FROM books LIMIT 3;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;

-- It is relative positioning. It gives you 5 rows from 3rd row
SELECT title, released_year 
FROM books 
ORDER BY released_year DESC 
LIMIT 3,5;

-- LIKE (% - 0 OR MORE CHARS)
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da%';

-- ('_' MEANS ONE CHARACTER)
SELECT * FROM books
WHERE author_fname LIKE '_a_'; 

-- To select books with '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%';
 
-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';