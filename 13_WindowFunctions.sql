USE test_db;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

-- --------------------------------- OVER ---------------------------------

SELECT emp_no, department, salary, MIN(salary) OVER(), MAX(salary) OVER(), AVG(salary) OVER() FROM employees;

-- --------------------------------- PARTITION BY (will form rows into groups of row) ---------------------------------

SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department) AS dept_average,
AVG(salary) OVER() AS company_average
FROM employees;

SELECT emp_no, department, salary, COUNT(*) OVER(PARTITION BY department) AS dept_count FROM employees;

SELECT emp_no, department, salary, SUM(salary) OVER(PARTITION BY department) as dept_payroll,
SUM(salary) OVER() as company_payroll
FROM employees;

-- --------------------------------- ORDER BY WITH WINDOWS ---------------------------------

SELECT emp_no, department, salary, SUM(salary) OVER(PARTITION BY department ORDER BY salary) as rolling_dept_payroll,
SUM(salary) OVER(PARTITION BY department) as dept_payroll
FROM employees;

SELECT emp_no, department, salary, MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees; 

-- --------------------------------- RANK() ---------------------------------

SELECT emp_no, department, salary, 
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees ORDER BY department;

-- --------------------------------- DENSE_RANK() & ROW_NUMBER() ---------------------------------
-- ROW_NUMBER WILL JUST RETURN THE NUMBER OF THE ROW,
-- WHILE DENSE_RANK WILL NOT SKIP ANY RANKS IN CASE OF A TIE

SELECT emp_no, department, salary, 
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as dept_row_number,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank,
DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_dense_rank
FROM employees ORDER BY OVERALL_SALARY_RANK;

-- --------------------------------- NTILE() ---------------------------------

SELECT emp_no, department, salary, 
NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees ORDER BY department;

-- --------------------------------- FIRST_VALUE(), LAST_VALUE(), NTH_VALUE() ---------------------------------

SELECT emp_no, department, salary, 
FIRST_VALUE(emp_NO) OVER(PARTITION BY department ORDER BY salary DESC) AS highest_paid_dept,
FIRST_VALUE(emp_NO) OVER(ORDER BY salary DESC)
FROM employees ORDER BY department;

-- --------------------------------- LAG AND DIFF ---------------------------------

SELECT emp_no, department, salary, 
LAG(salary) OVER(ORDER BY salary DESC)
FROM employees;	

SELECT emp_no, department, salary, 
salary - LAG(salary) OVER(ORDER BY salary DESC) AS salary_diff
FROM employees;	

SELECT emp_no, department, salary, 
salary - LEAD(salary) OVER(ORDER BY salary DESC) AS salary_diff
FROM employees;	

SELECT emp_no, department, salary, 
salary - LAG(salary, 1) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_diff
FROM employees;	

