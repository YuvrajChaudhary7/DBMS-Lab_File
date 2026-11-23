
CREATE DATABASE IF NOT EXISTS TransactionLab;
USE TransactionLab;

DROP TABLE IF EXISTS Account;

CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
) ENGINE = InnoDB;

INSERT INTO Account VALUES
(101, 'Amit', 10000.00),
(102, 'Neha', 8000.00),
(103, 'Rahul', 5000.00);

-- Display initial balances
SELECT * FROM Account;

-- Transaction 1: COMMIT
START TRANSACTION;

UPDATE Account
SET balance = balance - 2000
WHERE account_id = 101;

UPDATE Account
SET balance = balance + 2000
WHERE account_id = 102;

COMMIT;

SELECT * FROM Account;

-- Transaction 2: ROLLBACK
START TRANSACTION;

UPDATE Account
SET balance = balance - 1000
WHERE account_id = 103;

ROLLBACK;

SELECT * FROM Account;

-- Transaction 3: SAVEPOINT
START TRANSACTION;

UPDATE Account
SET balance = balance - 500
WHERE account_id = 101;

SAVEPOINT sp_after_debit;

UPDATE Account
SET balance = balance + 500
WHERE account_id = 103;

ROLLBACK TO SAVEPOINT sp_after_debit;

COMMIT;

SELECT * FROM Account;

-- Transaction 4: Isolation Level
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT * FROM Account
WHERE account_id = 101;

COMMIT;

-- Concurrency Control Demonstration
-- Run the following commands in TWO separate MySQL sessions.

-- SESSION 1:
-- START TRANSACTION;
-- SELECT * FROM Account
-- WHERE account_id = 101 FOR UPDATE;

-- Keep Session 1 open without COMMIT.

-- SESSION 2:
-- UPDATE Account
-- SET balance = balance - 100
-- WHERE account_id = 101;

-- The Session 2 UPDATE waits until Session 1 commits or rolls back.

-- In SESSION 1:
-- COMMIT;

-- Final account details
SELECT * FROM Account;
