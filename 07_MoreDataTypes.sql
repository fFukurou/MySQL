-- CHAR(0-255) has a fixed length, even if you don't fill it the length, the memory will be used
CREATE DATABASE test_db;
USE test_db;

-- https://dev.mysql.com/doc/refman/8.0/en/integer-types.html
-- TINYINT(-128 - 127), SMALLINT, MEDIUMINT, INT, BIGINT
-- UNSIGNED MEANS NO NEGATIVE VALUES ALLOWED, SO POSITIVE VALUES ARE DOUBLED

-- DECIMAL(5,2) FIVE TOTAL DIGITS, 2 COMES AFTER THE DECIMAL POINT
ALTER TABLE TEST1 ADD COLUMN price DECIMAL(8,2); -- CAN ONLY HAVE A MAXIMUM OF 6 NUMBERS BEFORE THE DECIMAL
INSERT INTO TEST1 (PRICE) VALUES(567.99);

-- FLOAT & DOUBLE (TAKES LESS SPACE THAN DECIMAL, BUT IS LESS PRECISE)
ALTER TABLE TEST1 ADD COLUMN PRICE_DOUBLE FLOAT; -- FLOAT HAS 7 DIGITS PRECISION, DOUBLE HAS 15
INSERT INTO TEST1 (PRICE_DOUBLE) VALUES (1.12345678); -- ONLY STORES UP TO THE NUMBER 6

-- DATE AND TIME
ALTER TABLE TEST1 ADD COLUMN BIRTHDAY DATE; -- DATE: VALUES WITH DATE BUT WITH NO TIME
ALTER TABLE TEST1 ADD COLUMN DURATION TIME; -- TIME: VALUES WITH TIME BUT WITH NO DATE
ALTER TABLE TEST1 ADD COLUMN EVENTS DATETIME; -- DATETIME: VALUES WITH BOTH DATE AND VALUE
INSERT INTO TEST1 (BIRTHDAY) VALUES ('2004-01-20');
INSERT INTO TEST1 (DURATION) VALUES ('20:58:32'); 
INSERT INTO TEST1 (EVENTS) VALUES ('2024-07-12 21:21'); 
SELECT * FROM TEST1;

-- CURDATE, CURTIME, NOW
SELECT CURTIME();
SELECT NOW(), CURDATE();
INSERT INTO TEST1 (BIRTHDAY, DURATION, EVENTS) VALUES (CURDATE(), CURTIME(), NOW());

-- DATE FUNCTIONS
SELECT BIRTHDAY FROM TEST1;
SELECT BIRTHDAY, DAY(BIRTHDAY), DAYOFWEEK(BIRTHDAY), DAYOFYEAR(BIRTHDAY), MONTHNAME(BIRTHDAY) FROM TEST1;
SELECT EVENTS, DAY(EVENTS), DAYOFWEEK(EVENTS), DAYOFYEAR(EVENTS), MONTHNAME(EVENTS) FROM TEST1;

-- TIME FUNCTIONS
SELECT DURATION FROM TEST1;
SELECT DURATION, HOUR(DURATION), MINUTE(DURATION), SECOND(DURATION) FROM TEST1;
SELECT EVENTS, HOUR(EVENTS), MINUTE(EVENTS), SECOND(EVENTS) FROM TEST1;
SELECT EVENTS, DATE(EVENTS), TIME(EVENTS) FROM TEST1;

-- FORMATTING DATES
-- %a	Abbreviated weekday name (Sun..Sat)
-- %b	Abbreviated month name (Jan..Dec)
-- %c	Month, numeric (0..12)
-- %D	Day of the month with English suffix (0th, 1st, 2nd, 3rd, …)
-- %d	Day of the month, numeric (00..31)
-- %e	Day of the month, numeric (0..31)
-- %f	Microseconds (000000..999999)
-- %H	Hour (00..23)
-- %h	Hour (01..12)
-- %I	Hour (01..12)
-- %i	Minutes, numeric (00..59)
-- %j	Day of year (001..366)
-- %k	Hour (0..23)
-- %l	Hour (1..12)
-- %M	Month name (January..December)
-- %m	Month, numeric (00..12)
-- %p	AM or PM
-- %r	Time, 12-hour (hh:mm:ss followed by AM or PM)
-- %S	Seconds (00..59)
-- %s	Seconds (00..59)
-- %T	Time, 24-hour (hh:mm:ss)
-- %U	Week (00..53), where Sunday is the first day of the week; WEEK() mode 0
-- %u	Week (00..53), where Monday is the first day of the week; WEEK() mode 1
-- %V	Week (01..53), where Sunday is the first day of the week; WEEK() mode 2; used with %X
-- %v	Week (01..53), where Monday is the first day of the week; WEEK() mode 3; used with %x
-- %W	Weekday name (Sunday..Saturday)
-- %w	Day of the week (0=Sunday..6=Saturday)
-- %X	Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V
-- %x	Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v
-- %Y	Year, numeric, four digits
-- %y	Year, numeric (two digits)
-- %%	A literal % character
-- %x	x, for any “x” not listed above

SELECT BIRTHDAY, DATE_FORMAT(BIRTHDAY, '%a %b %D') FROM TEST1;
SELECT EVENTS, DATE_FORMAT(EVENTS, '%H %i -- %r') FROM TEST1;

-- DATE MATH FUNCTIONS

SELECT BIRTHDAY, DATEDIFF(CURDATE(), BIRTHDAY) FROM TEST1; 

-- DATE_ADD & DATE_SUB
SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
SELECT DATE_SUB(CURDATE(), INTERVAL '1 1:1:1' DAY_SECOND);
SELECT DATE_ADD(BIRTHDAY, INTERVAL 18 YEAR) FROM TEST1;

-- TIME DIFF
SELECT TIMEDIFF(CURTIME(), '6:35:00');

SELECT NOW() - INTERVAL 18 YEAR;
SELECT BIRTHDAY, YEAR(BIRTHDAY + INTERVAL 18 YEAR) AS can_drink FROM TEST1;

-- TIMESTAMPS
-- INTERCHANGEABLE WITH DATETIME
ALTER TABLE TEST1 ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE TEST1 ADD COLUMN updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
INSERT INTO TEST1 (EVENTS) VALUES('2025-12-23 17:30:00');
UPDATE TEST1 SET DURATION='21:03:59' WHERE DURATION='21:03:32';
SELECT * FROM TEST1;

--  ----------------------------------------- EXERCISES -----------------------------------------
-- WHAT IS A GOOD USE CASE FOR CHAR()?
-- R: when you know exactly how many characters the column is gonna take ex.: codes, cpf...alter

-- FILL IN THE BLANKS
CREATE TABLE inventory (
	item_name VARCHAR(100),
    -- price DECIMAL(8,2),
    price DOUBLE,
    quantity INT
);

-- WHAT'S THE DIFFERENCE BETWEEN DATETIME AND TIMESTAMP?
-- R: datetime is for any set date, while timestamp is more used to get well... a timestamp, like an update for something (metadata)
-- datetime also takes more space

-- PRINT OUT THE CURRENT TIME
SELECT CURTIME();
-- PRINT OUT THE CURRENT DATE
SELECT CURDATE();

-- PRINT OUT THE CURRENT DAY OF THE WEEK AS A NUMBER, AND AS A STRING
SELECT CURDATE(), DAYOFWEEK(CURDATE()), DATE_FORMAT(CURDATE(), '%W'); -- DAYNAME(CURDATE())
SELECT DAYNAME(CURDATE());
-- PRINT OUT THE CURRENT DATE FORMATTED IN mm/dd/yyyy
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
-- PRINT OUT THE CURRENT DATE FORMATTED IN eg.: January 2nd at 3:15
SELECT DATE_FORMAT(NOW(), '%M %D at %H:%i');

-- CREATE A tweets TABLE
CREATE TABLE tweets (
	content VARCHAR(180),
    username VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tweets (content, username) VALUES ('Roses are red, violets are blue, I want to f****** die', 'fFukurou');
SELECT * FROM tweets;