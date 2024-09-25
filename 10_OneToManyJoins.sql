CREATE DATABASE shop;
USE shop;

DROP TABLE CUSTOMERS;
CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

-- ------------------------------------ FOREIGN KEY ---------------------------------

DROP TABLE orders;
CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT, FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES('Boy', 	'George',	'george@gmail.com'),
		('George', 	'Michael',	'gm@gmail.com'),
        ('David', 'Bowie', 'david@gmail.com'),
		('Blue', 	'Steele',	'blue@gmail.com'),
		('Bette', 	'Davis',	'bette@aol.com');
        
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
('2017-11-11', 35.50, 1),
('2014-12-12', 800.67, 2),
('2015-01-03', 12.50, 2),
('1999-04-11', 450.25, 5);

SELECT * FROM customers;
SELECT * FROM orders;

-- ------------------------------------ CROSS JOINS (bruh) ---------------------------------

SELECT * FROM customers, orders;

-- ------------------------------------ INNER JOINS (OVERLAP BETWEEN A AND B) ---------------------------------

SELECT first_name, last_name, order_date, amount FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;

SELECT first_name, last_name, SUM(amount) AS total FROM customers
INNER JOIN orders ON customers.id = orders.customer_id GROUP BY first_name, last_name ORDER BY total;

-- ------------------------------------ LEFT JOINS (EVERYTHING IN A, AND MATCHING RECORDS IN B) ---------------------------------

SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

-- ------------------------------------ RIGHT JOINS (EVERYTHING IN B, AND MATCHING RECORDS IN A) ---------------------------------
