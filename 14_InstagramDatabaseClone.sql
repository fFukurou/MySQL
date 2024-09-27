CREATE DATABASE test_instagram_db;
USE test_instagram_db;

SHOW TABLES;

CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(photo_id) REFERENCES photos(id) ON DELETE CASCADE
);

CREATE TABLE likes (
	created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (photo_id) REFERENCES photos(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows (
	created_at TIMESTAMP DEFAULT NOW(),
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    PRIMARY KEY (follower_id, followee_id),
    FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followee_id) REFERENCES users(id) ON DELETE CASCADE
); 
DESC FOLLOWS;

CREATE TABLE tags(
	id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tagslikes (
	photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (photo_id, tag_id),
    FOREIGN KEY (photo_id) REFERENCES photos (id) ON DELETE CASCADE,
	FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- -------------------------------- CHALLENGES -------------------------------

SELECT username, created_at FROM users ORDER BY created_at LIMIT 5;

SELECT DAYNAME(created_at) AS day, COUNT(*) AS total, 
RANK() OVER(ORDER BY COUNT(*) DESC) AS ranking
FROM users
GROUP BY day ORDER BY total DESC;
 
 SELECT username, image_url, user_id FROM users
 LEFT JOIN photos ON users.id = photos.user_id
 -- WHERE user_id IS NULL;
 WHERE photos.id IS NULL;

SELECT username, image_url, COUNT(*) AS likes FROM PHOTOS
JOIN likes ON PHOTOS.ID = LIKES.PHOTO_ID
JOIN users ON PHOTOS.USER_ID = USERS.ID
GROUP BY photos.id ORDER BY likes DESC LIMIT 1;

SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS AVG;

SELECT tag_name, COUNT(*) AS usages FROM tags
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tag_id ORDER BY usages DESC LIMIT 5;

SELECT username, COUNT(*) AS total
-- CASE
-- 	WHEN COUNT(DISTINCT users.id) = COUNT(photo_id) THEN 'BOT'
--     ELSE 'HUMAN'
-- END AS bots
FROM users
JOIN LIKES ON USERS.ID = LIKES.USER_ID
GROUP BY LIKES.USER_ID HAVING COUNT(*) = (SELECT COUNT(*) FROM photos);


