-- https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true

-- 
SELECT 
    CONCAT(name, '(', LEFT(occupation, 1), ')') AS profession_with_parentheses 
FROM 
    occupations 
ORDER BY 
    name;
-- 
SELECT concat('There are a total of ',count(occupation), ' ' ,lower(occupation), 's.') FROM occupations
group by occupation
order by count(occupation), occupation;
