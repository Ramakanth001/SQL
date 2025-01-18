-- Create a table with columns for storing name, date of birth, time of birth, and a combined datetime value
CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

-- Insert a record for Elton by assigning specific values to name, birthdate, birthtime, and birthdt
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

-- Insert a record for Lulu with values assigned to name, birthdate, birthtime, and birthdt
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');

-- Insert a record for Juan with specific values for name, birthdate, birthtime, and birthdt
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- Use CURTIME() to retrieve the server's current time based on the system clock
SELECT CURTIME();

-- Use CURDATE() to retrieve the server's current date based on the system clock
SELECT CURDATE();

-- Use NOW() to retrieve the server's current date and time as a single DATETIME value
SELECT NOW();

-- Insert a record for Hazel, dynamically assigning the current date and time using CURDATE(), CURTIME(), and NOW()
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

-- Extract detailed date attributes from the birthdate column (e.g., day of the month, day of the week, etc.)
SELECT 
    birthdate,                        -- Original birthdate value
    DAY(birthdate),                   -- Extracts the day of the month (1-31)
    DAYOFWEEK(birthdate),             -- Extracts the day of the week (1=Sunday, 7=Saturday)
    DAYOFYEAR(birthdate),             -- Extracts the day of the year (1-366)
    MONTHNAME(birthdate),             -- Retrieves the name of the month
    YEAR(birthdate)                   -- Extracts the year part of the date
FROM people;

-- Extract time-specific details from the birthtime column (e.g., hour and minute values)
SELECT 
    birthtime,                        -- Original birthtime value
    HOUR(birthtime),                  -- Extracts the hour (0-23)
    MINUTE(birthtime)                 -- Extracts the minute (0-59)
FROM people;

-- Extract both date and time components from the birthdt column
SELECT 
    birthdt,                          -- Original birthdt value
    MONTH(birthdt),                   -- Extracts the month (1-12)
    DAY(birthdt),                     -- Extracts the day of the month (1-31)
    HOUR(birthdt),                    -- Extracts the hour (0-23)
    MINUTE(birthdt)                   -- Extracts the minute (0-59)
FROM people;

-- Format the birthdate column to display the date as abbreviated weekday, month, and day with suffix
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;

-- Format the birthdt column to display only the hour and minute in HH:MM format
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;

-- Format the birthdt column to include a custom label and display time in 12-hour format with AM/PM
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- Calculate the difference in days between the current date and each person's birthdate
SELECT birthdate, DATEDIFF(CURDATE(), birthdate) FROM people;

-- Add one month to the current date using DATE_ADD with INTERVAL 1 MONTH
SELECT DATE_ADD(curdate(), INTERVAL 1 MONTH);

-- Add one year to the current date using DATE_ADD with INTERVAL 1 YEAR
SELECT DATE_ADD(curdate(), INTERVAL 1 YEAR);

-- Calculate when each person will turn 21 by adding 21 years to their birthdate using DATE_ADD
SELECT name, DATE_ADD(birthdate, INTERVAL 21 YEAR)
AS will_be_21_yo
FROM people;

-- Alternative way to calculate when each person will turn 21 by adding 21 years directly to birthdate
SELECT name, birthdate + INTERVAL 21 year
AS will_be_21_yo
FROM people;

-- Create a table for captions with a text field and a created_at column that defaults to the current timestamp
CREATE TABLE captions (
  text VARCHAR(150),
  created_at DATETIME default CURRENT_TIMESTAMP
);

-- Create a table for captions with a text field, a created_at column, and an updated_at column that updates on modification
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at DATETIME default CURRENT_TIMESTAMP,
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

SELECT VERSION();
