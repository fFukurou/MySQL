-- https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true


select name from students where marks > 75
order by substring(name ,-3, 3), id;