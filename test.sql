SELECT *
FROM books
ORDER BY 2;

SELECT  DISTINCT(concat(author_fname, ' ', author_lname)) as Author
FROM books
ORDER BY Author
LIMIT 5;

SELECT title FROM books LIMIT 3;
