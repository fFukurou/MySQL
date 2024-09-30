-- https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50

use leetcode_db;

Create table If Not Exists Employee (empId int, name varchar(255), supervisor int, salary int);
Create table If Not Exists Bonus (empId int, bonus int);
Truncate table Employee;
insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', NULL, '4000');
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000');
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000');
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000');
Truncate table Bonus;
insert into Bonus (empId, bonus) values ('2', '500');
insert into Bonus (empId, bonus) values ('4', '2000');

-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

SELECT * FROM EMPLOYEE;
SELECT * FROM BONUS;

SELECT name, bonus FROM EMPLOYEE
LEFT JOIN BONUS ON EMPLOYEE.EMPID = BONUS.EMPID
WHERE BONUS < 1000 OR BONUS IS NULL;