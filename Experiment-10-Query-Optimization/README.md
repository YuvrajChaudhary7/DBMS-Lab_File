# Experiment 10 – SQL Query Optimization and Execution Plan Analysis

## Aim
To study SQL query optimization techniques and analyze query execution plans using MySQL EXPLAIN and EXPLAIN ANALYZE.

## Description
Query optimization is the process of improving SQL queries so that they execute efficiently and use fewer database resources.

MySQL uses a query optimizer to select an execution plan for retrieving data. In this experiment, different SQL queries are executed and optimized using indexes, filtering, joins, and execution plan analysis.

## Concepts Covered

- **Query Optimization:** Improving SQL query performance.
- **EXPLAIN:** Displays the execution plan chosen by MySQL.
- **EXPLAIN ANALYZE:** Executes a query and displays actual execution statistics (supported in MySQL 8.0.18 and later).
- **Indexing:** Helps retrieve records efficiently.
- **Filtering:** Reduces unnecessary rows using WHERE conditions.
- **JOIN Optimization:** Improves queries involving multiple tables.
- **Query Cost:** An estimate of the resources required by a query.

## Database Design

Database: `OptimizationLab`

Tables:
- `Department`: Stores department information.
- `Employee`: Stores employee information.
- `Project`: Stores project information.

## Software Required

- MySQL Server 8.0
- MySQL Workbench

## How to Run

1. Open MySQL Workbench.
2. Connect to your MySQL Server.
3. Open `experiment_10.sql`.
4. Execute the complete SQL script.
5. Observe the execution plans using EXPLAIN.
6. Compare query plans before and after indexing.
7. If supported, execute EXPLAIN ANALYZE to inspect actual execution statistics.

## Expected Observations

- EXPLAIN displays how MySQL plans to execute a query.
- Indexes can reduce the number of rows examined.
- Filtering unnecessary records improves query efficiency.
- JOIN conditions should use appropriate keys.
- EXPLAIN ANALYZE provides actual execution time and row statistics.
- The optimizer may choose a table scan when it estimates that scanning is cheaper.

## Output Screenshots

Add your screenshots below after executing the experiment:

1. Initial database tables.
2. EXPLAIN output before optimization.
3. Index creation commands.
4. EXPLAIN output after optimization.
5. EXPLAIN ANALYZE output.
6. Optimized JOIN query result.

## Result

SQL query optimization techniques were studied and execution plans were analyzed using MySQL EXPLAIN and EXPLAIN ANALYZE.

## Precautions

- Use the correct database before executing queries.
- Create indexes only where they are useful.
- Compare equivalent queries before and after optimization.
- Do not assume that every index will improve every query.
- EXPLAIN ANALYZE executes the query, so use it carefully with data-changing statements.
