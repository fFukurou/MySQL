-- WEATHER OBSERVATION STATION PROBLEMS 1 - 15

-- https://www.hackerrank.com/challenges/weather-observation-station-1/problem?isFullScreen=true

-- 1
-- SELECT city, state FROM STATION WHERE lat_n > 0 and long_w > 0;

-- 2
-- SELECT round(sum(lat_n),2) as lat, round(sum(long_w),2) as lon from station;

-- 3
-- select distinct city from station where id % 2 = 0;

-- 4
-- select (count(*) - count(distinct city)) from station;

-- 5
-- (SELECT CITY, char_LENGTH(CITY) AS length 
-- FROM STATION 
-- ORDER BY LENGTH(CITY), CITY 
-- LIMIT 1)
-- UNION ALL
-- (SELECT CITY, char_LENGTH(CITY) AS length 
-- FROM STATION 
-- ORDER BY LENGTH(CITY) DESC, CITY 
-- LIMIT 1);

-- 6
-- select distinct city from station where substring(city, 1, 1) in ('A','E','I','O','U');

-- 7
-- select distinct city from station where RIGHT(city,1) in ('A','E','I','O','U');

-- 8
-- select distinct city from station where left(city,1) in ('A','E','I','O','U') and
-- right(city,1) in ('A','E','I','O','U');

-- 9
-- select distinct city from station where left(city,1) not in ('A','E','I','O','U');

-- 10
-- select distinct city from station where right(city,1) not in ('A','E','I','O','U');

-- 11
-- select distinct city from station where left(city,1) not in ('A','E','I','O','U') or 
-- right(city,1) not in ('A','E','I','O','U');

-- 12
-- select distinct city from station where left(city,1) not in ('A','E','I','O','U') and 
-- right(city,1) not in ('A','E','I','O','U');

-- 13
-- select round(sum(lat_n),4) FROM station
-- where lat_n > 38.7880 and lat_n < 137.2345;

-- 14
-- select round(max(lat_n),4) from station where lat_n < 137.2345;

-- 15
-- select round(long_w,4) from station where lat_n < 137.2345 
-- order by lat_n desc
-- limit 1;

-- 16
-- select round(min(lat_n),4) from station where lat_n > 38.7780;

-- 17
-- select round(long_w,4) from station where lat_n > 38.7780 order by lat_n asc limit 1;

-- 18
-- select round(abs((min(lat_n) - max(lat_n))) + (abs(min(long_w) - max(long_w))), 4) from station;

-- 19
-- SELECT 
-- ROUND(SQRT(POW(min(lat_n) - max(lat_n), 2) + 
--           POW(min(long_w) - max(long_w), 2))
-- , 4)
-- from station;

-- 20 
-- WITH ordered_station AS (
--     SELECT
--         lat_n,
--         ROW_NUMBER() OVER (ORDER BY lat_n) AS row_num,
--         COUNT(*) OVER () AS total_rows
--     FROM station
-- )
-- SELECT ROUND(AVG(lat_n), 4)
-- FROM ordered_station
-- WHERE row_num in (
--     FLOOR(((total_rows + 1) / 2)),
--     (total_rows + 2) / 2
-- );