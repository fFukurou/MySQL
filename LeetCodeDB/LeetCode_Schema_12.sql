-- https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50

USE LEETCODE_DB;
DROP TABLE IF EXISTS TRANSACTIONS;
Create table If Not Exists Transactions (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date);
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values ('121', 'US', 'approved', '1000', '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date) values ('122', 'US', 'declined', '2000', '2018-12-19');
insert into Transactions (id, country, state, amount, trans_date) values ('123', 'US', 'approved', '2000', '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date) values ('124', 'DE', 'approved', '2000', '2019-01-07');

-- Write an SQL query to find for each month and country, 
-- the number of transactions and their total amount, the number of approved transactions and their total amount.

select * from transactions;

SELECT DATE_FORMAT(trans_date, '%Y-%m') as month, country, count(*) as trans_count , sum(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
sum(amount) as trans_total_amount, 
sum(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM TRANSACTIONS t
GROUP BY month, country;
