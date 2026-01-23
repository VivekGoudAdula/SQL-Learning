CREATE TABLE departments 
(
	dept_id INT PRIMARY KEY,
     dept_name VARCHAR(5) NOT NULL
);

CREATE TABLE employees
(
	emp_id INT PRIMARY KEY,
	name	VARCHAR (10) NOT NULL,
	dept_id INT,
     FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- ----------------------------------------------------------------------------------------------------------------------
INSERT INTO departments VALUES
(10, "IT"),
(20, "HR");

INSERT INTO employees VALUES
(1, "Alex", 10),
(2, "Sam", 20),
(3, "John", 10);

-- ----------------------------------------------------------------------------------------------------------------------

-- INNER JOIN
-- Show employee name and department name

SELECT e.name, d.dept_name
FROM employees as e
INNER JOIN departments as d
ON e.dept_id = d.dept_id;


-- ----------------------------------------------------------------------------------------------------------------------
-- LEFT JOIN
-- Show all employees, even if they don’t have a department
SELECT e.*, d.dept_name
FROM employees as e
LEFT JOIN departments as d
ON e.dept_id=d.dept_id;

-- ----------------------------------------------------------------------------------------------------------------------
-- RIGHT JOIN
SELECT e.name, d.*
FROM employees as e
RIGHT JOIN departments as d
ON e.dept_id=d.dept_id;