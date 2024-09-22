CREATE DATABASE book_shop;
USE BOOK_SHOP;

CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

DESC BOOKS;
SELECT * FROM BOOKS;
-- ----------------------------- CONCAT ----------------------------------------------------------------
SELECT CONCAT('b','r','u','h');
SELECT CONCAT(author_fname, ' ' ,author_lname) AS AUTHOR_NAME FROM BOOKS;
SELECT CONCAT_WS('-', author_fname ,author_lname) AS AUTHOR_NAME FROM BOOKS;

-- ----------------------------- SUBSTRING ----------------------------------------------------------------
SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING(author_lname, -1) AS initial, author_lname FROM BOOKS;

SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS SHORT_TITLE FROM BOOKS;

SELECT CONCAT( 
SUBSTRING(author_fname, 1, 1), '.' , SUBSTRING(author_lname, 1, 1), '.') AS AUTHOR_INITIALS
FROM BOOKS;

-- ----------------------------- REPLACE ----------------------------------------------------------------
SELECT REPLACE(title, ' ', '-') FROM BOOKS; 

-- ----------------------------- REVERSE ----------------------------------------------------------------
SELECT REVERSE(author_fname) as names_reversed FROM BOOKS;
SELECT REVERSE(NULL);

-- CONCAT + REVERSE
SELECT CONCAT(
	author_fname, REVERSE(author_fname)
) AS NameAndReversed 
FROM BOOKS;

-- ----------------------------- CHAR LENGTH ----------------------------------------------------------------
SELECT CHAR_LENGTH('フクロウ');
-- LENGTH RETURNS BYTES
SELECT LENGTH('フクロウ');

SELECT CHAR_LENGTH(title), title FROM BOOKS;

-- ----------------------------- UPPER AND LOWER ----------------------------------------------------------------
SELECT UPPER('hello');
SELECT UCASE('hello');

SELECT LOWER('HELLOOO');

-- FIRST NAME UPPER LAST NAME LOWER
SELECT CONCAT(
	UPPER(author_fname), ' ', LOWER(author_lname)
) AS UPPER_FIRST_lower_last FROM BOOKS;

SELECT CONCAT('I HATE ', UPPER(title), ' !!!') AS HATRED FROM BOOKS;

-- ----------------------------- INSERT ----------------------------------------------------------------
SELECT INSERT('Hello Bobby', 6, 0, ' There') AS HELLO_BOBBY;
SELECT INSERT('Hello Bobby', 6, 6, ' There') AS HELLO_THERE;

-- ----------------------------- LEFT AND RIGHT ----------------------------------------------------------------
SELECT LEFT('omghahalol!', 3);
SELECT RIGHT('omghahalol!', 4);

-- ----------------------------- REPEAT ----------------------------------------------------------------
SELECT REPEAT('HAHAHA', 4);

-- ----------------------------- TRIM ----------------------------------------------------------------
SELECT TRIM(' BOSTON     ');
SELECT TRIM(' SAN ANTONIO     ');

SELECT TRIM('...... SAN. ANTONIO     ...   ');
SELECT TRIM(LEADING '.' FROM '...... SAN. ANTONIO     ...   ');
SELECT TRIM(TRAILING '.' FROM '...... SAN. ANTONIO...');
SELECT TRIM(BOTH '.' FROM '...... SAN. ANTONIO...');

-- EXERCISES
SELECT REVERSE('Why does my cat look at me with such hatred?');

SELECT REPLACE(title, ' ', '->') AS title FROM BOOKS;

SELECT author_fname AS forwards, REVERSE(author_lname) AS backwards FROM BOOKS;

SELECT CONCAT(
	title, ' was released in ', released_year
) AS blurb FROM BOOKS;

SELECT title, CHAR_LENGTH(title) AS 'character count' FROM BOOKS;

SELECT 
	CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
	CONCAT(author_lname, ',', author_fname) AS 'author',
	CONCAT(stock_quantity, ' in stock') AS 'quantity' 
FROM BOOKS;