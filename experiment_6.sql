
-- ============================================================
-- EXPERIMENT 6
-- STORED PROCEDURES, TRIGGERS AND AUDIT LOGGING
-- DBMS Lab | MySQL 8.0+
-- ============================================================

USE DBMS_Experiment3;

-- ============================================================
-- 1. CREATE AUDIT LOG TABLE
-- Stores employee salary changes
-- ============================================================

CREATE TABLE IF NOT EXISTS Salary_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action_type VARCHAR(20)
);

-- ============================================================
-- 2. CREATE TRIGGER TO VALIDATE SALARY
-- Rejects zero or negative salaries
-- ============================================================

DROP TRIGGER IF EXISTS before_employee_update;

DELIMITER //

CREATE TRIGGER before_employee_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Salary must be greater than zero';
    END IF;
END //

DELIMITER ;

-- ============================================================
-- 3. CREATE TRIGGER TO LOG SALARY CHANGES
-- Records old and new salary after an update
-- ============================================================

DROP TRIGGER IF EXISTS after_employee_salary_update;

DELIMITER //

CREATE TRIGGER after_employee_salary_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO Salary_Audit
            (emp_id, old_salary, new_salary, action_type)
        VALUES
            (NEW.emp_id, OLD.salary, NEW.salary, 'SALARY UPDATE');
    END IF;
END //

DELIMITER ;

-- ============================================================
-- 4. CREATE STORED PROCEDURE
-- Transfer an employee to another department
-- ============================================================

DROP PROCEDURE IF EXISTS transfer_employee;

DELIMITER //

CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE v_employee_count INT DEFAULT 0;
    DECLARE v_department_count INT DEFAULT 0;

    -- Validate employee
    SELECT COUNT(*)
    INTO v_employee_count
    FROM Employee
    WHERE emp_id = p_emp_id;

    IF v_employee_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee does not exist';
    END IF;

    -- Validate department
    SELECT COUNT(*)
    INTO v_department_count
    FROM Department
    WHERE dept_id = p_new_dept_id;

    IF v_department_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Department does not exist';
    END IF;

    -- Transfer employee
    UPDATE Employee
    SET dept_id = p_new_dept_id
    WHERE emp_id = p_emp_id;

    SELECT 'Employee transferred successfully'
        AS result_message;
END //

DELIMITER ;

-- ============================================================
-- 5. TEST THE STORED PROCEDURE
-- Employee 101 is transferred to department 2
-- ============================================================

CALL transfer_employee(101, 2);

-- Verify transfer
SELECT emp_id, emp_name, dept_id
FROM Employee
WHERE emp_id = 101;

-- ============================================================
-- 6. TEST SALARY VALIDATION TRIGGER
-- Uncomment the following line to test the error:
-- UPDATE Employee SET salary = -5000 WHERE emp_id = 101;
-- ============================================================

-- ============================================================
-- 7. TEST SALARY AUDIT TRIGGER
-- Update salary and check the audit table
-- ============================================================

UPDATE Employee
SET salary = salary + 1000
WHERE emp_id = 101;

-- Display audit records
SELECT *
FROM Salary_Audit
ORDER BY audit_id DESC;

-- ============================================================
-- 8. TEST INVALID EMPLOYEE
-- Uncomment to test the procedure's error handling:
-- CALL transfer_employee(9999, 2);
-- ============================================================

-- ============================================================
-- 9. TEST INVALID DEPARTMENT
-- Uncomment to test the procedure's error handling:
-- CALL transfer_employee(101, 9999);
-- ============================================================

-- ============================================================
-- 10. DISPLAY EMPLOYEE AND DEPARTMENT DETAILS
-- ============================================================

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM Employee e
JOIN Department d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- ============================================================
-- END OF EXPERIMENT 6
-- ============================================================
