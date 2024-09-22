CREATE DATABASE shirts_db;
SHOW DATABASES;
USE shirts_db;


CREATE TABLE shirts (
	shirt_id INT PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(25) NOT NULL,
    color VARCHAR(25) NOT NULL,
    shirt_size CHAR NOT NULL,
    last_worn INT NOT NULL
);

DESC shirts;

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

SELECT * FROM SHIRTS;

INSERT INTO shirts (color, article, shirt_size, last_worn)
VALUES ('purple', 'polo shirt', 'M', 50);

SELECT article, color FROM shirts;
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
UPDATE shirts SET LAST_WORN=0 WHERE LAST_WORN=15;
-- I FUCKED IT UP BRUUUH
ALTER TABLE SHIRTS MODIFY SHIRT_SIZE VARCHAR(5);
UPDATE SHIRTS SET SHIRT_SIZE='XS', COLOR='off white' WHERE COLOR='white';

DELETE FROM SHIRTS WHERE LAST_WORN >=200;
DELETE FROM SHIRTS WHERE ARTICLE='tank top';
DELETE FROM SHIRTS;
DROP TABLE SHIRTS;