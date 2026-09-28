-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
CREATE TABLE customers (
  customer_id     INT PRIMARY KEY,
  name            VARCHAR(50) NOT NULL,
  email           VARCHAR(120),
  city            VARCHAR(60),
  signup_at_utc   DATETIME
);

CREATE TABLE orders (
  order_id        INT PRIMARY KEY,
  customer_id     INT,
  order_code      VARCHAR(10) NOT NULL,
  status          VARCHAR(20) NOT NULL,
  total_amount    DECIMAL(10,2) NOT NULL,
  placed_at_utc   DATETIME NOT NULL,
  INDEX idx_orders_customer_id (customer_id)
);

INSERT INTO customers (customer_id, name, email, city, signup_at_utc) VALUES
(101, 'Aisha',  'aisha@demo.com',  'Delhi',     '2026-01-01 10:00:00'),
(102, 'Rohan',  'rohan@demo.com',  'Mumbai',    '2026-01-02 11:00:00'),
(103, 'Meera',  'meera@demo.com',  NULL,        '2026-01-03 12:00:00'),
(104, 'Arjun',  'arjun@demo.com',  'Delhi',     '2026-01-04 13:00:00'),
(106, 'Neha',   'neha@demo.com',   'Pune',      '2026-01-05 09:30:00'),
(107, 'Ishaan', 'ishaan@demo.com', 'Bengaluru', '2026-01-06 18:10:00'),
(108, 'Riya',   NULL,              'Delhi',     '2026-01-07 07:45:00'),
(109, 'Aisha',  'aisha2@demo.com', 'Jaipur',    '2026-01-08 20:00:00');

INSERT INTO orders (order_id, customer_id, order_code, status, total_amount, placed_at_utc) VALUES
(1, 101, 'A', 'PAID',      499.00, '2026-01-10 10:00:00'),
(2, 102, 'B', 'PAID',      299.00, '2026-01-10 11:00:00'),
(3, 105, 'C', 'PAID',      199.00, '2026-01-10 12:00:00'),
(4, 101, 'D', 'CANCELLED', 999.00, '2026-01-11 09:00:00'),
(5, 106, 'E', 'PAID',      799.00, '2026-01-11 10:30:00'),
(6, 106, 'F', 'PENDING',   149.00, '2026-01-12 08:20:00'),
(7, NULL,'G', 'PAID',      249.00, '2026-01-12 09:10:00'),
(8, 999, 'H', 'PAID',      129.00, '2026-01-12 15:40:00');

 SELECT

o.order_id,
o.order_code,
c.customer_id,
c.name
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.customer_id=o.customer_id


SELECT

o.order_id,
o.order_code,
o.customer_id,
c.name
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.customer_id=o.customer_id

SELECT

o.order_id,
o.order_code,
c.customer_id,
c.name,
c.city,
o.status
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.customer_id=o.customer_id
WHERE o.status='PAID'