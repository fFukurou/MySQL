USE test_tv_reviews_db;

-- --------------------------------- VIEWS ---------------------------------

CREATE VIEW full_reviews AS 
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
INNER JOIN series ON series.id = reviews.series_id
INNER JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SHOW TABLES;
SELECT genre, AVG(rating) FROM full_reviews GROUP BY genre;

-- --------------------------------- UPDATEABLE VIEWS ---------------------------------

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

INSERT INTO ordered_series (title, released_year, genre) VALUES ('The Great', 2020, 'Comedy');
SELECT * FROM ordered_series;
SELECT * FROM series;
DELETE FROM ordered_series WHERE title = 'The Great';

-- --------------------------------- REPLACING / ALTERING VIEWS ---------------------------------

CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

SELECT * FROM ordered_series;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

DROP VIEW ordered_series;

-- --------------------------------- 'HAVING' CLAUSE ---------------------------------

SELECT title AS titles_with_more_than_one_review, AVG(rating), COUNT(rating) AS review_count FROM full_reviews
GROUP BY title HAVING COUNT(rating) > 1; 

-- --------------------------------- WITH ROLLUP ---------------------------------
-- WILL ADD AN AVG (IN THIS CASE) FOR THE ENTIRE TABLE
SELECT title, AVG(rating) FROM full_reviews GROUP BY title WITH ROLLUP;

SELECT title, COUNT(rating) FROM full_reviews GROUP BY title WITH ROLLUP;

SELECT released_year, genre, AVG(rating)
FROM full_reviews
GROUP BY released_year, genre WITH ROLLUP;	

-- --------------------------------- MODES ---------------------------------

SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select 3/ 0;

-- --------------------------------- STRICT TRANS TABLES ----------------------------------
-- IF DISABLED, YOU WILL BE ABLE TO DO CATASTROPHIC STUFF SUCH AS INSERTING STRINGS INTO DECIMAL COLUMNS, ETC
-- ALSO ADDING 00-00-0000 DATES AND ETC

-- --------------------------------- MORE MODES ---------------------------------

-- ONLY_FULL_GROUP_BY: ALLOWS TO SHOW COLUMNS THAT ARE NOT AGGREGATED WITH COLUMNS THAT ARE




