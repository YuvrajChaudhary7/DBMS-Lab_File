
-- ============================================================
-- EXPERIMENT 5
-- VIEWS, EMPLOYEE HIERARCHIES AND RECURSIVE CTEs
-- DBMS Lab | MySQL 8.0+
-- ============================================================

USE DBMS_Experiment3;

-- ============================================================
-- 1. VIEW: EMPLOYEE DETAILS
-- ============================================================

CREATE OR REPLACE VIEW Employee_Details AS
SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employee e
JOIN Department d
    ON e.dept_id = d.dept_id;

-- Display the view
SELECT * FROM Employee_Details;


-- ============================================================
-- 2. VIEW: DEPARTMENT SALARY SUMMARY
-- Shows employee count and salary statistics per department
-- ============================================================

CREATE OR REPLACE VIEW Department_Salary_Summary AS
SELECT
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    COALESCE(SUM(e.salary), 0) AS total_salary,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM Department d
LEFT JOIN Employee e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- Display the summary
SELECT * FROM Department_Salary_Summary;


-- ============================================================
-- 3. VIEW: EMPLOYEE HIERARCHY
-- This view shows employees and their department information.
-- The Employee table has no manager_id column, so a true
-- reporting hierarchy requires an additional relationship.
-- ============================================================

CREATE OR REPLACE VIEW Employee_Department_View AS
SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_id,
    d.dept_name
FROM Employee e
JOIN Department d
    ON e.dept_id = d.dept_id;

SELECT * FROM Employee_Department_View;


-- ============================================================
-- 4. TEST VIEW UPDATABILITY
-- A simple single-table view is generally updatable.
-- The following view exposes only columns from Employee.
-- ============================================================

CREATE OR REPLACE VIEW Employee_Simple_View AS
SELECT
    emp_id,
    emp_name,
    salary,
    dept_id
FROM Employee;

-- Read through the view
SELECT * FROM Employee_Simple_View;

-- Example update through the simple view:
-- Uncomment to test, then restore the original value if needed.
-- UPDATE Employee_Simple_View
-- SET salary = salary + 1000
-- WHERE emp_id = 101;

-- Check whether a view is updatable
SELECT
    TABLE_NAME,
    IS_UPDATABLE
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME IN (
      'Employee_Details',
      'Department_Salary_Summary',
      'Employee_Department_View',
      'Employee_Simple_View'
  );


-- ============================================================
-- 5. ADD MANAGER RELATIONSHIP
-- Add a self-referencing foreign key to Employee.
-- Existing employees will initially have no assigned manager.
-- ============================================================

ALTER TABLE Employee
    ADD COLUMN manager_id INT NULL;

ALTER TABLE Employee
    ADD CONSTRAINT fk_employee_manager
    FOREIGN KEY (manager_id)
    REFERENCES Employee(emp_id)
    ON DELETE SET NULL;

-- Set up a sample reporting hierarchy
-- Manager 101 is at the top of this sample hierarchy.
UPDATE Employee SET manager_id = 101
WHERE emp_id IN (102, 103, 104, 105, 106);

UPDATE Employee SET manager_id = 107
WHERE emp_id IN (108, 109, 110, 111, 112);

UPDATE Employee SET manager_id = 113
WHERE emp_id IN (114, 115, 116, 117, 118);

UPDATE Employee SET manager_id = 119
WHERE emp_id IN (120, 121, 122, 123, 124);

UPDATE Employee SET manager_id = 125
WHERE emp_id IN (126, 127, 128, 129, 130);


-- ============================================================
-- 6. RECURSIVE CTE: REPORTING CHAIN
-- Start from employee 101 and find all their subordinates.
-- ============================================================

WITH RECURSIVE Reporting_Chain AS (
    -- Anchor member
    SELECT
        emp_id,
        emp_name,
        manager_id,
        0 AS hierarchy_level
    FROM Employee
    WHERE emp_id = 101

    UNION ALL

    -- Recursive member
    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        rc.hierarchy_level + 1
    FROM Employee e
    JOIN Reporting_Chain rc
        ON e.manager_id = rc.emp_id
)
SELECT
    emp_id,
    emp_name,
    manager_id,
    hierarchy_level
FROM Reporting_Chain
ORDER BY hierarchy_level, emp_id;


-- ============================================================
-- 7. RECURSIVE CTE: COMPLETE EMPLOYEE HIERARCHY
-- Display all employees starting from top-level employees.
-- ============================================================

WITH RECURSIVE Employee_Hierarchy AS (
    -- Employees with no manager
    SELECT
        emp_id,
        emp_name,
        manager_id,
        0 AS hierarchy_level
    FROM Employee
    WHERE manager_id IS NULL

    UNION ALL

    -- Find each employee's direct reports
    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.hierarchy_level + 1
    FROM Employee e
    JOIN Employee_Hierarchy eh
        ON e.manager_id = eh.emp_id
)
SELECT
    emp_id,
    emp_name,
    manager_id,
    hierarchy_level
FROM Employee_Hierarchy
ORDER BY hierarchy_level, emp_id;


-- ============================================================
-- 8. END OF EXPERIMENT 5
-- ============================================================
