# SQL Commands — Overview

This page explains the main categories of SQL commands and shows short, generic examples. SQL dialects (MySQL, PostgreSQL, SQL Server, SQLite, Oracle) differ in small ways — where relevant the notes call out common differences.

Categories

- DDL (Data Definition Language)
  - Purpose: define or modify database schema (tables, indexes, schemas)
  - Common commands: CREATE, ALTER, DROP, TRUNCATE
  - Example: CREATE TABLE users (id INT PRIMARY KEY, name TEXT);
  - Dialect notes: `CREATE TABLE IF NOT EXISTS` is supported by SQLite, MySQL, PostgreSQL; SQL Server added similar behavior later and has different syntax for conditional creation.

- DML (Data Manipulation Language)
  - Purpose: query and modify data rows
  - Common commands: SELECT, INSERT, UPDATE, DELETE, MERGE
  - Example: INSERT INTO users (id, name) VALUES (1, 'Alice');
  - Notes: `INSERT ... ON CONFLICT` / `INSERT ... ON DUPLICATE KEY UPDATE` are dialect-specific (Postgres vs MySQL). SQL Server uses MERGE or upsert patterns.

- DCL (Data Control Language)
  - Purpose: control access and privileges
  - Common commands: GRANT, REVOKE
  - Example: GRANT SELECT ON users TO reporting_role;
  - Notes: Privilege models vary significantly between systems and cloud-managed DBs.

- TCL (Transaction Control Language)
  - Purpose: control transaction boundaries
  - Common commands: BEGIN/START TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT
  - Example: BEGIN; UPDATE accounts SET balance = balance - 100 WHERE id = 1; COMMIT;
  - Notes: SQL Server often uses `BEGIN TRANSACTION` / `COMMIT TRANSACTION` and has TRY/CATCH blocks for error handling.

Other useful items

- Indexes: CREATE INDEX idx_name ON table(column); — helps performance for lookups and JOINs. Syntax and options (covering, partial/filtered, expression indexes) differ by dialect.
- Views: CREATE VIEW v AS SELECT ...; — reusable named queries.
- Stored code: Functions and procedures — language and syntax vary (PL/pgSQL, T-SQL, PL/SQL).
- Window functions: OVER(...), ROW_NUMBER(), RANK(), SUM() OVER(...) — useful for running totals, ranking within partitions.

Best practices (short)

- Use transactions for multi-statement updates that must be atomic.
- Prefer parameterized queries in application code to avoid SQL injection.
- Add indexes for frequently queried columns, but watch for insert/update overhead.
- Use LIMIT/OFFSET (or database-specific paging) to avoid returning huge result sets at once.

Running the examples

- The file `sql_commands_examples.sql` next to this file contains plain examples you can run after adjusting for your SQL dialect.

Example commands to try (optional):

- sqlite3 (SQLite):

```powershell
sqlite3 test.db ".read sql_examples/sql_commands_examples.sql"
```

- psql (PostgreSQL):

```powershell
psql -d yourdb -f sql_examples/sql_commands_examples.sql
```

If you'd like, I can:
- Add dialect-specific versions (MySQL/Postgres/SQL Server)
- Expand each section with more examples and common pitfalls
- Produce a short quick-reference cheat-sheet PDF or printable file

Tell me which option you prefer and I'll continue.