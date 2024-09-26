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

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name ;

-- ------------------------------------ RIGHT JOINS (EVERYTHING IN B, AND MATCHING RECORDS IN A) ---------------------------------

INSERT INTO orders(order_date, amount) VALUES (CURDATE(), 100);
SELECT * FROM ORDERS;

SELECT first_name, last_name, order_date ,amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

-- ------------------------------------ ON DELETE CASCADE ---------------------------------

DELETE FROM customers WHERE last_name = 'George';

CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT, FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
DELETE FROM customers WHERE last_name = 'George';
DELETE FROM customers WHERE last_name = 'Michael';

-- ------------------------------------ EXERCISES ---------------------------------

USE shop;

CREATE TABLE students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
	title VARCHAR(100),
    grade FLOAT,
    student_id INT, FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

SELECT first_name, title, grade FROM STUDENTS
JOIN PAPERS ON students.id = papers.student_id ORDER BY grade DESC;

SELECT first_name, title, grade FROM STUDENTS
LEFT JOIN PAPERS ON students.id = papers.student_id;

SELECT first_name, IFNULL(title, 'MISSING') AS title, IFNULL(grade, 0) AS grade FROM STUDENTS
LEFT JOIN PAPERS ON students.id = papers.student_id;

SELECT first_name, AVG(IFNULL(grade, 0)) AS average FROM STUDENTS
LEFT JOIN PAPERS ON students.id = papers.student_id
GROUP BY first_name ORDER BY average DESC;

-- THRESHOLD FOR PASSING IS 75
SELECT first_name, AVG(IFNULL(grade, 0)) AS average, 
CASE
	WHEN IFNULL(AVG(grade), 0) < 75 THEN 'FAILING'
    ELSE 'PASSING'
END AS passing_status
FROM STUDENTS
LEFT JOIN PAPERS ON students.id = papers.student_id
GROUP BY first_name ORDER BY average DESC;

commit;