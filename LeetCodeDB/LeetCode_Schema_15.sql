-- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/?envType=study-plan-v2&envId=top-sql-50

DROP TABLE IF EXISTS TEACHER;
Create table If Not Exists Teacher (teacher_id int, subject_id int, dept_id int);
Truncate table Teacher;
insert into Teacher (teacher_id, subject_id, dept_id) values ('1', '2', '3');
insert into Teacher (teacher_id, subject_id, dept_id) values ('1', '2', '4');
insert into Teacher (teacher_id, subject_id, dept_id) values ('1', '3', '3');
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '1', '1');
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '2', '1');
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '3', '1');
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '4', '1');

SELECT * FROM TEACHER;

-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.

SELECT teacher_id, count(DISTINCT subject_id) AS cnt FROM TEACHER
GROUP BY teacher_id;

COMMIT;