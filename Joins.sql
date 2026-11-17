-- started again
-- ignore thiszzz
-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
DROP TABLE orders;
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


;
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
WHERE o.status='PAID';


SELECT
 o.order_code,
 c.customer_id,
 c.city
FROM customers AS c
  RIGHT JOIN
 orders AS o
 ON  c.customer_id=o.order_id
 WHERE  c.city='Delhi';--it will remove that row but for joins we need to show every row

SELECT
 o.order_code,
 c.customer_id,
 c.city
FROM customers AS c
RIGHT JOIN
 orders AS o
 ON  c.customer_id=o.order_id
 AND c.city='Delhi';--thats why we use AND will show every row and null for specific ones

SELECT
c.customer_id,
 o.order_code,
 o.order_id,
 c.name
FROM customers AS c
LEFT JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 ;

SELECT
c.customer_id,
 o.order_code,
 o.order_id,
 c.name
FROM customers AS c
LEFT JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 WHERE order_code is NULL
 ;
 SELECT
COUNT(*)
FROM customers AS c
LEFT JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 WHERE order_code is NULL
 ;


 SELECT
c.customer_id,
 o.order_code,
 o.order_id,
 c.name
FROM customers AS c
LEFT JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 AND order_code is NULL
 ;


 --INNER JOIN
 --returns only those rows which athcing vales
 SELECT
c.customer_id,
 o.order_code,
 o.order_id,
 c.name
FROM customers AS c
INNER JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 
 ;
 SELECT
c.customer_id,
 o.order_code,
 o.order_id,
 c.name
FROM customers AS c
JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 
 ;

 SELECT
c.customer_id,
COUNT(*) AS number_of_orders
FROM customers AS c
INNER JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 GROUP BY c.customer_id
 ;

 SELECT
c.customer_id,
 o.order_code,
 o.order_id,
 o.total_amount
FROM customers AS c
INNER JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 
 ;

 SELECT
c.customer_id
,
SUM(total_amount)
FROM customers AS c
INNER JOIN
 orders AS o
 ON  c.customer_id=o.customer_id
 GROUP BY c.customer_id
 ;

 --FULL OUTER JOIN
 --RETreive all rows from all thetable
--FOR POSTGRES SQL


--  SELECT
--  COALESCE(s.student_id,p.student_id)AS student_id,
--  s.name,
--  p.amount
--  FROM student s
--  FULL OUTER JOIN payments p
--  ON p.student_id=s.student_id
--  ORDER BY student_id;


SELECT
  s.student_id,
  s.name,
  p.amount
FROM students s
LEFT JOIN payments p
  ON p.student_id = s.student_id

UNION

SELECT
  p.student_id,
  s.name,
  p.amount
FROM students s
RIGHT JOIN payments p
  ON p.student_id = s.student_id
WHERE s.student_id IS NULL;


--CROSS JOIN
-- cartesian prdt of both table


SELECT COUNT(*)

FROM customers AS city CROSS JOIN
orders AS o;

--IMPLICIT JOIN
--it behaves lke a inner join just different form to write it
--table ar e separated 

SELECT 
c.customer_id,
o.order_id 
FROM customers AS c,orders AS o
WHERE c.customer_id=o.customer_id;

SELECT 
c.customer_id,
o.order_id 
FROM customers AS c,orders AS o
;


--SELF JOIN
--a table joined with itself

CREATE TABLE orders (
  order_id        INT PRIMARY KEY,
  customer_id     INT,
  order_code      VARCHAR(10) NOT NULL,
  status          VARCHAR(20) NOT NULL,
  total_amount    DECIMAL(10,2) NOT NULL,
  placed_at_utc   DATETIME NOT NULL,
  INDEX idx_orders_customer_id (customer_id)
);

CREATE TABLE employees(
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(60) NOT NULL,
  manager_id INT NULL,
  INDEX (manager_id)
  );


INSERT INTO employees(emp_id,emp_name,manager_id)
VALUES
(1,'Kriti',NULL),
(2,'Siddhant', 1),
(3,'Anamika',1),
(4,'Utkarsh',2),
(5,'Ronit',2),
(6,'Shivi',3);


--when we want all the emlployees
SELECT
T1.emp_name AS employee_name,
T2.emp_name AS manager_name

FROM employees  AS T1
LEFT JOIN employees AS T2  
ON T1.manager_id=T2.emp_id;


--when we want values but not nul lones
SELECT
T1.emp_name AS employee_name,
T2.emp_name AS manager_name
FROM employees  AS T1
JOIN employees AS T2    
ON T1.manager_id=T2.emp_id;

SELECT

T2.emp_name AS manager_name
FROM employees  AS T1
JOIN employees AS T2    
ON T1.manager_id=T2.emp_id
GROUP BY manager_name;

SELECT
COUNT(*),
T2.emp_name AS manager_name
FROM employees  AS T1
JOIN employees AS T2    
ON T1.manager_id=T2.emp_id
GROUP BY manager_name
;


--NATURAL JOIN
--wihtout writing on

CREATE TABLE customer_loyalty(customer_id INT PRIMARY KEY,
tier VARCHAR(20) NOT NULL);
INSERT INTO customer_loyalty (customer_id, tier) VALUES
(101,'GOLD'),
(102,'SILVER'),
(104,'BRONZE'),
(106,'GOLD');
--same column name ,different value not printed- edge case

SELECT 
c.customer_id,
cl.tier
FROM customers AS c
NATURAL JOIN customer_loyalty AS cl;
>>>>>>> 74f7d7d (Updated project functionality)
