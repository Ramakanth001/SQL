select title
from books
where title like '%stories%';

select title, pages
from books
order by pages desc
limit 1;

select CONCAT_WS(' - ', title, released_year)
AS summary
FROM books
ORDER BY released_year desc
LIMIT 3;

SELECT title, author_lname
FROM books
where author_lname like '% %';

select title, released_year, stock_quantity
from books
ORDER BY stock_quantity, released_year desc
limit 3;

SELECT title, author_lname
FROM books
ORDER BY author_lname, title;

SELECT UPPER(CONCAT('MY FAVORITE AUTHOR IS ', author_fname, ' ', author_lname, '!'))
AS yell
FROM books
ORDER BY author_lname;

select *
from books;