DROP DATABASE pet_shop;
CREATE DATABASE pet_shop;
USE pet_shop;
SELECT database();
show databases;

DROP TABLE cats;
CREATE TABLE cats
(
	name VARCHAR(50),
    age INT
);

DROP TABLE dogs;
CREATE TABLE dogs (
	name VARCHAR(50),
    breed VARCHAR(50),
    age INT
);

SHOW TABLES;
-- SHOW COLUMNS FROM CATS;
DESC CATS;

INSERT INTO cats values ('Frajola', 8);
SELECT * FROM cats;
