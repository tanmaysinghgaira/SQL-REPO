SQL example files (15 short examples total)

Files created in `sql_examples/`:
- `basics_select.sql` — 5 SELECT examples (CREATE Employees, WHERE, ORDER BY, DISTINCT, expressions)
- `joins_and_aggregation.sql` — 5 examples for JOINs and aggregation (Customers + Orders)
- `dml_and_ddl.sql` — 5 examples for DDL/DML (Products table: CREATE, INSERT, UPDATE, DELETE, ALTER)

How to run (Windows PowerShell) using sqlite3 (recommended for portability):

1) If you don't have sqlite3, download from https://www.sqlite.org/download.html and put `sqlite3.exe` on your PATH or in the repo folder.

2) Open PowerShell in the repo root and run the files against a local database file (examples.db):

```powershell
# create or open examples.db and run one SQL file
sqlite3.exe .\examples.db ".read .\sql_examples\basics_select.sql"
# then open sqlite and inspect results interactively
sqlite3.exe .\examples.db
# inside sqlite prompt, run queries like:
# SELECT * FROM Employees;
# .tables
```

Alternatively run each file in sequence to populate the same database:

```powershell
sqlite3.exe .\examples.db ".read .\sql_examples\basics_select.sql"
sqlite3.exe .\examples.db ".read .\sql_examples\joins_and_aggregation.sql"
sqlite3.exe .\examples.db ".read .\sql_examples\dml_and_ddl.sql"
```

Notes:
- SQL dialect differences: the examples use standard SQL and are tested with SQLite syntax (e.g., LIMIT, ROUND, || for concatenation). Minor changes may be necessary for other RDBMS (SQL Server, MySQL, PostgreSQL).
- These files include CREATE TABLE statements and INSERTs: run them into a new database to avoid conflicts.

Want more examples (transactions, indexes, views, stored procedures) or to target a specific RDBMS? Tell me which one and I'll add a matching set.