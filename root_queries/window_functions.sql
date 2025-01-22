-- Window Functions perform aggregate operations on groups of rows, but they produce a result for each row

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
 
 
-- Question: Retrieve the employee number, department, salary, and the average salary across all employees.
SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

-- Question: Retrieve the employee number, department, salary, and the minimum and maximum salary across all employees.
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

-- Question: Retrieve the employee number, department, salary, the average salary within each department, and the overall company average salary.
SELECT 
    emp_no, 
    department, 
    salary, 
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

-- Question: Retrieve the employee number, department, salary, and the count of employees within each department.
SELECT 
    emp_no, 
    department, 
    salary, 
    COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;

-- Question: Retrieve the employee number, department, salary, the total payroll within each department, and the total payroll across the company.
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

-- Question: Retrieve the employee number, department, salary, the cumulative salary within each department ordered by salary, and the total department salary.
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

-- Question: Retrieve the employee number, department, salary, and the rolling minimum salary within each department ordered by salary in descending order.
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;

-- Question: List employees in the order of their salaries using the RANK() function.
SELECT
	emp_no,
    department,
    salary,
    RANK() OVER(ORDER BY salary DESC)
FROM employees;

-- Question: List employees in the order of their salaries within each department using the RANK() function.
SELECT
	emp_no,
    department,
    salary,
    RANK() OVER(PARTITION BY department ORDER BY salary)
FROM employees;

-- Question: Retrieve the employee number, department, salary, their overall row number by salary, row number within each department by salary, their rank within each department, their overall rank, and their dense rank overall.
SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank
FROM employees ORDER BY overall_rank;

-- Question: Retrieve the employee number, department, salary, and their salary quartile within each department and overall using NTILE(4).
SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- Question: Retrieve the employee number, department, salary, the employee number of the highest-paid employee within each department, and the employee number of the highest-paid employee overall.
SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

-- Question: Retrieve the employee number, department, salary, and the salary difference compared to the previous salary when sorted in descending order.
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;

-- Question: Retrieve the employee number, department, salary, and the salary difference within each department compared to the previous salary when sorted in descending order.
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;