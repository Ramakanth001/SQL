-- Question: How do you create a table to store information about items, including their name, price, and quantity?
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);
 
-- Question: How do you retrieve the current time (hours, minutes, seconds) in MySQL?
SELECT CURTIME();
 
-- Question: How do you retrieve the current date in MySQL?
SELECT CURDATE();
 
-- Question: How do you find the weekday (as a number) for the current date or timestamp in MySQL?
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());

-- Question: How do you determine the day of the week (1 for Sunday, 2 for Monday, etc.) from the current timestamp in MySQL?
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
-- Question: How do you find the full name of the current day (e.g., Monday) in MySQL?
SELECT DAYNAME(NOW());

-- Question: How can you retrieve the full weekday name of the current date using DATE_FORMAT in MySQL?
SELECT DATE_FORMAT(NOW(), '%W');
 
-- Question: How do you format the current date as MM/DD/YYYY in MySQL?
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
-- Question: How do you format the current timestamp to display the month, day (ordinal), and time (e.g., January 1st at 12:00) in MySQL?
SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');
 
-- Question: How do you create a table to store tweets with columns for content, username, and an automatic timestamp for when the tweet is created?
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
-- Question: How do you insert a new tweet with specific content and username into the tweets table?
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');

-- Question: How do you retrieve all tweets, including their content, username, and creation time, from the tweets table?
SELECT * FROM tweets;
 
-- Question: How do you insert another tweet into the tweets table?
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');

-- Question: How do you view the updated list of tweets after inserting a new one?
SELECT * FROM tweets;
