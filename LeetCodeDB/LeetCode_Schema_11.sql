-- https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50

use leetcode_db;
DROP TABLE IF EXISTS QUERIES;
Create table If Not Exists Queries (query_name varchar(30), result varchar(50), position int, rating int);
Truncate table Queries;
insert into Queries (query_name, result, position, rating) values ('Dog', 'Golden Retriever', '1', '5');
insert into Queries (query_name, result, position, rating) values ('Dog', 'German Shepherd', '2', '5');
insert into Queries (query_name, result, position, rating) values ('Dog', 'Mule', '200', '1');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Shirazi', '5', '2');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Siamese', '3', '3');
insert into Queries (query_name, result, position, rating) values ('Cat', 'Sphynx', '7', '4');

-- Quality: The average of the ratio between query rating and its position.
-- Poor query percentage: The average of the ratio between query rating and its position.

SELECT query_name, ROUND(AVG(rating/position), 2) AS quality, (SELECT count(*) FROM QUERIES WHERE rating < 3 GROUP BY query_name)/count(*) AS poor_query_percentage FROM QUERIES
GROUP BY query_name; -- FAILT

SELECT count(*) FROM QUERIES WHERE rating < 3 GROUP BY query_name; 


-- SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)
SELECT query_name, ROUND(AVG(rating/position), 2) AS quality, 
ROUND(SUM(CASE
	WHEN rating < 3 THEN 1 ELSE 0
END) / count(*) * 100, 2) AS poor_query_percentage
FROM QUERIES
GROUP BY query_name HAVING query_name IS NOT NULL; 