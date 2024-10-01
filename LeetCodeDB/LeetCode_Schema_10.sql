-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50
USE LEETCODE_DB;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS REGISTER;

Create table If Not Exists Users (user_id int, user_name varchar(20));
Create table If Not Exists Register (contest_id int, user_id int);
Truncate table Users;
insert into Users (user_id, user_name) values ('6', 'Alice');
insert into Users (user_id, user_name) values ('2', 'Bob');
insert into Users (user_id, user_name) values ('7', 'Alex');
Truncate table Register;
insert into Register (contest_id, user_id) values ('215', '6');
insert into Register (contest_id, user_id) values ('209', '2');
insert into Register (contest_id, user_id) values ('208', '2');
insert into Register (contest_id, user_id) values ('210', '6');
insert into Register (contest_id, user_id) values ('208', '6');
insert into Register (contest_id, user_id) values ('209', '7');
insert into Register (contest_id, user_id) values ('209', '6');
insert into Register (contest_id, user_id) values ('215', '7');
insert into Register (contest_id, user_id) values ('208', '7');
insert into Register (contest_id, user_id) values ('210', '2');
insert into Register (contest_id, user_id) values ('207', '2');
insert into Register (contest_id, user_id) values ('210', '7');

SELECT * FROM USERS;
SELECT * FROM REGISTER;

-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

SELECT contest_id, sum(r.user_id)/sum(r.user_id) FROM USERS u
LEFT JOIN REGISTER r ON u.user_id = r.user_id
GROUP BY contest_id;


SELECT contest_id, ROUND(count(r.user_id) / (SELECT count(user_id) FROM USERS) * 100, 2) AS percentage FROM USERS u
INNER JOIN REGISTER r ON u.user_id = r.user_id
GROUP BY contest_id ORDER BY percentage DESC, contest_id ASC;


