-- sql_commands_examples.sql
-- Generic SQL examples for main commands. Adjust for your SQL dialect if needed.

-- Note: DROP may fail if the object doesn't exist in some dialects; use DROP IF EXISTS where supported.

-- DDL: create a simple table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(200),
    email VARCHAR(255),
    created_at TIMESTAMP
);

-- DML: inserting rows
INSERT INTO customers (customer_id, name, email, created_at) VALUES
 (1, 'Alice', 'alice@example.com', CURRENT_TIMESTAMP),
 (2, 'Bob', 'bob@example.com', CURRENT_TIMESTAMP);

-- SELECT: basic query
SELECT customer_id, name, email
FROM customers
WHERE email LIKE '%@example.com'
ORDER BY customer_id;

-- UPDATE: modify rows
UPDATE customers
SET email = 'alice@company.com'
WHERE customer_id = 1;

-- DELETE: remove rows
DELETE FROM customers
WHERE customer_id = 2;

-- JOIN: two-table example
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders (order_id, customer_id, amount, order_date) VALUES
 (1, 1, 100.00, DATE('2023-01-01')),
 (2, 1, 50.00, DATE('2023-02-10'));

-- inner join
SELECT c.name, o.order_id, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- left join (customers with zero or more orders)
SELECT c.name, COUNT(o.order_id) AS orders_count, COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- GROUP BY and aggregation
SELECT customer_id, COUNT(*) AS order_count, SUM(amount) AS total
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 0;

-- Index (simple example)
CREATE INDEX idx_orders_customer ON orders(customer_id);

-- Transactions (generic)
-- Start a transaction, perform updates, then commit or rollback
-- NOTE: Use the transaction syntax your DB supports (BEGIN/START TRANSACTION, COMMIT, ROLLBACK)
BEGIN TRANSACTION;
    UPDATE customers SET name = 'Alice A.' WHERE customer_id = 1;
    -- If something goes wrong, you would ROLLBACK;
COMMIT;

-- GRANT/REVOKE (example; requires privileges and dialect support)
-- GRANT SELECT ON customers TO readonly_role;
-- REVOKE INSERT ON customers FROM some_user;

-- Cleanup (optional)
-- DROP TABLE orders;
-- DROP TABLE customers;

-- End of examples
