# Experiment 9 – Railway Booking Database: Indexing and Performance Benchmarking

## Aim
To implement a railway booking database and study how indexes improve SQL query performance using MySQL.

## Description
Database indexing is a technique used to speed up data retrieval. An index allows the database to locate records without scanning the entire table.

In this experiment, a railway booking database is created with train, passenger, and booking information. Queries are executed before and after creating indexes, and their execution plans are compared using EXPLAIN.

## Concepts Covered

- **Index:** A database structure that improves data retrieval speed.
- **Primary Key Index:** An index automatically created for a primary key.
- **Secondary Index:** An additional index created on one or more columns.
- **Composite Index:** An index created using multiple columns.
- **EXPLAIN:** Displays the execution plan selected by MySQL.
- **Performance Benchmarking:** Comparing query execution plans and execution times.

## Database Design

Database: `RailwayLab`

Tables:
- `Train`: Stores train details.
- `Passenger`: Stores passenger details.
- `Booking`: Stores ticket booking information.

## Software Required

- MySQL Server
- MySQL Workbench

## How to Run

1. Open MySQL Workbench and connect to MySQL Server.
2. Open `experiment_9.sql`.
3. Execute the complete SQL script.
4. Observe the results of the queries before and after indexing.
5. Compare the execution plans using EXPLAIN.
6. Note the differences in the access method and rows examined.

## Expected Observations

- Queries without suitable indexes may perform full table scans.
- Indexes can help MySQL locate matching records more efficiently.
- Composite indexes are useful when queries filter using multiple columns in the appropriate order.
- EXPLAIN helps identify whether an index is being used.
- Indexes improve read performance but require additional storage and can add overhead to INSERT, UPDATE, and DELETE operations.

## Output Screenshots

Add your screenshots below after executing the experiment:

1. Train, Passenger, and Booking tables.
2. Query execution plan before indexing.
3. Index creation commands.
4. Query execution plan after indexing.
5. Final query results.

## Result

A railway booking database was implemented, indexes were created, and query execution plans were compared to study the impact of indexing on database performance.

## Precautions

- Create indexes only on columns frequently used in filtering, joining, or sorting.
- Avoid creating unnecessary indexes.
- Use EXPLAIN to verify index usage.
- Compare equivalent queries before and after indexing.
- Remember that indexes require additional storage and maintenance.
