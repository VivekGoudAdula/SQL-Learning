CREATE TABLE IF NOT EXISTS employees 
(
	id INT PRIMARY KEY,
     name CHAR(10) NOT NULL,
     dept CHAR(5) NOT NULL,
     salary INT NOT NULL
);

INSERT INTO employees(id, name, dept, salary) VALUES
("1",	"Alex",	"IT",	"50000"),
("2",	"Sam",	"HR",	"40000"),
("3",	"John",	"IT",	"60000");


-- -------------------- SELECT ---------------------------
-- Show all employees
SELECT * FROM employees;

-- Show only names and salaries
SELECT name, salary FROM employees;

-- -------------------- WHERE ---------------------------
-- Show employees from IT department 
SELECT * 
FROM employees 
WHERE dept = "IT";

-- Employees with salary > 45000
SELECT * 
FROM employees 
WHERE salary > 45000;

-- -------------------- AND/OR ---------------------------
-- Employees in IT with salary > 55000
SELECT *
FROM employees
WHERE dept = "IT" AND salary>55000;

-- Employees in IT or HR
SELECT * 
FROM employees
WHERE dept = "IT" OR dept="HR";

-- -------------------- AGGREGATE FUNCTIONS ---------------------------
-- 1. COUNT()
-- 2. MIN()
-- 3. MAX()
-- 4. SUM()
-- 5. AVERAGE()

-- -------------------- GROUP BY---------------------------
-- Average salary per department
SELECT dept,AVG(salary)
FROM employees
GROUP BY dept;

-- -------------------- HAVING --------------------------- 
-- Departments with average salary > 50000
SELECT dept, AVG(salary)
FROM employees
GROUP BY dept
HAVING AVG(salary)>50000;

-- -------------------- ORDER BY --------------------------- 
-- Employees sorted by salary (high to low)
SELECT * 
FROM employees
ORDER BY salary DESC;

