-- https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50
use leetcode_db;

Create table If Not Exists cinema (id int, movie varchar(255), description varchar(255), rating float(2, 1));
Truncate table cinema;
insert into cinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into cinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into cinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into cinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into cinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

DESC CINEMA;
SELECT * FROM CINEMA;

-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

SELECT * FROM CINEMA WHERE description != 'boring' and 
-- id % 2 != 0
mod(id, 2) = 1
ORDER BY RATING DESC;