CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);

-- If you want to delte a customer or drop the customer table, it won't allow you since there are references to customers in the orders table (foreign key). We can handle this in multiple ways. We can either make such customers name as NULL/deleted_user or we can setup cascade delete so that all the references(rows) in child tables are also deleted 

-- The ON DELETE CASCADE clause in the FOREIGN KEY constraint ensures that when a row in the referenced table (in this case, customers) is deleted, all related rows in the child table (in this case, orders) are automatically deleted. 

-- Use with caution, as it can lead to cascading deletions of large amounts of data if not handled carefully. It's especially useful in scenarios where the child table's data is meaningless without the parent table's data.