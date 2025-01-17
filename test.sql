SELECT *
FROM books;

SELECT  DISTINCT(concat(author_fname, ' ', author_lname)) as Author
FROM books
ORDER BY Author
LIMIT 5;

SELECT title FROM books LIMIT 3;

SELECT COUNT(*)
FROM books
WHERE title like '%the%';

select count(*), released_year
from books
group by released_year;

SELECT min(released_year)
from books;

SELECT 
    title
FROM
    books
ORDER BY pages DESC
LIMIT 1;

-- Find the details books that have maximum number of pages
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
            
SELECT  CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*)
from books
group by author;

select  author_fname, author_lname, MIN(released_year)
from books
group by author_fname, author_Lname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;


SELECT CONCAT(author_fname, ' ', author_lname) AS author, MIN(released_year)
FROM books
GROUP BY CONCAT(author_fname, ' ', author_lname);

SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*)
FROM books
GROUP BY author;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, MIN(released_year)
FROM books
GROUP BY author;

