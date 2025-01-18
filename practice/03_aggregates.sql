-- Find the details of books that have maximum number of pages
SELECT title, pages
from books
where pages = (
		select MAX(pages)
		from books);

-- Find the details books that were first released 
SELECT *
FROM books
WHERE released_year = (
			SELECT min(released_year)
            FROM books);

-- Find the author name, books written, first and last books published by each author and max pages among their books
SELECT 
	CONCAT(author_fname, ' ', author_lname) AS author,
  COUNT(*) AS books_written,
  MIN(released_year) AS earliest_release,
  MAX(released_year) AS latest_release,
  MAX(pages) AS max_pages
FROM books
GROUP BY author;

-- Find the longest page count for each author
SELECT
	CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) as longest_page_count
FROM
	books
GROUP BY
	author;
    
-- (or)

SELECT
    MAX(pages) as longest_page_count
FROM
	books
GROUP BY
	CONCAT(author_fname, ' ', author_lname);

-- Find the total number of pages of books written by each author
SELECT
	CONCAT(author_fname, ' ', author_lname) AS author,
  SUM(pages)
FROM books
GROUP BY author;

-- Print how many books were released each year
SELECT
	count(*)
FROM books
GROUP BY released_year;

-- Print number of books in stock
SELECT 
	sum(stock_quantity)
FROM
	books;

-- Find avg released_year for each author
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    AVG(released_year)
FROM books
GROUP BY author;

-- Author who wrote longest book
SELECT
	CONCAT(author_fname, ' ', author_lname) AS author_of_longest_book
FROM books
WHERE pages = (
		SELECT MAX(pages)
		FROM books);

-- Query to show release year, book count, and average pages per year in ascending order of year
SELECT
	released_year AS year,
    COUNT(*) AS books,
    AVG(pages) AS 'avg pages'
FROM books
GROUP BY year
ORDER BY year;
