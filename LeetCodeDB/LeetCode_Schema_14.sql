-- https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50
USE LEETCODE_DB;

DROP TABLE IF EXISTS ACTIVITY;
Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

select * from activity;

    SELECT player_id, event_date,
           LAG(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date) AS previous_date
    FROM Activity;


SELECT player_id, event_date, previous_date
FROM (
    SELECT player_id, event_date,
           LAG(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date) AS previous_date
    FROM Activity
) AS subquery
WHERE DATEDIFF(event_date, previous_date) = 1;

# Write your MySQL query statement below
SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id;



SELECT
  ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
  Activity
WHERE
  (player_id, DATE_SUB(event_date, INTERVAL 1 DAY))
  IN (
    SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id
  );