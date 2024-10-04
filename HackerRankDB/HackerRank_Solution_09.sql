-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true

select
CASE
    WHEN A + B <= C OR A + C <= B OR C + B <= A THEN 'Not A Triangle'
    WHEN A != B and A != C and B != C THEN 'Scalene'
    WHEN A = B AND A = C THEN 'Equilateral'
    WHEN A = B OR A = C OR B = C THEN 'Isosceles'
END
from triangles;
