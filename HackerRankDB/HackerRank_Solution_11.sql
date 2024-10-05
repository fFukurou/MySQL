-- https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem?isFullScreen=true

select count(distinct name) from city where population > 100000;