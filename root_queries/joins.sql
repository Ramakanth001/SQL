CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
-- To perform a (kind of useless) cross join. Cartesian Join = Cross Join
SELECT * FROM
customers, orders;
-- (or)
SELECT * 
FROM TableA
CROSS JOIN TableB;

-- Subquery
select *
from orders
where customer_id = (
		select id
        from customers
        where first_name = 'boy');

-- same using joins        
SELECT *
FROM customers
JOIN orders
ON  customers.id = orders.customer_id
WHERE first_name = 'boy';

-- Find total amount spent by 'boy' using subquery
select SUM(amount)
from orders
where customer_id = (
		select id
        from customers
        where first_name = 'boy');

-- Find total amount spent by each customer in ascending order
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, SUM(amount)
AS money_spent
FROM customers
JOIN orders
ON orders.customer_id = customers.id
GROUP BY customer_name
ORDER BY money_spent;

-- Left joins
SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
ON orders.customer_id = customers.id;
 
SELECT order_date, amount, first_name, last_name
FROM orders
LEFT JOIN customers 
ON orders.customer_id = customers.id;
    
SELECT first_name, last_name, ifnull(amount, 0)
FROM customers
LEFT JOIN orders
ON orders.customer_id = customers.id;

-- Rigt join
SELECT first_name, last_name, order_date, amount
FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;