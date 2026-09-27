-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
--UNION
-- Table 1: delhi_staff
CREATE TABLE delhi_staff (
    name VARCHAR(50),
    role VARCHAR(50)
);

-- Insert data
INSERT INTO delhi_staff (name, role)
VALUES
('Raj Patel', 'Developer'),
('Neha Sharma', 'Manager'),
('Amit Kumar', 'QA');


-- Table 2: mumbai_staff
CREATE TABLE mumbai_staff (
    name VARCHAR(50),
    role VARCHAR(50)
);

-- Insert data
INSERT INTO mumbai_staff (name, role)
VALUES
('Sana Khan', 'Developer'),
('Neha Sharma', 'Manager'),
('Rahul Mehta', 'Sales');

SELECT name FROM delhi_staff
UNION
SELECT name FROM mumbai_staff;

SELECT customer_name FROM customers  status='VIP'
UNION
SELECT customer_name FROM customers WHERE signup_date =CURRENT_DATE;


SELECT name AS final_list FROM delhi_staff
UNION
SELECT name AS final_list FROM mumbai_staff;






--UNION AL
SELECT item_name FROM online_sales
UNION ALL
SELECT item_name FROM shop_sales;


SELECT user_id,login_time,'Success' AS status FROM web_logs
UNION ALL
SELECT uer_id,login,'Success' AS status FROM mobile_logs;

--total revenuefrom two tables

SELECT SUM (price) AS total_revenue
FROM(SELECT price FROM online_sales
UNION ALL
SELECT price FROM shop_sales)
AS combined_prices;

-- joining data from diff years

SELECT order_id,amount FROM orders_2023
UNION ALL
SELECT order_id,amount FROM orders_2024

--intersection
-- names of customers who appears in both tabee


SELECT customer_name
FROM(SELECT
customer_name FROM store_customers
UNION ALL
SELECT customer_name FROM online_customer)AS combined_list
GROUP BY customer_name
HAVING COUNT(*)>1;

--or use intersect operator
SELECT customer_name FROM store_customers
INTERSECT
SELECT customer_name FROM online_customers;

--opposite of intersection

SELECT s.customer_name
FROM store_customers s LEFT JOIN
 online_customers o ON s.customer_name=o.customer_name
WHERE o.customer_name IS NULL;