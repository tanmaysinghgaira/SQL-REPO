# New files added

This file lists the new files created by the assistant and a short note on how to use them.

## Basic Examples
- `sql_examples/example_new.sql`
  - A small, self-contained SQL example demonstrating a LEFT JOIN plus aggregation (total spent per customer).
  - It contains CREATE TABLE statements and a few INSERT statements (SQLite-friendly syntax).
  - To try it locally, you can use sqlite3 or any SQL tool that understands basic SQL. For sqlite3:

    sqlite3 test.db ".read sql_examples/example_new.sql"

  - The final SELECT returns one row per customer with order count and total spent.

## Advanced Examples (SQL Server syntax)

- `sql_examples/window_functions.sql`
  - Demonstrates various window functions like ROW_NUMBER, RANK, DENSE_RANK
  - Shows running totals and moving averages
  - Includes partitioning and different window frame specifications

- `sql_examples/stored_procedures.sql`
  - Examples of creating and using stored procedures
  - Includes error handling and transactions
  - Shows parameter usage and return values

- `sql_examples/index_optimization.sql`
  - Shows different types of SQL Server indexes
  - Demonstrates when to use each type of index
  - Includes examples of analyzing index usage

These examples use SQL Server syntax. To run them:
1. Open in SQL Server Management Studio (SSMS) or Azure Data Studio
2. Connect to your SQL Server instance
3. Execute the scripts in order

If you'd like more examples (different SQL dialects, specific features) or have questions about the existing ones, just ask!