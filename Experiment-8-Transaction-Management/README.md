# Experiment 8 – Transaction Management and Concurrency Control

## Aim
To study database transaction management and demonstrate COMMIT, ROLLBACK, SAVEPOINT, transaction isolation, and concurrency control using MySQL.

## Description
A transaction is a logical unit of database work. Transaction management helps maintain data correctness when one or more operations are performed. It allows changes to be saved permanently or undone when required.

## Concepts Covered

- **COMMIT:** Permanently saves changes made in the current transaction.
- **ROLLBACK:** Cancels changes made in the current transaction.
- **SAVEPOINT:** Creates a point inside a transaction to which we can roll back.
- **Transaction Isolation:** Controls how transactions interact with one another.
- **Concurrency Control:** Coordinates simultaneous access to shared database records.

## Database and Table

Database: `TransactionLab`

Table: `Account`

| account_id | account_holder | Initial balance |
|---|---|---:|
| 101 | Amit | 10000.00 |
| 102 | Neha | 8000.00 |
| 103 | Rahul | 5000.00 |

## Software Required

- MySQL Server
- MySQL Workbench

## How to Run

1. Open MySQL Workbench and connect to your MySQL server.
2. Open `experiment_8.sql`.
3. Execute the complete SQL script.
4. Observe the account balances after each transaction.
5. For the concurrency demonstration, open two separate MySQL sessions:
   - In Session 1, execute `START TRANSACTION;` and `SELECT * FROM Account WHERE account_id = 101 FOR UPDATE;`.
   - Keep Session 1 open without committing.
   - In Session 2, execute the UPDATE statement provided in the SQL comments.
   - Return to Session 1 and execute `COMMIT;`.
   - Observe that Session 2 can now continue.

## Expected Observations

- COMMIT permanently saves the fund transfer.
- ROLLBACK cancels the uncommitted balance deduction.
- SAVEPOINT allows partial rollback within a transaction.
- The InnoDB row lock prevents another session from updating the locked row until the first transaction finishes.

## Output Screenshots

Add your screenshots below after executing the experiment:

1. Initial Account table.
2. Account balances after COMMIT.
3. Account balances after ROLLBACK.
4. Account balances after SAVEPOINT operation.
5. Two-session row-locking demonstration.

## Result

Transaction control statements and basic concurrency control were successfully demonstrated using MySQL.

## Precautions

- Use the InnoDB storage engine because it supports transactions and row-level locking.
- Execute COMMIT and ROLLBACK carefully.
- Run the concurrency demonstration using two separate sessions.
- Execute the database setup section before performing transactions.
