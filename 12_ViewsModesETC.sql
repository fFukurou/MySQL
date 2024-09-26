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