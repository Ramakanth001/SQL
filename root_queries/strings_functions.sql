-- Concat
SELECT CONCAT (author_fname, ' ', author_lname, '!!')
AS author_full_name
FROM books;

-- Concat WITH SEPERATOR 
SELECT CONCAT_WS('-',title, author_fname, author_lname) 
AS author_key
FROM books;

-- Starts from 3 and goes till end of string
SELECT SUBSTRING('Rappa', 3)
AS COL;

-- Starts from 3 and goes till end of string. ans = ''
SELECT SUBSTR(title, 1, 10)
AS small_title
from books;

-- Starts from 3 and goes till end of string. ans = 'ppa'
SELECT SUBSTR('Rappa', -3,3)
AS COL;

-- REPLACE (Does NOT modify rows - just for display)
SELECT REPLACE(title, 'e ', '3')
FROM books;

SELECT REPLACE('Super Star', ' ', '-');

