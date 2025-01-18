select *
from books
where released_year >=2004
and released_year <=2014;

select *
from books
where released_year BETWEEN 2004 AND 2014;


SELECT FLOOR(released_year / 2)
FROM books;

SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity < 50  THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
	END as rating
from books;

SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity <= 50  THEN '*'
        WHEN stock_quantity <= 100  THEN '**'
        ELSE '***'
	END as rating
from books;
        


