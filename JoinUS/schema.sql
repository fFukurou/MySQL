CREATE DATABASE join_us;
USE join_us;

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (email) VALUES
('Katie34@yahoo.com'), ('Tunde@gmail.com');

DELETE FROM users;

select * from users;
select count(*) from users;

-- -------------------- EXERCISES ------------------------------

SELECT DATE_FORMAT(created_at, '%M %D %Y') AS earliest_date FROM users ORDER BY created_at LIMIT 1;
SELECT DATE_FORMAT(MIN(created_at), '%M %D %Y') AS earliest_date FROM users;

SELECT email, created_at FROM users ORDER BY created_at LIMIT 1;
SELECT email, created_at FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);

SELECT MONTHNAME(created_at) AS month, COUNT(*) as count FROM users
GROUP BY month ORDER BY count DESC;

SELECT COUNT(*) FROM users WHERE email LIKE '%@yahoo.com%';

SELECT 
CASE
	WHEN email LIKE '%@gmail.com%' THEN 'gmail'
	WHEN email LIKE '%@yahoo.com%' THEN 'yahoo'
	WHEN email LIKE '%@hotmail.com%' THEN 'hotmail'
	ELSE 'other'
END AS provider, COUNT(*)
FROM users GROUP BY provider;
