# DBMS Laboratory Experiments

A structured collection of Database Management System (DBMS) laboratory experiments covering database design, SQL queries, normalization, transactions, and query optimization.

## 📌 Overview

This repository contains practical documentation and SQL source code for DBMS laboratory work. Experiments 1 and 2 are maintained in PDF format, while Experiments 3–6 include SQL scripts and supporting PDF documentation.

## 📚 Experiment Index

| No. | Experiment | Documentation | SQL Source |
|---|---|---|---|
| 1 | ER Diagram for an Indian E-Commerce Platform | [View PDF](Experiment-1-ER-Diagram/Experiment_1_ER_Diagram.pdf) | — |
| 2 | ER-to-Relational Schema Mapping | [View PDF](Experiment-2-Relational-Schema/Experiment_2_Relational_Schema_MySQL.pdf) | — |
| 3 | SQL Queries Using Employee, Department, and Project Databases | [View PDF](Experiment-3-SQL-Queries/Experiment-3-Employee-Queries.pdf) | [View SQL](Experiment-3-SQL-Queries/experiment_3.sql) |
| 4 | SQL Joins, Subqueries, Set Operations, and EXPLAIN | [View PDF](Experiment-4-Joins-Subqueries/Experiment-4-Joins-Subqueries.pdf) | [View SQL](Experiment-4-Joins-Subqueries/experiment_4.sql) |
| 5 | Views, Employee Hierarchies, and Recursive CTEs | [View PDF](Experiment-5-Views-CTEs/Experiment-5-Views-CTE.pdf) | [View SQL](Experiment-5-Views-CTEs/experiment_5.sql) |
| 6 | Stored Procedures, Triggers, and Audit Logging | [View PDF](Experiment-6-Procedures-Triggers/Experiment-6-Procedures-Triggers.pdf) | [View SQL](Experiment-6-Procedures-Triggers/experiment_6.sql) |
| 7 | Database Normalization: UNF to BCNF | Planned | — |
| 8 | Transaction Management and Concurrency Control | Planned | — |
| 9 | Railway Booking Database: Indexing and Performance Benchmarking | Planned | — |
| 10 | SQL Query Optimization and Execution Plan Analysis | Planned | — |

## 🛠️ Tools and Technologies

- **MySQL** — relational database management and SQL execution
- **Visual Studio Code** — SQL editing and source-code management
- **Git and GitHub** — version control and repository hosting
- **PDF documentation** — practical descriptions and supporting material

## ▶️ Execution Guide

1. Install and configure MySQL Server.
2. Open the relevant `.sql` file in MySQL Workbench or another MySQL-compatible SQL client.
3. Follow the prerequisites documented in each experiment.
4. Run Experiment 3 before Experiments 4–6, since these scripts use the database and tables created by Experiment 3.
5. Use a test database when executing scripts that modify records, add triggers, or create stored procedures.

**Compatibility:** Recursive CTEs require MySQL 8.0 or later. `EXPLAIN ANALYZE` requires MySQL 8.0.18 or later.

## 📁 Repository Structure

```text
DBMS-Lab_File/
├── README.md
├── Experiment-1-ER-Diagram/
├── Experiment-2-Relational-Schema/
├── Experiment-3-SQL-Queries/
├── Experiment-4-Joins-Subqueries/
├── Experiment-5-Views-CTEs/
└── Experiment-6-Procedures-Triggers/
```

Each experiment folder contains its documentation and, where applicable, its SQL source file.

## 🎯 Learning Objectives

- Design ER diagrams and relational schemas.
- Implement primary keys, foreign keys, and integrity constraints.
- Retrieve and analyze data using SQL queries.
- Apply joins, subqueries, views, stored procedures, and triggers.
- Understand normalization, transactions, indexing, and query optimization.

## 👨‍💻 Author

**Yuvraj Chaudhary**

GitHub: [YuvrajChaudhary7](https://github.com/YuvrajChaudhary7)

---

*Maintained for academic learning and DBMS laboratory practice.*