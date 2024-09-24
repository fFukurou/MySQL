USE book_shop;

-- -------------------------------- NOT EQUAL != -------------------------------- 

SELECT * FROM BOOKS;
SELECT * FROM BOOKS WHERE RELEASED_YEAR != 2017;

-- -------------------------------- NOT LIKE -------------------------------- 

SELECT TITLE FROM BOOKS WHERE TITLE NOT LIKE '% %';
SELECT TITLE, AUTHOR_FNAME, AUTHOR_LNAME FROM BOOKS WHERE AUTHOR_FNAME NOT LIKE 'da%';
SELECT TITLE FROM BOOKS WHERE TITLE NOT LIKE '%a%';

-- -------------------------------- GREATER THAN -------------------------------- 

SELECT * FROM BOOKS WHERE RELEASED_YEAR > 2005;
SELECT 80 > 40; -- TRUE
SELECT 80 > 100; -- FALSE
SELECT 1 > NULL;

-- -------------------------------- GREATER THAN -------------------------------- 
