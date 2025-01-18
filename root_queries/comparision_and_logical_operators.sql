-- 1. Retrieve all books where the release year is not 2017.
SELECT *
FROM books
WHERE released_year != 2017;

-- 2. Retrieve all books where the title does not contain the word 'ram'.
SELECT *
FROM books
WHERE title NOT LIKE '%ram%';

-- 3. Retrieve all books where the release year is greater than 2005.
SELECT * FROM books
WHERE released_year > 2005;

-- 4. Retrieve all books where the release year is less than or equal to 1985.
SELECT * FROM books
WHERE released_year <= 1985;

-- 5. Retrieve all books that were released between 2004 and 2014 (inclusive).
select *
from books
where released_year >=2004
and released_year <=2014;

-- 6. Retrieve all books released between 2004 and 2014 (inclusive) using the BETWEEN operator.
select *
from books
where released_year BETWEEN 2004 AND 2014;

-- 7. Retrieve titles, author last names, and release years of books where the release year is greater than 2010,
-- and the author's last name is 'Eggers', and the title contains the word 'novel'.
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';

-- 8. Retrieve titles and page counts of books where the page count is less than 200 or the title contains the word 'stories'.
SELECT title, pages FROM books
WHERE pages < 200 OR title LIKE '%stories%';

-- 9. Retrieve all people whose birth time is between 12:00:00 and 16:00:00.
SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);

-- 10. Retrieve titles and author last names of books where the author's last name is not 'Carver', 'Lahiri', or 'Smith'.
SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

-- 11. Retrieve all people whose birth hour is between 12 and 16.
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;

-- 12. Retrieve all books where the release year is an even number.
SELECT * FROM books
WHERE released_year % 2 = 0;

-- 13. Retrieve titles and stock quantities of books, and assign a rating based on stock quantity: '*' for less than 50, '**' for between 51 and 100, and '***' for more than 100.
SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity < 50  THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
	END as rating
FROM books;

-- or

SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity <= 50  THEN '*'
        WHEN stock_quantity <= 100  THEN '**'
        ELSE '***'
	END as rating
FROM books;
