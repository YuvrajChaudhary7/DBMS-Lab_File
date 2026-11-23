
CREATE DATABASE IF NOT EXISTS OptimizationLab;
USE OptimizationLab;

DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- Create Department Table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
) ENGINE = InnoDB;

-- Create Employee Table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    joining_date DATE,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
) ENGINE = InnoDB;

-- Create Project Table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    employee_id INT,
    budget DECIMAL(12,2),
    FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id)
) ENGINE = InnoDB;

-- Insert Department Records
INSERT INTO Department VALUES
(1, 'CSE', 'Block A'),
(2, 'IT', 'Block B'),
(3, 'ECE', 'Block C'),
(4, 'Mechanical', 'Block D');

-- Insert Employee Records
INSERT INTO Employee VALUES
(101, 'Aman', 45000, 1, '2022-01-10'),
(102, 'Riya', 55000, 1, '2021-05-15'),
(103, 'Karan', 35000, 2, '2023-03-20'),
(104, 'Priya', 60000, 2, '2020-07-11'),
(105, 'Rahul', 40000, 3, '2022-09-01'),
(106, 'Neha', 70000, 3, '2019-02-18'),
(107, 'Arjun', 30000, 4, '2023-06-25'),
(108, 'Sneha', 65000, 1, '2020-11-30');

-- Insert Project Records
INSERT INTO Project VALUES
(201, 'AI System', 101, 500000),
(202, 'Web Portal', 102, 300000),
(203, 'Cloud System', 103, 450000),
(204, 'Security App', 104, 600000),
(205, 'IoT Project', 105, 350000),
(206, 'ML Platform', 106, 700000),
(207, 'Database App', 108, 250000);

-- Display Tables
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;

-- QUERY 1: Filtering without an additional index
EXPLAIN
SELECT * FROM Employee
WHERE department_id = 1;

-- QUERY 2: Salary filtering before indexing
EXPLAIN
SELECT * FROM Employee
WHERE salary > 45000;

-- QUERY 3: JOIN execution plan before additional indexes
EXPLAIN
SELECT
    e.employee_name,
    d.department_name
FROM Employee e
JOIN Department d
    ON e.department_id = d.department_id;

-- Create Indexes
CREATE INDEX idx_employee_department
ON Employee(department_id);

CREATE INDEX idx_employee_salary
ON Employee(salary);

CREATE INDEX idx_employee_department_salary
ON Employee(department_id, salary);

-- Display Indexes
SHOW INDEX FROM Employee;

-- QUERY 1: After indexing
EXPLAIN
SELECT * FROM Employee
WHERE department_id = 1;

-- QUERY 2: After indexing
EXPLAIN
SELECT * FROM Employee
WHERE salary > 45000;

-- QUERY 3: After indexing
EXPLAIN
SELECT
    e.employee_name,
    d.department_name
FROM Employee e
JOIN Department d
    ON e.department_id = d.department_id;

-- Optimized Query: Select only required columns
SELECT
    employee_name,
    salary
FROM Employee
WHERE department_id = 1
AND salary > 40000;

-- Optimized JOIN Query
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary
FROM Employee e
INNER JOIN Department d
    ON e.department_id = d.department_id
WHERE e.salary > 40000;

-- Aggregate Query
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary
FROM Department d
LEFT JOIN Employee e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- Analyze Actual Execution Statistics
-- Requires MySQL 8.0.18 or later
EXPLAIN ANALYZE
SELECT
    employee_name,
    salary
FROM Employee
WHERE department_id = 1
AND salary > 40000;

-- Final Results
SELECT * FROM Employee;
