-- COUNT
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

-- ORDER BY
SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;
 
SELECT author_lname, COUNT(*) AS books_written
FROM books
GROUP BY author_lname
ORDER BY books_written DESC;

-- MIN
SELECT MAX(pages) FROM books;

-- MAX
SELECT MIN(author_lname) FROM books;
            
-- GROUP BY multiple columns
SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*)
FROM books
GROUP BY author;

-- SUM 
SELECT SUM(pages) FROM books;

SELECT
	CONCAT(author_fname, ' ', author_lname) AS author,
    SUM(pages)
FROM books
GROUP BY author;

-- AVG
SELECT AVG(released_year)
FROM books;

SELECT released_year, AVG(stock_quantity), count(*)
FROM books
GROUP BY released_year;

-- ROUND to precision 
select title, ROUND(AVG(rating), 2) as AVG_Rating
from reviews
GROUP BY title;