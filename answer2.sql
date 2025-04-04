DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    age INT
);
SHOW TABLES;

INSERT INTO users (name, email, age) VALUES
('Alice', 'alice@whatif.com', 25),
('Bob', 'bob@gmail.com', 30),
('Charlie', 'charlie@gmail.com', 22),
('Prolly Spikes', 'prollyspikes@gmail.com', 18);

CREATE TABLE IF NOT EXISTS payments (
    checkNumber VARCHAR(50) PRIMARY KEY,
    paymentDate DATE,
    amount DECIMAL(10,2)
);

INSERT INTO payments (checkNumber, paymentDate, amount)
SELECT 'CHK001', '2024-03-25', 500.00
WHERE NOT EXISTS (SELECT 1 FROM payments WHERE checkNumber = 'CHK001');

INSERT INTO payments (checkNumber, paymentDate, amount)
SELECT 'CHK002', '2024-03-26', 750.00
WHERE NOT EXISTS (SELECT 1 FROM payments WHERE checkNumber = 'CHK002');

SELECT checkNumber, paymentDate, amount FROM payments;

CREATE TABLE IF NOT EXISTS orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    orderDate DATE,
    requiredDate DATE,
    status VARCHAR(50)
);

INSERT INTO orders (orderDate, requiredDate, status)
SELECT '2024-03-20', '2024-03-25', 'In Process'
WHERE NOT EXISTS (SELECT 1 FROM orders WHERE status = 'In Process' LIMIT 1);

SELECT orderDate, requiredDate, status FROM orders WHERE status = 'In Process' ORDER BY orderDate DESC;

CREATE TABLE IF NOT EXISTS employees (
    employeeNumber INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    email VARCHAR(100),
    jobTitle VARCHAR(100)
);

INSERT INTO employees (firstName, lastName, email, jobTitle)
SELECT 'John', 'Doe', 'john.doe@email.com', 'Sales Rep'
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE jobTitle = 'Sales Rep' LIMIT 1);

SELECT firstName, lastName, email FROM employees WHERE jobTitle = 'Sales Rep' ORDER BY employeeNumber DESC;

 CREATE TABLE IF NOT EXISTS offices (
    officeID INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100),
    country VARCHAR(100)
);

SELECT * FROM offices;

CREATE TABLE IF NOT EXISTS products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100),
    quantityInStock INT,
    buyPrice DECIMAL(10,2)
);

INSERT INTO products (productName, quantityInStock, buyPrice)
SELECT 'Laptop', 50, 1200.00
WHERE NOT EXISTS (SELECT 1 FROM products LIMIT 1);

SELECT productName, quantityInStock FROM products ORDER BY buyPrice ASC LIMIT 5;
