USE book_shop;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- OOPS INSERTED THREE TIMES DUMBO
DELETE FROM books WHERE book_id > 19;

-- ------------------------------------ DISTINCT --------------------------------------------
SELECT author_lname FROM BOOKS;
SELECT DISTINCT author_lname FROM BOOKS;
SELECT DISTINCT RELEASED_YEAR FROM BOOKS;
-- DISTINCT LAST NAMES
SELECT DISTINCT
CONCAT(author_fname, ' ', author_lname) AS 'UNIQUE AUTHORS'
FROM BOOKS;
-- EASIER WAY LMAO
SELECT DISTINCT author_fname, author_lname FROM BOOKS;

-- ------------------------------------ ORDER BY --------------------------------------------
INSERT INTO BOOKS(title, author_lname, released_year) VALUES('Akiramete Tamaruka', 'Fukurou', 2024);
SELECT book_id, author_fname, author_lname FROM BOOKS ORDER BY author_lname;
-- DESCENDING ORDER
SELECT book_id, author_fname, author_lname FROM BOOKS ORDER BY author_fname DESC;
SELECT title, pages FROM BOOKS ORDER BY pages;
SELECT title, pages FROM BOOKS ORDER BY released_year;

SELECT title, pages FROM BOOKS ORDER BY 1;
SELECT title, pages FROM BOOKS ORDER BY 2 DESC;
-- SORTING BY 2 COLUMNS, ONE AND THEN THE OTHER
SELECT author_lname, released_year, title FROM BOOKS ORDER BY AUTHOR_LNAME, RELEASED_YEAR DESC;

SELECT CONCAT(AUTHOR_FNAME, ' ', AUTHOR_LNAME) AS AUTHOR FROM BOOKS ORDER BY AUTHOR;

-- ------------------------------------ LIMIT --------------------------------------------
-- MOST RECENTLY RELEASED BOOKS
SELECT BOOK_ID, TITLE, RELEASED_YEAR FROM BOOKS ORDER BY RELEASED_YEAR DESC LIMIT 5;
SELECT BOOK_ID, TITLE, RELEASED_YEAR FROM BOOKS ORDER BY RELEASED_YEAR DESC LIMIT 3, 5; -- STARTING ROW AND HOW MANY YOU WANT TO RETRIEVE

-- ------------------------------------ LIKE --------------------------------------------
SELECT BOOK_ID, AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE AUTHOR_FNAME LIKE '%DA%';
SELECT BOOK_ID, AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE TITLE LIKE '%:%'; -- CHECKS IF : IS IN TITLE STRING
SELECT BOOK_ID, AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE AUTHOR_FNAME LIKE '____'; -- CHECKS IF AUTHOR_FNAME HAS 4 CHARACTERS
SELECT BOOK_ID, AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE AUTHOR_FNAME LIKE '_a__'; -- CHECKS IF AUTHOR_FNAME HAS THIS PATTERN

SELECT BOOK_ID, AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE AUTHOR_FNAME LIKE '%N'; -- CHECKS IF AUTHOR_FNAME ENDS WITH 'N'

SELECT BOOK_ID, AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE TITLE LIKE '%\%%'; -- DEALING WITH WILDCARDS
SELECT BOOK_ID, AUTHOR_FNAME, TITLE, RELEASED_YEAR FROM BOOKS WHERE TITLE LIKE '%\_%'; -- DEALING WITH WILDCARDS

-- ------------------------------------ EXERCISES --------------------------------------------
SELECT title FROM BOOKS WHERE TITLE LIKE '%stories%';

SELECT title, pages FROM BOOKS ORDER BY PAGES DESC LIMIT 1;  

SELECT CONCAT(title, ' - ', released_year) AS 'summary' FROM BOOKS ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM BOOKS WHERE author_lname LIKE '% %'; -- PRINT BOOKS WHERE AUTHOR LAST NAME HAS A SPACE

-- UPDATE BOOKS SET stock_quantity=1 WHERE author_lname='Fukurou';

SELECT title, released_year, stock_quantity FROM BOOKS ORDER BY stock_quantity LIMIT 3;

SELECT title, author_lname FROM BOOKS ORDER BY author_lname, title; 

SELECT UPPER(CONCAT('My favorite author is ', author_fname, ' ', author_lname, '!')) 
AS yell FROM BOOKS ORDER BY author_lname;





