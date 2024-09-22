INSERT INTO dogs VALUES ('Bidu', 'Stray', 5);
SELECT * FROM dogs;

INSERT INTO cats (name, age) VALUES ('Cleo', 8);
SELECT * FROM cats;

-- Multi Inserts

INSERT INTO cats VALUES ('ex1', 2), ('ex3', 9), ('exBruh', 10);
INSERT INTO cats VALUES ();

CREATE TABLE cats2 (
		name VARCHAR(50) NOT NULL,
        age INT
);

INSERT INTO cats2 VALUES ('bruh\'s brother', 30);    
SELECT * FROM cats2;


DROP TABLE cats3;
CREATE TABLE cats3 (
	name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);


INSERT INTO cats3 (name) VALUES ('bruh\'s brother');    
INSERT INTO cats3 VALUES (), (), ();    
-- INSERT INTO cats3 (name) VALUES (NULL);    WILL NOT WORK
DESC cats3;
SELECT * FROM cats3;

DROP TABLE CATS4;
CREATE TABLE cats4 (
	cat_id INT PRIMARY KEY AUTO_INCREMENT,
    cat_name VARCHAR(50) NOT NULL DEFAULT 'placeholder',
    cat_age INT NOT NULL DEFAULT 100);

DESC cats4;
INSERT INTO cats4 VALUES ();   
SELECT * FROM cats4;      
    
-- EXERCISE

CREATE TABLE Employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed'
);
DESC Employees;
INSERT INTO employees (first_name, last_name, age) VALUES ('Fukurou', 'Krueger', 20);

SELECT * FROM EMPLOYEES;
    