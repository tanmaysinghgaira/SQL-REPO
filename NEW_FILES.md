# New files added

This file lists the new files created by the assistant and a short note on how to use them.

- `sql_examples/example_new.sql`
  - A small, self-contained SQL example demonstrating a LEFT JOIN plus aggregation (total spent per customer).
  - It contains CREATE TABLE statements and a few INSERT statements (SQLite-friendly syntax).
  - To try it locally, you can use sqlite3 or any SQL tool that understands basic SQL. For sqlite3:

    sqlite3 test.db ".read sql_examples/example_new.sql"

  - The final SELECT returns one row per customer with order count and total spent.

If you'd like more files (different examples, other SQL dialects, or unit tests), tell me which dialect or purpose and I'll add them.