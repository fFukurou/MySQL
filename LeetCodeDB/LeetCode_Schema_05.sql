-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50
USE leetcode_db;

DROP TABLE IF EXISTS EMPLOYEE;
Create table If Not Exists Employee (id int, name varchar(255), department varchar(255), managerId int);
Truncate table Employee;
insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', NULL);
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');

DESC EMPLOYEE;
SELECT * FROM EMPLOYEE;

SELECT IFNULL(e1.name, 'null') as name FROM EMPLOYEE e1
JOIN employee e2 ON e1.id = e2.managerId
GROUP BY e1.name, e1.id HAVING COUNT(e1.name) >= 5;


CREATE VIEW manager_gt5_reports as 
	SELECT managerId, COUNT(*) AS directReports
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5;

SELECT E1.name
FROM Employee E1
JOIN manager_gt5_reports E2 ON E1.id = E2.managerId;