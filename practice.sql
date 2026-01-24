-- Create employees table 
CREATE TABLE employees 
( 
	emp_id INT PRIMARY KEY, 
     name VARCHAR(50) NOT NULL, 
     dept VARCHAR(50), 
     salary DECIMAL(10,2), 
     join_date DATE ); 

-- Insert sample data 
INSERT INTO employees (emp_id, name, dept, salary, join_date) VALUES 
(1, 'Alex', 'IT', 60000, '2023-01-10'), 
(2, 'Sam', 'HR', 40000, '2022-05-20'), 
(3, 'John', 'IT', 70000, '2021-03-15'), 
(4, 'Maya', 'HR', 45000, '2023-07-01'), 
(5, 'Ravi', 'IT', 65000, '2022-11-12');

-- ------------------------------------------------------------------------------------------------------------------------
-- Find top 3 highest-paid employees
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- ------------------------------------------------------------------------------------------------------------------------
-- Find average salary per department
SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept;

-- ------------------------------------------------------------------------------------------------------------------------
-- Find duplicate employees based on name
SELECT name, COUNT(*) AS cnt
FROM employees
GROUP BY name
HAVING cnt>1;

-- ------------------------------------------------------------------------------------------------------------------------
-- Find employees who joined in 2023
SELECT * 
FROM employees
WHERE join_date BETWEEN '2023-01-01' AND '2023-12-31';

-- ------------------------------------------------------------------------------------------------------------------------
-- Find the second highest salary
SELECT  salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- ------------------------------------------------------------------------------------------------------------------------
-- Employees per department
SELECT dept, COUNT(*)
FROM employees
GROUP BY dept;

-- ------------------------------------------------------------------------------------------------------------------------
-- Departments with more than 2 employees
SELECT dept, COUNT(*) as cnt
FROM employees
GROUP BY dept
HAVING cnt>2;

-- ------------------------------------------------------------------------------------------------------------------------
-- Employees with max salary in each department
SELECT e.* 
FROM employees e
JOIN 
(
		SELECT dept, MAX(salary) as max_salary
          FROM employees
          GROUP BY dept
) m
ON e.dept= m.dept
AND e.salary=m.max_salary;

-- ------------------------------------------------------------------------------------------------------------------------
-- Delete duplicates
SELECT e1.*
FROM employees e1
JOIN employees e2
ON e1.name = e2.name 
AND e1.emp_id>e2.emp_id;