-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
--CASE EXPRESSIONS
-- CASE expressions is SQL’s way of writing if / else logic inside a query.
--It is not a statemnent it is an expression 
--coz it returns a value
--it can be used in order ,when etc
SET @temp_age=17
-- hehehhehehehehhehehe ignore
SELECT 
 CASE
 WHEN @temp_age>=18 THEN 'Adult'
 ELSE 'Not an Adult'
 END AS 'result'

 CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  price      INT NULL
);

INSERT INTO products (product_id, name, price) VALUES
  (1,  'Laptop Sleeve',        18),
  (2,  'Wireless Mouse',       32),
  (3,  'Keyboard',             55),
  (4,  'Monitor',              150),
  (5,  'USB Cable',            8),
  (6,  'Webcam',               60),
  (7,  'HDMI Cable',           20),
  (8,  'Mechanical Keyboard',  120),
  (9,  'Sticker Pack',         0),
  (10, 'Gift Card',            19),
  (11, 'Mystery Box',          NULL),
  (12, 'Refurb Monitor',       61);

SELECT product_id,
name,
price,
CASE
WHEN price IS NULL THEN 'Misiing Price'
 WHEN price<=20 THEN 'Budget'
WHEN price >20 AND price<=100 THEN 'Mid range'
WHEN price>100 THEN 'Premium'
END AS price_category
 FROM products
--ELSE is not mandatory name
--but not END


CREATE TABLE rules (
  rule_id INT PRIMARY KEY,
  value   INT
);

INSERT INTO rules (rule_id, value) VALUES
  (1, 75),
  (2, 40),
  (3, 60),
  (4, NULL),
  (5, 95),
  (6, 59),
  (7, 0),
  (8, 61);

SELECT rule_id,
value,
CASE
WHEN value IS NULL THEN 'Missing'
WHEN value >=40 THEN'PASS'
ELSE 'FAIL'
END
FROM rules;

SELECT
  NULL = NULL     AS eq_null_null,     -- NULL (unknown)
  NULL <=> NULL   AS nullsafe_eq,      -- 1 (true) NULL saftey EQUALITY operator
  NULL = 5        AS eq_null_5,        -- NULL (unknown)
  NULL <=> 5      AS nullsafe_eq_5,    -- 0 (false)
  (NULL >= 60)    AS ge_null_60;       -- NULL (unknown)

  CREATE TABLE users (
  user_id  INT PRIMARY KEY,
  username VARCHAR(60) NULL,
  INDEX idx_users_username (username)
);
DROP TABLE users;
INSERT INTO users (user_id, username) VALUES
  (1, 'Pro_User'),
  (2, 'guest123'),
  (3, 'PRO_member'),
  (4, 'ProXUser'),
  (5, 'pro_user99'),
  (6, ' Pro_User '),
  (7, ''),
  (8, NULL);


SELECT user_id,
CASE WHEN username<=> NULL THEN'Not filled'
WHEN username ='' THEN 'Empty'
ELSE username
END AS username
FROM users;


CREATE TABLE employees (
  emp_id            INT PRIMARY KEY,
  salary            INT NOT NULL,
  performance_score INT NULL
);
DROP TABLE employees;
INSERT INTO employees (emp_id, salary, performance_score) VALUES
  (101, 50000, 90),
  (102, 45000, NULL),
  (103, 60000, 74),
  (104, 70000, 75),
  (105, 80000, 89),
  (106, 0,     92),
  (107, 52000, 100),
  (108, 50000, 0),
  (109, 45000, 85),
  (110, 40000, NULL);

  SELECT emp_id,salary,
 
  CASE WHEN performance_score IS NULL THEN 0
   WHEN performance_score>=90 THEN salary*0.2
   WHEN performance_score>=75 THEN salary*0.1
   ELSE salary*0.5
   END AS bonus_amt
    FROM employees;



    -- Node classification
    CREATE TABLE nodes (
  node_id   INT PRIMARY KEY,
  parent_id INT NULL,
  INDEX idx_nodes_parent_id (parent_id)
);

INSERT INTO nodes (node_id, parent_id) VALUES
  (1,  NULL),
  (2,  1),
  (3,  2),
  (4,  1),
  (5,  4),
  (6,  4),
  (7,  6),
  (8,  NULL),
  (9,  8),
  (10, 8),
  (11, 10),
  (12, 10);

--   Classify nodes based on parent relationships

-- In a tree structure:
-- ROOT: a node with no parent (parent_id IS NULL)
-- INTERNAL: a node that has at least one child
-- LEAF: a node that has no children
SELECT node_id,
parent_id,
CASE
 WHEN parent_id IS NULL THEN 'Root'
WHEN NOT EXISTS (SELECT 1 FROM nodes n2 WHERE n1.node_id=n2.parent_id)THEN 'Leaf' 
ELSE 'Internal'
END  as node_type

FROM nodes as n1;


--Conditonal  Aggregration
--it has aggregation whole using case

CREATE TABLE  sales (
  item     VARCHAR(30) NOT NULL,
  quantity INT NULL
);

INSERT INTO sales (item, quantity) VALUES
  ('apple',  10),
  ('orange', 7),
  ('apple',  5),
  ('banana', 3),
  ('mango',  2),
  ('apple',  NULL),
  ('orange', NULL);


SELECT
SUM(CASE WHEN item='orange' THEN COALESCE(quantity ,0)
ELSE 0
END) AS oranges_sold,
SUM(
CASE 
WHEN item='apple' THEN COALESCE(quantity ,0)
ELSE 0
END) AS apples_sold
FROM sales ;



SELECT
  n.node_id,
  n.parent_id,
  CASE
    WHEN n.parent_id IS NULL THEN 'ROOT'
    WHEN EXISTS (
      SELECT 1
      FROM nodes c
      WHERE c.parent_id = n.node_id
    ) THEN 'INTERNAL'
    ELSE 'LEAF'
  END AS node_type
FROM nodes n;
SELECT 
  COUNT(CASE WHEN value >= 40 THEN 1 END) AS pass_count,
  COUNT(CASE WHEN value < 40 THEN 1 END) AS fail_count
FROM rules;

SELECT node_id
FROM (
    SELECT node_id,
    CASE
        WHEN parent_id IS NULL THEN 'ROOT'
        WHEN EXISTS (SELECT 1 FROM nodes WHERE parent_id = n.node_id) THEN 'INTERNAL'
        ELSE 'LEAF'
    END AS type
    FROM nodes n
) AS subquery
WHERE type = 'INTERNAL';
-- “Look at every node. If it has no parent, call it ROOT. Otherwise, if it has at least one child, call it INTERNAL.
--  Otherwise call it LEAF. Finally, show me only the node IDs that are INTERNAL.”
SELECT 
  (SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS null_percentage
FROM sales;
SELECT 
  SUM(CASE WHEN ticket_type = 'Paid' AND referrer = 'Instagram' THEN 1 ELSE 0 END) AS insta_paid_total
FROM registrations;
SELECT 
  COUNT(CASE WHEN years_experience <= 3 THEN 1 END) AS juniors,
  COUNT(CASE WHEN years_experience > 3 THEN 1 END) AS seniors
FROM employees;
