# DBMS Laboratory Experiments

A structured collection of Database Management System (DBMS) laboratory experiments covering database design, SQL queries, normalization, transaction management, indexing, and query optimization.

## 📌 Overview

This repository contains practical documentation and SQL source code for DBMS laboratory work. It covers ten experiments, ranging from ER diagram design and relational schema mapping to advanced SQL concepts, transaction management, and query optimization.

Each experiment includes PDF documentation and, where applicable, executable SQL source code.

## 📚 Experiment Index

| No. | Experiment | Documentation | SQL Source |
|---|---|---|---|
| 1 | ER Diagram for an Indian E-Commerce Platform | [View PDF](Experiment-1-ER-Diagram/Experiment_1_ER_Diagram.pdf) | — |
| 2 | ER-to-Relational Schema Mapping | [View PDF](Experiment-2-Relational-Schema/Experiment_2_Relational_Schema_MySQL.pdf) | — |
| 3 | SQL Queries Using Employee, Department, and Project Databases | [View PDF](Experiment-3-SQL-Queries/Experiment-3-Employee-Queries.pdf) | [View SQL](Experiment-3-SQL-Queries/experiment_3.sql) |
| 4 | SQL Joins, Subqueries, Set Operations, and EXPLAIN | [View PDF](Experiment-4-Joins-Subqueries/Experiment-4-Joins-Subqueries.pdf) | [View SQL](Experiment-4-Joins-Subqueries/experiment_4.sql) |
| 5 | Views, Employee Hierarchies, and Recursive CTEs | [View PDF](Experiment-5-Views-CTEs/Experiment-5-Views-CTE.pdf) | [View SQL](Experiment-5-Views-CTEs/experiment_5.sql) |
| 6 | Stored Procedures, Triggers, and Audit Logging | [View PDF](Experiment-6-Procedures-Triggers/Experiment-6-Procedures-Triggers.pdf) | [View SQL](Experiment-6-Procedures-Triggers/experiment_6.sql) |
| 7 | Database Normalization: UNF to BCNF | [View PDF](Experiment-7-Database-Normalization/Experiment-7-Database-Normalization.pdf) | [View SQL](Experiment-7-Database-Normalization/experiment_7.sql) |
| 8 | Transaction Management and Concurrency Control | [View PDF](Experiment-8-Transaction-Management/Experiment-8-Transaction-Management.pdf) | [View SQL](Experiment-8-Transaction-Management/experiment_8.sql) |
| 9 | Railway Booking Database: Indexing and Performance Benchmarking | [View PDF](Experiment-9-Railway-Booking-Indexing/Experiment-9-Railway-Booking-Indexing.pdf) | [View SQL](Experiment-9-Railway-Booking-Indexing/experiment_9.sql) |
| 10 | SQL Query Optimization and Execution Plan Analysis | [View PDF](Experiment-10-Query-Optimization/Experiment-10-Query-Optimization.pdf) | [View SQL](Experiment-10-Query-Optimization/experiment_10.sql) |

## 🛠️ Tools and Technologies

- **MySQL** — Relational database management and SQL execution.
- **MySQL Workbench** — Database creation, query execution, and result analysis.
- **Visual Studio Code** — SQL editing and source-code management.
- **Git and GitHub** — Version control and repository hosting.
- **PDF Documentation** — Practical descriptions, procedures, and output screenshots.

## ▶️ Execution Guide

1. Install and configure MySQL Server.
2. Open the relevant `.sql` file in MySQL Workbench or another MySQL-compatible SQL client.
3. Read the experiment-specific README for prerequisites and execution instructions.
4. Run Experiment 3 before Experiments 4–6 if using their shared Employee, Department, and Project database setup.
5. Experiments 7–10 create their own databases and sample tables.
6. Use a test database when executing scripts that modify records, create indexes, or define stored procedures and triggers.
7. Capture the required output screenshots and include them in the corresponding practical documentation.

### Compatibility

- Recursive CTEs require MySQL 8.0 or later.
- Transaction and row-level locking demonstrations use the InnoDB storage engine.
- `EXPLAIN ANALYZE` requires MySQL 8.0.18 or later.

## 📁 Repository Structure

```text
DBMS-Lab_File/
│
├── README.md
│
├── Experiment-1-ER-Diagram/
│   └── Experiment_1_ER_Diagram.pdf
│
├── Experiment-2-Relational-Schema/
│   └── Experiment_2_Relational_Schema_MySQL.pdf
│
├── Experiment-3-SQL-Queries/
│   ├── Experiment-3-Employee-Queries.pdf
│   ├── README.md
│   └── experiment_3.sql
│
├── Experiment-4-Joins-Subqueries/
│   ├── Experiment-4-Joins-Subqueries.pdf
│   ├── README.md
│   └── experiment_4.sql
│
├── Experiment-5-Views-CTEs/
│   ├── Experiment-5-Views-CTE.pdf
│   ├── README.md
│   └── experiment_5.sql
│
├── Experiment-6-Procedures-Triggers/
│   ├── Experiment-6-Procedures-Triggers.pdf
│   ├── README.md
│   └── experiment_6.sql
│
├── Experiment-7-Database-Normalization/
│   ├── Experiment-7-Database-Normalization.pdf
│   ├── README.md
│   └── experiment_7.sql
│
├── Experiment-8-Transaction-Management/
│   ├── Experiment-8-Transaction-Management.pdf
│   ├── README.md
│   └── experiment_8.sql
│
├── Experiment-9-Railway-Booking-Indexing/
│   ├── Experiment-9-Railway-Booking-Indexing.pdf
│   ├── README.md
│   └── experiment_9.sql
│
└── Experiment-10-Query-Optimization/
    ├── Experiment-10-Query-Optimization.pdf
    ├── README.md
    └── experiment_10.sql
```

## 🎯 Learning Objectives

- Design ER diagrams and relational schemas.
- Implement primary keys, foreign keys, and integrity constraints.
- Retrieve and analyze data using SQL queries.
- Apply joins, subqueries, views, stored procedures, and triggers.
- Understand database normalization and functional dependencies.
- Implement transactions and concurrency control.
- Create indexes and analyze query performance.
- Optimize SQL queries using execution plans.

## 👨‍💻 Author

**Yuvraj Chaudhary**

GitHub: [YuvrajChaudhary7](https://github.com/YuvrajChaudhary7)

---

*Maintained for academic learning and DBMS laboratory practice.*
