CREATE DATABASE IF NOT EXISTS lecture_practice;

USE lecture_practice;
CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR (120) NOT NULL,
  full_name VARCHAR(80) NOT NULL,
  city VARCHAR(60) NULL,
  signup_at_utc  DATETIME NOT NULL,
  last_purchase_inr DECIMAL(10,2) NULL,
  last_coupon_code VARCHAR(30) NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1
  );


CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_signup_at_utc ON users(signup_at_utc);
CREATE INDEX idx_users_city ON users(city);

INSERT INTO users
(email, full_name, city, signup_at_utc, last_purchase_inr, last_coupon_code, is_active)
VALUES
('raj@tuf.com',              'Raj',            'Bengaluru', '2025-12-01 00:00:00',  999.00, 'WELCOME10',    1),
('test_user1@gmail.com',     'Test User One',  'Delhi',     '2025-12-05 10:00:00',  499.00, NULL,          1),
('testXuser2@gmail.com',     'Test User Two',  'Delhi',     '2025-12-10 12:00:00',  750.00, 'WELCOME_2026', 1),
('aayush@company.com',       'Aayush',         NULL,        '2025-11-30 23:59:59',  NULL,   NULL,          1),
('neha@example.com',         'Neha',           '',          '2025-12-31 23:59:59',  1500.00,'TUF_50',       1),
('mohit@gmail.com',          'Mohit',          'Mumbai',    '2026-01-01 00:00:00',  299.00, 'NEWYEAR10',    1),
('sara@tuf.com',             'Sara',           'Bengaluru', '2025-10-10 05:00:00',  2000.00,NULL,          1),
('arjun@yahoo.com',          'Arjun',          'Pune',      '2025-12-20 09:00:00',  799.00, 'FLASH_SALE',   0),
('john.doe@gmail.com',       'John Doe',       'Chennai',   '2025-12-05 18:30:00',  300.00, NULL,          1),
('jane_doe@gmail.com',       'Jane Doe',       'Chennai',   '2025-12-06 18:30:00',  1200.00,'WELCOME_BACK',1),
('support+trial@tuf.com',    'Support Trial',  'Gurugram',  '2025-12-07 10:00:00',  NULL,   NULL,          1),
('priya@outlook.com',        'Priya',          'Hyderabad', '2025-12-08 10:00:00',  999.00, 'WELCOME10',    1),
('sameer@rediffmail.com',    'Sameer',         NULL,        '2025-12-09 10:00:00',  100.00, NULL,          1),
('emptycity@demo.com',       'Empty City',     ' ',       '2025-12-10 10:00:00',  499.00, NULL,          1),
('khushi@gmail.com',         'Khushi',         'Delhi',     '2025-12-11 10:00:00',  500.00, 'REFERRAL5',    1),
('promo@demo.com',           'Promo',          'Mumbai',    '2025-12-25 00:00:00',  1499.00,'TUF_50',       1),
('intern@tuf.com',           'Intern',         'Bengaluru', '2025-12-22 20:00:00',  899.00, 'WELCOME_BACK', 1),
('hello@sample.com',         'Hello',          'Delhi',     '2025-12-02 08:00:00',  NULL,   NULL,          1);

SELECT email,full_name,city FROM users WHERE NULLIF(trim(city),'') IS NOT NULL;

SELECT email,full_name,city FROM users WHERE city IN ('Delhi', 'Mumbai') OR city IS NULL;
--- we cannot write NULL in here cause NULL not there for comparison
SELECT email,full_name,city FROM users WHERE city ='Delhi' OR city ='Mumbai';

SELECT email,full_name,city FROM users WHERE city NOT IN ('Delhi' ,'Mumbai');

--IN checks if  a value  matches any one  value from a list
--NOT IN checks if the value matches none from the list


--BETWEEN it checks if a value lies within a range (Within range)


-- NOT  BET checks if a value lies outside that inclusice range

SELECT email,full_name,city,signup_at_utc 
 FROM users 
WHERE signup_at_utc>='2025-12-01 00:00:00' AND signup_at_utc< '2026-01-01 00:00:00';
SELECT
  id,
  email,
  signup_at_utc
FROM users
WHERE signup_at_utc NOT BETWEEN '2025-12-01 00:00:00'
                        AND '2025-12-31 23:59:59';


--LIKE matches text patterns COMMENT
--NOT LIKE excludes text matches the pattern
--% means any no of character is allowed


--Case Sensitivity: Depending on your database, 
--LIKE 'a%' might not find names starting with capital "A". 
--In some databases like PostgreSQL, you might need to use ILIKE 
--for a search that ignores capitalization.
SELECT email,full_name FROM users WHERE email  LIKE'm%@gmail.com';

SELECT email,full_name FROM users WHERE email  LIKE'neh_@example.co_';
--_ underscore could be anythig

SELECT email,full_name  FROM users WHERE email  LIKE 'test_user%'; 
SELECT email,full_name  FROM users WHERE email  LIKE 'test\_user%'; 

--_underscore is  generic chaacter we dontwanrt the rule to aplly there
SELECT email,full_name FROM users WHERE email  LIKE'm%@gmail.com';
