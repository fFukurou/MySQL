DROP TABLE cats;

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
-- SELECT 
SELECT * FROM cats;
SELECT name FROM cats;
SELECT name, age FROM cats;

-- WHERE 
SELECT * FROM cats WHERE age < 10;
SELECT name, age FROM cats WHERE age < 10;
SELECT * FROM cats WHERE name='Egg';

-- EXERCISE 1
SELECT cat_id AS id, age FROM cats WHERE cat_id=age;

-- UPDATE
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
UPDATE cats SET breed='Tabby' WHERE breed='Shorthair';
SELECT * FROM cats;

-- EXERCISE 2
UPDATE cats SET name='Jack' WHERE name='Jackson';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
SELECT * FROM cats;

-- DELETE
DELETE FROM cats WHERE name='Egg';
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE age=cat_id;
DELETE FROM cats WHERE age=4;
SELECT * FROM CATS;
DELETE FROM cats;
