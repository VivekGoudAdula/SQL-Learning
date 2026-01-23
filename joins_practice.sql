-- Create departments table 
CREATE TABLE departments 
( 
	dept_id INT PRIMARY KEY, 
     dept_name VARCHAR(50) NOT NULL 
);

-- Create employees table 
CREATE TABLE employees 
( 
	emp_id INT PRIMARY KEY, 
     name VARCHAR(50) NOT NULL, 
     dept_id INT, 
     salary DECIMAL(10,2), 
     FOREIGN KEY (dept_id) REFERENCES departments(dept_id) 
);



-- --------------------------------------------------------------------------------------------------------------------------------
-- Insert sample data into departments 
INSERT INTO departments (dept_id, dept_name) VALUES 
(10, 'IT'), 
(20, 'HR'), 
(30, 'Finance'); 

-- Insert sample data into employees 
INSERT INTO employees (emp_id, name, dept_id, salary) VALUES 
(1, 'Alex', 10, 50000), 
(2, 'Sam', 20, 40000), 
(3, 'John', 10, 60000), 
(4, 'Maya', 30, 45000);

-- --------------------------------------------------------------------------------------------------------------------------------
-- Show employee name and department name.
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- --------------------------------------------------------------------------------------------------------------------------------
-- Show employees only from IT department.
SELECT e.name, d.dept_name
FROM employees e
INNER  JOIN departments d
ON e.dept_id=d.dept_id
WHERE dept_name = "IT";

-- --------------------------------------------------------------------------------------------------------------------------------
-- Find average salary per department.
SELECT d.dept_name, AVG(e.salary) as AVG_SALARY
FROM departments d
INNER JOIN employees e
ON e.dept_id=d.dept_id
GROUP BY d.dept_name;

-- --------------------------------------------------------------------------------------------------------------------------------
-- Show departments where average salary > 45000.
SELECT d.dept_name, AVG(e.salary) AS AVG_SALARY
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name
HAVING AVG_SALARY > 45000;

-- --------------------------------------------------------------------------------------------------------------------------------
-- Number of Employees per department
SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM employees e
INNER JOIN departments d
ON e.dept_id=d.dept_id
GROUP BY d.dept_name;

