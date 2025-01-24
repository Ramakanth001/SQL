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

-- Ans = 'ppa'. Starts 3 characters from the end (ppa), and the length parameter (`4`) is irrelevant since it extracts till the end of the string.
SELECT SUBSTR('Rappa', -3, 4)
AS COL;

-- REPLACE (Does NOT modify rows - just for display)
SELECT REPLACE(title, 'e ', '3')
FROM books;

SELECT REPLACE('Super Star', ' ', '-');

-- REVERSE
SELECT REVERSE('Rose');

-- CHAR_LENGTH (Gives us number of characters)
SELECT author_lname, 
       CHAR_LENGTH(author_lname) AS 'length' 
FROM books;

-- LENGTH (Gives us bytes) (In case you are using chinese, 2 characters (char_length) can take 6 bytes(length))
SELECT author_lname, 
       LENGTH(author_lname) AS 'length' 
FROM books;

-- LOWER
SELECT LOWER('Hello World');

-- UPPER 
SELECT UPPER('Hello World');

SELECT UPPER(CONCAT('I love ', SUBSTR(title,1,25), ' !!'))
AS woo
FROM books;

-- LEFT
SELECT LEFT('omghahalol!', 3);

-- RIGHT
SELECT RIGHT('omghahalol!', 4);

-- REPEAT
SELECT REPEAT('ha', 4);

-- TRIM
SELECT TRIM('  pickle  ');

-- String manipulation using insert
-- INSERT(str,pos,len,newstr) 
SELECT INSERT('Quadratic', 3, 4, 'What');
-- Ans -> 'QuWhattic';
-- (3rd letter is 'a' 4th letter from this letter is 'a' So the string 'adra' is replaced by 'What')

SELECT INSERT('Quadratic', 3, 2, 'Where');
-- Ans -> 'QuWhrereratic';
-- (3rd letter is 'a' 2nd letter from this letter is 'd' So the string 'ad' is replaced by 'Where')
