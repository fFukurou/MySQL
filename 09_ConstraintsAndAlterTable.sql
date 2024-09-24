USE test_db;

-- ------------------------------ UNIQUE CONSTRAINT ------------------------------ 
-- PRIMARY KEYS ARE ALWAYS UNIQUE

CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE

);
DROP TABLE partiers;
CREATE TABLE partiers(
	name VARCHAR(50),
    age INT,
    CONSTRAINT age_above_18 CHECK (age >= 18)
);
INSERT INTO partiers VALUES ('Colt Steele', 17); -- WILL SAY THAT THE CONSTRAINT CHECK IS VIOLATED
DESC PARTIERS;

-- ------------------------------ NAMING CONSTRAINTS ------------------------------ 
-- ------------------------------ CHECK CONSTRAINT ------------------------------ 


DROP TABLE palindromes;	
CREATE TABLE palindromes (
	word VARCHAR(255),
    CONSTRAINT word_is_palindrome CHECK(REVERSE(WORD) = WORD)
);
DESC palindromes;
INSERT INTO palindromes VALUES ('racecar');


CREATE TABLE companies (
	name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address_unique UNIQUE (name, address)
);

CREATE TABLE houses (
	purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sale_bigger_purchase CHECK(sale_price > purchase_price)
);

INSERT INTO HOUSES VALUES (100, 2000);
INSERT INTO HOUSES VALUES (100, 89);

-- ------------------------------ ADDING AND DROPPING COLUMNS ------------------------------ 
-- ADDING COLUMNS TO A TABLE WITH VALUES WITH 
ALTER TABLE companies ADD COLUMN city VARCHAR(50);
ALTER TABLE companies DROP COLUMN employee_count;
ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL DEFAULT 1;
select * from companies;

-- ------------------------------ RENAMING TABLES ------------------------------ 

RENAME TABLE companies TO suppliers;
RENAME TABLE suppliers TO companies;

-- ------------------------------ RENAMING COLUMNS ------------------------------ 

ALTER TABLE companies RENAME COLUMN name TO company_name;
DESC COMPANIES;

-- ------------------------------ MODIFYING COLUMNS ------------------------------ 

ALTER TABLE COMPANIES MODIFY company_name VARCHAR(250) DEFAULT 'unkown';
-- ALTER TABLE COMPANIES CHANGE company_name c_name VARCHAR(250) DEFAULT 'unkown';

-- ------------------------------ ADDING AND DROPPING CONSTRAINTS AFTER CREATION ------------------------------ 

ALTER TABLE companies ADD CONSTRAINT a_lot_of_workers CHECK (employee_count < 2000);
INSERT INTO companies VALUES ('BRUH', 'BRUBHURHU', 'BRUHCITY', 2300);

ALTER TABLE companies DROP CONSTRAINT a_lot_of_workers;

