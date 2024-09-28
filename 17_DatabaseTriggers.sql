CREATE DATABASE trigger_demo;
USE trigger_demo;

-- ----------------------------- TRIGGERS ---------------------------
-- trigger_time: BEFORE, AFTER
-- trigger_event: INSERT, UPDATE, DELETE
-- ON table_name

CREATE TABLE users (
	username VARCHAR(100),
	age INT
);


-- USER MUST BE ADULT TO BE ADDED TO DATABASE
DELIMITER $$
CREATE TRIGGER must_be_adult
	BEFORE INSERT ON users FOR EACH ROW
    BEGIN
		IF NEW.age < 18
		THEN	
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Must be an adult!';
		END IF;
	END;
$$ 
DELIMITER ;

INSERT INTO users (username, age) VALUES ("Bob", 16);


USE test_instagram_db;
SHOW TABLES;

-- USER CAN NOT FOLLOW ITSELF
DELIMITER $$
CREATE TRIGGER prevent_self_follows
	BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
		IF NEW.follower_id = NEW.followee_id
		THEN	
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Can\'t follow yourself!';
		END IF;
	END;
$$ 
DELIMITER ;

INSERT INTO follows (follower_id, followee_id) VALUES (3, 3);

-- TRIGGER WHEN SOMEONE UNFOLLOWS

CREATE TABLE unfollows (
	created_at TIMESTAMP DEFAULT NOW(),
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    PRIMARY KEY (follower_id, followee_id),
    FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followee_id) REFERENCES users(id) ON DELETE CASCADE
); 

DELIMITER $$
CREATE TRIGGER capture_unfollow
	AFTER DELETE ON follows FOR EACH ROW
    BEGIN
		-- INSERT INTO unfollows(follower_id, followee_id) VALUES (OLD.follower_id, OLD.followee_id);
        INSERT INTO unfollows
        SET follower_id = OLD.follower_id,
			followee_id = OLD.followee_id;
	END;
$$ 
DELIMITER ;

SELECT * FROM unfollows;
SELECT * FROM follows;
DELETE FROM follows WHERE follower_id = 13 and followee_id = 2;

-- ----------------------------- MANAGING TRIGGERS ---------------------------

SHOW TRIGGERS;
-- DROP TRIGGER trigger_name;

-- TRIGGERS CAN MAKE DEBUGGING HARD

