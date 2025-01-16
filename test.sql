CREATE DATABASE shirts_db;

USE practice_db;

SELECT database();

CREATE TABLE shirts (
	shirt_id int AUTO_INCREMENT PRIMARY KEY,
    article varchar(20) NOT NULL,
    color varchar(15) NOT NULL,
    shirt_size varchar(6) NOT NULL,
    last_worn int NOT NULL
    );

SELECT * FROM books;

SELECT SUBSTRING('Rappa', 1,3)
AS COL;

SELECT CONCAT(SUBSTR(title, 1, 10), '...')
AS short_title
FROM books;

