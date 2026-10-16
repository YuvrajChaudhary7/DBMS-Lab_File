
-- ============================================================
-- EXPERIMENT 3
-- Employee-Department-Project Schema and SQL Queries
-- DBMS Lab | MySQL
-- ============================================================

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS DBMS_Experiment3;
USE DBMS_Experiment3;

-- Disable FK checks temporarily to reset tables safely
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Employee_Project;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 2. CREATE TABLES
-- ============================================================

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    start_date DATE,
    end_date DATE
);

-- Junction table for the many-to-many relationship
CREATE TABLE Employee_Project (
    emp_id INT,
    project_id INT,
    assigned_date DATE,
    hours_worked INT DEFAULT 0,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id)
        REFERENCES Employee(emp_id),
    FOREIGN KEY (project_id)
        REFERENCES Project(project_id)
);

-- ============================================================
-- 3. INSERT DEPARTMENT DATA (5 DEPARTMENTS)
-- ============================================================

INSERT INTO Department VALUES
(1, 'Computer Science', 'Lucknow'),
(2, 'Artificial Intelligence', 'Lucknow'),
(3, 'Human Resources', 'Delhi'),
(4, 'Finance', 'Mumbai'),
(5, 'Marketing', 'Noida');

-- ============================================================
-- 4. INSERT EMPLOYEE DATA (30 EMPLOYEES)
-- ============================================================

INSERT INTO Employee
(emp_id, emp_name, gender, salary, hire_date, dept_id)
VALUES
(101, 'Aarav Sharma', 'Male', 65000, '2022-01-10', 1),
(102, 'Priya Verma', 'Female', 72000, '2021-03-15', 1),
(103, 'Rahul Singh', 'Male', 58000, '2023-05-20', 1),
(104, 'Ananya Gupta', 'Female', 81000, '2020-07-11', 1),
(105, 'Rohan Mehta', 'Male', 62000, '2022-09-01', 1),
(106, 'Sneha Mishra', 'Female', 76000, '2021-11-19', 1),

(107, 'Yash Agarwal', 'Male', 85000, '2020-02-10', 2),
(108, 'Isha Kapoor', 'Female', 92000, '2019-06-12', 2),
(109, 'Aditya Joshi', 'Male', 78000, '2022-04-18', 2),
(110, 'Kavya Nair', 'Female', 88000, '2021-08-22', 2),
(111, 'Arjun Malhotra', 'Male', 95000, '2019-12-05', 2),
(112, 'Meera Saxena', 'Female', 82000, '2023-01-16', 2),

(113, 'Vikram Yadav', 'Male', 45000, '2022-03-14', 3),
(114, 'Pooja Das', 'Female', 52000, '2021-05-09', 3),
(115, 'Karan Bhatia', 'Male', 48000, '2023-02-17', 3),
(116, 'Riya Chawla', 'Female', 56000, '2020-10-25', 3),
(117, 'Mohit Tiwari', 'Male', 50000, '2022-06-30', 3),
(118, 'Neha Sinha', 'Female', 54000, '2021-09-13', 3),

(119, 'Amit Khanna', 'Male', 68000, '2020-04-21', 4),
(120, 'Simran Kaur', 'Female', 75000, '2019-08-08', 4),
(121, 'Deepak Roy', 'Male', 63000, '2022-07-14', 4),
(122, 'Tanya Arora', 'Female', 79000, '2021-02-26', 4),
(123, 'Nikhil Jain', 'Male', 71000, '2020-12-10', 4),
(124, 'Shreya Bose', 'Female', 73000, '2023-04-03', 4),

(125, 'Varun Sethi', 'Male', 55000, '2022-02-12', 5),
(126, 'Aditi Rao', 'Female', 61000, '2021-04-17', 5),
(127, 'Manish Pandey', 'Male', 49000, '2023-06-08', 5),
(128, 'Naina Ghosh', 'Female', 67000, '2020-09-19', 5),
(129, 'Sahil Kapoor', 'Male', 59000, '2022-11-23', 5),
(130, 'Diya Malhotra', 'Female', 64000, '2021-07-05', 5);

-- ============================================================
-- 5. INSERT PROJECT DATA (8 PROJECTS)
-- ============================================================

INSERT INTO Project VALUES
(201, 'E-Commerce Website', 500000, '2024-01-01', '2024-12-31'),
(202, 'AI Chatbot', 750000, '2024-02-01', '2025-01-31'),
(203, 'Employee Portal', 300000, '2024-03-01', '2024-09-30'),
(204, 'Financial Dashboard', 450000, '2024-04-01', '2025-03-31'),
(205, 'Marketing Campaign', 250000, '2024-05-01', '2024-11-30'),
(206, 'Data Analytics System', 800000, '2024-06-01', '2025-06-30'),
(207, 'Cybersecurity Upgrade', 600000, '2024-07-01', '2025-07-31'),
(208, 'Mobile Application', 550000, '2024-08-01', '2025-08-31');

-- ============================================================
-- 6. ASSIGN EMPLOYEES TO PROJECTS
-- ============================================================

INSERT INTO Employee_Project
(emp_id, project_id, assigned_date, hours_worked)
VALUES
(101, 201, '2024-01-05', 120),
(102, 201, '2024-01-06', 100),
(103, 206, '2024-06-10', 90),
(104, 207, '2024-07-05', 110),
(105, 208, '2024-08-10', 80),
(106, 202, '2024-02-05', 95),
(107, 202, '2024-02-06', 140),
(108, 206, '2024-06-11', 130),
(109, 202, '2024-02-10', 100),
(110, 208, '2024-08-12', 115),
(111, 207, '2024-07-08', 150),
(112, 206, '2024-06-15', 105),
(113, 203, '2024-03-05', 90),
(114, 203, '2024-03-06', 85),
(115, 205, '2024-05-04', 75),
(116, 203, '2024-03-10', 100),
(117, 205, '2024-05-08', 80),
(118, 203, '2024-03-15', 95),
(119, 204, '2024-04-05', 120),
(120, 204, '2024-04-08', 130),
(121, 204, '2024-04-10', 90),
(122, 206, '2024-06-18', 110),
(123, 204, '2024-04-12', 100),
(124, 205, '2024-05-10', 95),
(125, 205, '2024-05-12', 85),
(126, 201, '2024-01-12', 100),
(127, 205, '2024-05-15', 70),
(128, 208, '2024-08-15', 105),
(129, 201, '2024-01-18', 90),
(130, 208, '2024-08-18', 115),
(101, 207, '2024-07-10', 60),
(107, 206, '2024-06-20', 100),
(119, 206, '2024-06-22', 80),
(125, 201, '2024-01-20', 65);

-- ============================================================
-- 7. DISPLAY ALL RECORDS
-- ============================================================

SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;
SELECT * FROM Employee_Project;

-- ============================================================
-- 8. SELECTION: SELECT ROWS USING CONDITIONS
-- ============================================================

-- Employees earning more than 70000
SELECT *
FROM Employee
WHERE salary > 70000;

-- Employees belonging to department 1
SELECT *
FROM Employee
WHERE dept_id = 1;

-- Employees hired after 1 January 2022
SELECT *
FROM Employee
WHERE hire_date > '2022-01-01';

-- ============================================================
-- 9. PROJECTION: SELECT SPECIFIC COLUMNS
-- ============================================================

SELECT emp_name, salary
FROM Employee;

SELECT emp_name, dept_id
FROM Employee;

-- ============================================================
-- 10. AGGREGATE FUNCTIONS
-- ============================================================

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM Employee;

-- Total salary of all employees
SELECT SUM(salary) AS total_salary
FROM Employee;

-- Average salary
SELECT AVG(salary) AS average_salary
FROM Employee;

-- Minimum salary
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- Maximum salary
SELECT MAX(salary) AS maximum_salary
FROM Employee;

-- ============================================================
-- 11. GROUP BY
-- ============================================================

-- Number of employees in each department
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM Department d
LEFT JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- Average salary in each department
SELECT d.dept_name, AVG(e.salary) AS average_salary
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- ============================================================
-- 12. HAVING
-- ============================================================

-- Departments with average salary greater than 65000
SELECT d.dept_name, AVG(e.salary) AS average_salary
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING AVG(e.salary) > 65000;

-- Departments having more than 5 employees
SELECT dept_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY dept_id
HAVING COUNT(*) > 5;

-- ============================================================
-- 13. CASE EXPRESSIONS
-- ============================================================

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High Salary'
        WHEN salary >= 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM Employee;

-- ============================================================
-- 14. ORDER BY
-- ============================================================

-- Employees sorted by salary in descending order
SELECT emp_name, salary
FROM Employee
ORDER BY salary DESC;

-- Employees sorted by name in ascending order
SELECT emp_id, emp_name
FROM Employee
ORDER BY emp_name ASC;

-- Sort by department, then salary
SELECT emp_name, dept_id, salary
FROM Employee
ORDER BY dept_id ASC, salary DESC;

-- ============================================================
-- 15. JOINS: EMPLOYEE AND DEPARTMENT
-- ============================================================

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
ORDER BY d.dept_name, e.emp_name;

-- ============================================================
-- 16. JOINS: EMPLOYEE, PROJECT AND ASSIGNMENTS
-- ============================================================

SELECT
    e.emp_name,
    p.project_name,
    ep.hours_worked
FROM Employee e
JOIN Employee_Project ep ON e.emp_id = ep.emp_id
JOIN Project p ON ep.project_id = p.project_id
ORDER BY e.emp_name;

-- ============================================================
-- 17. PROJECT-WISE EMPLOYEE COUNT
-- ============================================================

SELECT
    p.project_name,
    COUNT(ep.emp_id) AS assigned_employees
FROM Project p
LEFT JOIN Employee_Project ep
    ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name
ORDER BY assigned_employees DESC;

-- ============================================================
-- 18. TOTAL HOURS WORKED BY EACH EMPLOYEE
-- ============================================================

SELECT
    e.emp_id,
    e.emp_name,
    COALESCE(SUM(ep.hours_worked), 0) AS total_hours
FROM Employee e
LEFT JOIN Employee_Project ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id, e.emp_name
ORDER BY total_hours DESC;

-- ============================================================
-- 19. EMPLOYEES EARNING ABOVE THE COMPANY AVERAGE
-- ============================================================

SELECT emp_name, salary
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
)
ORDER BY salary DESC;

-- ============================================================
-- 20. END OF EXPERIMENT 3
-- ============================================================
