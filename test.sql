CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

INSERT INTO unique_cats (cat_id, name, age)
VALUES
    ('', 'jes', 8);

select *
from unique_cats;

CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

CREATE TABLE employees (
	id int PRIMARY KEY,
    last_name varchar(30) NOT NULL,
    first_name varchar(30) NOT NULL,
    middle_name varchar(30),
    age int NOT NULL,
    current_status varchar(30) NOT NULL DEFAULT 'employed'
    );

ALTER TABLE employees 
ADD PRIMARY KEY (id);

ALTER TABLE employees 
MODIFY id INT AUTO_INCREMENT;


select *
from unique_cats3;

DESC employees;
