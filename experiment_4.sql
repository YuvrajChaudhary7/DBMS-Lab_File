
-- ============================================================
-- EXPERIMENT 4
-- SQL JOINS, SUBQUERIES, SET OPERATIONS AND EXPLAIN
-- DBMS Lab | MySQL
-- ============================================================

USE DBMS_Experiment3;

-- ============================================================
-- 1. INNER JOIN
-- Display employees along with their department names
-- ============================================================

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM Employee e
INNER JOIN Department d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_id;


-- ============================================================
-- 2. LEFT JOIN
-- Display all departments, including those with no employees
-- ============================================================

SELECT
    d.dept_id,
    d.dept_name,
    e.emp_name
FROM Department d
LEFT JOIN Employee e
    ON d.dept_id = e.dept_id
ORDER BY d.dept_id, e.emp_name;


-- ============================================================
-- 3. SELF JOIN
-- Find pairs of employees working in the same department
-- ============================================================

SELECT
    e1.emp_name AS employee_1,
    e2.emp_name AS employee_2,
    e1.dept_id
FROM Employee e1
INNER JOIN Employee e2
    ON e1.dept_id = e2.dept_id
   AND e1.emp_id < e2.emp_id
ORDER BY e1.dept_id, e1.emp_id;


-- ============================================================
-- 4. THREE-WAY JOIN
-- Display employees, their departments and assigned projects
-- ============================================================

SELECT
    e.emp_name,
    d.dept_name,
    p.project_name,
    ep.hours_worked
FROM Employee e
INNER JOIN Department d
    ON e.dept_id = d.dept_id
INNER JOIN Employee_Project ep
    ON e.emp_id = ep.emp_id
INNER JOIN Project p
    ON ep.project_id = p.project_id
ORDER BY e.emp_name, p.project_name;


-- ============================================================
-- 5. CORRELATED SUBQUERY
-- Find employees earning more than their department average
-- ============================================================

SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    e.dept_id
FROM Employee e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employee e2
    WHERE e2.dept_id = e.dept_id
)
ORDER BY e.dept_id, e.salary DESC;


-- ============================================================
-- 6. EXISTS
-- Find departments that have at least one employee
-- ============================================================

SELECT
    d.dept_id,
    d.dept_name
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.dept_id = d.dept_id
);


-- ============================================================
-- 7. NOT EXISTS
-- Find departments without any employees
-- ============================================================

SELECT
    d.dept_id,
    d.dept_name
FROM Department d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.dept_id = d.dept_id
);


-- ============================================================
-- 8. SIMULATE INTERSECT USING EXISTS
-- Find employees assigned to both projects 201 and 207
-- ============================================================

SELECT
    e.emp_id,
    e.emp_name
FROM Employee e
WHERE EXISTS (
    SELECT 1
    FROM Employee_Project ep1
    WHERE ep1.emp_id = e.emp_id
      AND ep1.project_id = 201
)
AND EXISTS (
    SELECT 1
    FROM Employee_Project ep2
    WHERE ep2.emp_id = e.emp_id
      AND ep2.project_id = 207
);


-- ============================================================
-- 9. SIMULATE EXCEPT USING NOT EXISTS
-- Find employees not assigned to project 201
-- ============================================================

SELECT
    e.emp_id,
    e.emp_name
FROM Employee e
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee_Project ep
    WHERE ep.emp_id = e.emp_id
      AND ep.project_id = 201
)
ORDER BY e.emp_id;


-- ============================================================
-- 10. EXPLAIN
-- Examine the execution plan of an employee query
-- ============================================================

EXPLAIN
SELECT
    e.emp_name,
    d.dept_name
FROM Employee e
INNER JOIN Department d
    ON e.dept_id = d.dept_id
WHERE e.salary > 70000;


-- ============================================================
-- 11. EXPLAIN ANALYZE (MySQL 8.0.18 OR LATER)
-- Executes the query and reports actual execution details
-- ============================================================

EXPLAIN ANALYZE
SELECT
    emp_name,
    salary
FROM Employee
WHERE salary > 70000;


-- ============================================================
-- END OF EXPERIMENT 4
-- ============================================================
