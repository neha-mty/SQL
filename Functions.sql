-- nobody is going to see this so heheh
-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  city VARCHAR(30) NULL,
  phone VARCHAR(20) NULL,

  fee_paid DECIMAL(10,2) NULL,     -- for ROUND()
  score_change DECIMAL(10,2) NULL, -- for ABS()

  test1 INT NULL,                  -- for GREATEST/LEAST
  test2 INT NULL,
  test3 INT NULL
); 
-- ignore hehhehhehe
INSERT INTO students (id, name, city, phone, fee_paid, score_change, test1, test2, test3) VALUES
(1,  'Aisha',   'Delhi',     NULL,           2804.45,  -12.25, 55, 60, 58),
(2,  'Rohan',   'Mumbai',    '',             3303.06,  -80.00, 40, NULL, 52),
(3,  'Meenal',  NULL,        '8888000004',   7999.00,   NULL,  NULL, NULL, 35),
(4,  'Arjun',   'Pune',      '9777000005',   3717.94,   10.00, 72, 70, 75),
(5,  'Neha',    'Jaipur',    NULL,           3499.00,  -30.75, 10, 15, 12),
(6,  'Vikas',   'Hyderabad', '9666000007',   5099.00,  120.75, 88, 91, 95),
(7,  'Sana',    'Ahmedabad', NULL,           7085.13,  -15.00, 65, 64, NULL),
(8,  'Imran',   'Kolkata',   '',             3303.06,   -1.00, 50, 49, 51),
(9,  'Pallavi', '',          '9555000010',   3303.06,    5.25, 92, 90, 91),
(10, 'Deepak',  'Chennai',   NULL,           NULL,     -22.00, 33, 40, 38),
(11, 'Ananya',  'Bengaluru', '9444000012',   3504.16,   18.50, 78, NULL, NULL),
(12, 'Tanya',   'Kolkata',   '',             3303.06,  -10.00, 45, 42, 48);

INSERT INTO students  (id, name, city, phone, fee_paid, score_change, test1, test2, test3) VALUES
(13, 'Raj',   'Delhi',   NULL,             2804.45,  -12.25, NULL, NULL, NULL);

--ROUND()
-- ROUND(number,decimals)rounds a number to the given decimal
--places

SELECT id,name,fee_paid,ROUND(fee_paid,1)
FROM students ORDER BY id;

--ABS()
--it returns the absolute value 
SELECT id,name,fee_paid,ROUND(fee_paid,1),score_change,
ABS(score_change) AS abs_score_change
FROM students ORDER BY id;

--GREATEST()
--returns the largest value from give list

SELECT id,name,test1,test2,test3,GREATEST(test1,test2,test3)
FROM students ORDER BY id;
--if there is a null the  greatest will come out to be null



--LEAST
--returns the smallest
SELECT id,name,test1,test2,test3,GREATEST(test1,test2,test3)
FROM students ORDER BY id;



--IF NULL 
--if the value is null it return the val
-- if not it returns the replaemnt val u povided

SELECT id,name,test1,test2,test3,GREATEST(IFNULL(test1,-1),IFNULL(test2,-1),IFNULL(test3,-1))
FROM students ORDER BY id;


--COLAESCE()
--returns the first non null val
SELECT id,name,test1,test2,test3,COALESCE(test1,test2,test3) as all_null,
GREATEST(COALESCE(test1,-1),COALESCE(test2,-1),COALESCE(test3,-1))
FROM students ORDER BY id;



CREATE TABLE coalesce_demo (
  id INT PRIMARY KEY,
  primary_email   VARCHAR(80),
  work_email      VARCHAR(80),
  personal_email  VARCHAR(80),
  hours_logged    DECIMAL(10,2),
  default_hours   DECIMAL(10,2)
);

INSERT INTO coalesce_demo VALUES
(1, 'aisha@company.com', NULL,              'aisha@gmail.com',  5.0,  0.0),
(2, NULL,               'rohan@company.com',NULL,               NULL, 0.0),
(3, NULL,               NULL,               'meera@yahoo.com',  2.5,  0.0),
(4, NULL,               NULL,               NULL,              NULL, 0.0),
(5, '',                 NULL,               'raj@gmail.com',   5.0,  0.0);

SELECT id,COALESCE(primary_email,work_email,personal_email,'hello@tuf')as contact_email
FROM coalesce_demo;

SELECT id,COALESCE(primary_email,work_email,personal_email,'hello@tuf')as contact_email
FROM coalesce_demo;
SELECT id,COALESCE(NULLIF(TRIM(primary_email),''),work_email,personal_email)as contact_email
FROM coalesce_demo

-- IS NOT NULL	Checks whether a column value is present (not NULL)	WHERE (to filter rows)	col IS NOT NULL	col IS NOT NULL
-- IFNULL()	Replaces NULL with a given value (does not filter rows)	SELECT (to clean output)	IFNULL(col, value)	✖ Not available
-- COALESCE()	PostgreSQL equivalent of IFNULL (returns first non-NULL)	SELECT (to clean output)	COALESCE(col, value)	COALESCE(col, value)
-- Common mistake	= NULL does not work because NULL is not a normal value	-	✖ col = NULL	✖ col = NULL
