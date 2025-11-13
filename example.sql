-- Hardcoded password in script
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';

-- Missing WHERE clause (dangerous update/delete)
UPDATE users SET status = 'inactive';
DELETE FROM logs;

-- SQL injection vulnerable stored procedure
DELIMITER //
CREATE PROCEDURE get_user(IN username VARCHAR(50))
BEGIN
    SET @query = CONCAT('SELECT * FROM users WHERE username = "', username, '"');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- Using SELECT * instead of specific columns
SELECT * FROM users;

-- Missing index on frequently queried column
CREATE TABLE orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    status VARCHAR(20)
);
-- Missing: CREATE INDEX idx_user_id ON orders(user_id);

-- Not using transactions for related operations
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;

-- Storing sensitive data without encryption
CREATE TABLE user_data (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),  -- Storing plain text password
    credit_card VARCHAR(16)  -- Storing plain text credit card
);

-- Using weak password policy
ALTER USER 'user'@'localhost' IDENTIFIED BY '123';

-- Granting excessive privileges
GRANT ALL PRIVILEGES ON *.* TO 'app_user'@'%';

-- Not using prepared statements pattern (shown in dynamic SQL above)

-- Missing foreign key constraints
CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,  -- No foreign key to orders table
    product_id INT,  -- No foreign key to products table
    quantity INT
);

-- Inefficient query with subquery in SELECT
SELECT 
    u.id,
    u.name,
    (SELECT COUNT(*) FROM orders WHERE user_id = u.id) as order_count
FROM users u;

-- Using deprecated features or syntax
-- Example: Using old JOIN syntax
SELECT u.name, o.order_id
FROM users u, orders o
WHERE u.id = o.user_id;  -- Should use INNER JOIN

-- Unused column or table
ALTER TABLE users ADD COLUMN unused_field VARCHAR(100);

-- Missing constraints
CREATE TABLE products (
    id INT,
    name VARCHAR(100),
    price DECIMAL(10,2)
    -- Missing: NOT NULL constraints, CHECK constraints
);
