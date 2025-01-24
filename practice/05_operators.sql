-- 1. Retrieve all books where the release year is before 1980.
SELECT * FROM books WHERE released_year < 1980;

-- 2. Retrieve all books where the author's last name is either 'Eggers' or 'Chabon'.
SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';

-- 3. Retrieve all books where the author's last name is 'Lahiri' and the release year is after 2000.
SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

-- 4. Retrieve all books where the number of pages is between 100 and 200 (inclusive).
SELECT * FROM books
WHERE pages >= 100 
AND pages <= 200;

-- 5. Retrieve all books where the number of pages is between 100 and 200 using the BETWEEN operator.
SELECT * FROM books
WHERE pages BETWEEN 100 AND 200;

-- 6. Retrieve titles and author last names of books where the author's last name starts with 'C' or 'S'.
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';

-- 7. Retrieve titles and author last names of books where the first letter of the author's last name is either 'C' or 'S' (using SUBSTR).
SELECT title, author_lname
FROM books 
WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');

-- 8. Retrieve all books where the release year is between 2004 and 2014 (inclusive).
SELECT *
FROM books
WHERE released_year >= 2004
AND released_year <= 2014;

-- 9. Retrieve all books where the release year is between 2004 and 2014 using the BETWEEN operator.
SELECT *
FROM books
WHERE released_year BETWEEN 2004 AND 2014;

-- 10. Retrieve the floor value of each book's release year divided by 2.
SELECT FLOOR(released_year / 2)
FROM books;

-- 11. Assign a rating to books based on stock quantity:
-- '*' for stock less than 50, '**' for stock between 51 and 100, and '***' for stock greater than 100.
SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity < 50 THEN '*'
		WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
		ELSE '***'
	END AS rating
FROM books;

-- 12. Assign a rating to books based on stock quantity:
-- '*' for stock less than or equal to 50, '**' for stock between 51 and 100, and '***' for stock greater than 100.
SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity <= 50 THEN '*'
		WHEN stock_quantity <= 100 THEN '**'
		ELSE '***'
	END AS rating
FROM books;

-- 13. Retrieve titles, author last names, and assign a type to the books:
-- 'Short Stories' if the title contains 'stories',
-- 'Memoir' if the title is 'Just Kids' or 'A Heartbreaking Work of Staggering Genius',
-- and 'Novel' for all other books.
SELECT title, author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title = 'Just Kids' THEN 'Memoir' 
		WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
		ELSE 'Novel'
	END AS type
FROM books;

-- 14. Retrieve the first and last names of authors and the number of books they have written. 
-- Display '1 book' for one book and the count of books for others.
SELECT author_fname, author_lname,
	CASE
		WHEN COUNT(*) = 1 THEN '1 book'
		ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;