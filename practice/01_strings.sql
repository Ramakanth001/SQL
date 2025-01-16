SELECT UPPER(REVERSE("Why does my cat look at me with such hatred?"))
AS Upper;

SELECT REPLACE(title, ' ', '->')
AS title
FROM books;

SELECT author_lname AS forwards,
REVERSE(author_lname) AS backwards
FROM books;

SELECT UPPER(CONCAT(author_lname, ' ', author_fname))
AS 'full name in caps'
FROM books;

SELECT CONCAT(title,' was released in ', released_year)
AS blurb
FROM books;

SELECT title, char_length(title) as 'character count'
from books;

SELECT 
	CONCAT(SUBSTR(title, 1, 10), '...') 
		AS 'Short Title',
	CONCAT(author_lname, ',', author_fname)
		AS author,
	CONCAT(stock_quantity, ' in stock')
		AS quantity
FROM books;