-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
-- what is all this drama
CREATE TABLE employees (
  emp_id           INT PRIMARY KEY,
  employee_name    VARCHAR(50) NOT NULL,
  project          VARCHAR(20) NOT NULL,
  years_experience DECIMAL(4,1) NULL,
  hours_logged     INT NULL,
  role             VARCHAR(20) NULL, 
  INDEX idx_project (project)

  );
  ---outside the table query we wrie like
  --CREATE  INDEX idx_project ON employees(project)
  DROP TABLE employees;

INSERT INTO employees (emp_id, employee_name, project, years_experience, hours_logged, role) VALUES

(1,  'Alice', 'Alpha', 3.0, 100, 'Developer'),
(2,  'Bob',   'Alpha', 5.0, 120, 'QA'),
(3,  'Carol', 'Alpha', 7.0, 105, 'Developer'),
(4,  'Dave',  'Alpha', NULL, 0, 'Manager'),
(5,  'Eve',   'Beta',  2.0,  80, 'Manager'),
(6,  'Frank', 'Beta',  3.0, 110, 'Developer'),
(7,  'Grace', 'Beta',  4.0, 130, 'Developer'),
(8,  'Hank',  'Beta',  3.0, NULL, 'Developer'),
(9,  'Heidi', 'Gamma', 5.0, 150, 'Developer'),
(10, 'Ivan',  'Gamma', 6.0, 140, 'QA');



--1. GROUP BY
--it divides rowa into groups on one or more columns,and then
--aggregratefuncc(SUM,AVG)operate with each grp
SELECT project
FROM employees 
GROUP BY project;


SELECT role
FROM employees 
GROUP BY role;

SELECT project,role
FROM employees 
GROUP BY project,role;


--HAVING for filtering aggregating data
--MIn AND MAX only works for group by dat


SELECT project,MIN (years_experience)
 AS min_years_exp,
 MAX (years_experience)
 AS max_exp
FROM employees 
GROUP BY project;

--SUM AND AVG
--avg doent consider null record

SELECT project,SUM(hours_logged)AS sum_hours_per_project,
AVG (years_experience)
FROM employees 
GROUP BY project;

--HAVING
SELECT project,SUM(hours_logged)AS sum_hours_per_project
FROM employees 
GROUP BY project
HAVING sum_hours_per_project>200;



--COUNT
--
SELECT project,COUNT(*)
FROM employees 
GROUP BY project
HAVING COUNT(*)>2;

CREATE TABLE registrations (
  reg_id      INT PRIMARY KEY,
  user_name   VARCHAR(50) NULL,
  email       VARCHAR(120) NULL,
  event       VARCHAR(50) NOT NULL,
  ticket_type ENUM('Free','Paid') NOT NULL,
  referrer    VARCHAR(50) NULL,
  INDEX idx_event (event)
);

INSERT INTO registrations (reg_id, user_name, email, event, ticket_type, referrer) VALUES
(1,  'Aisha',  'aisha@example.com',   'TechFest',  'Paid', 'Instagram'),
(2,  'Rohan',  'rohan@example.com',   'TechFest',  'Free', NULL),
(3,  'Aisha',  'aisha@example.com',   'CodeCamp',  'Paid', 'Instagram'),
(4,  'Mohit',  NULL,                  'TechFest',  'Free', 'LinkedIn'),
(5,  'Neha',   'neha@example.com',    'CodeCamp',  'Free', 'Instagram'),
(6,  NULL,     'unknown@example.com', 'DesignCon', 'Paid', 'Twitter'),
(7,  'Aisha',  'aisha@example.com',   'TechFest',  'Paid', 'Instagram'),
(8,  'Vishal', NULL,                  'DesignCon', 'Free', NULL),
(9,  'Rohan',  'rohan@example.com',   'TechFest',  'Free', 'Instagram'),
(10, 'Aisha',  'aisha@example.com',   'CodeCamp',  'Paid', NULL);

--COUNT also takes NULL values
SELECT COUNT(*)
FROM registrations;
SELECT * FROM registrations;

SELECT COUNT(*) -  COUNT(email) FROM registrations;--IMPORTANT

SELECT COUNT (DISTINCT(email)) FROM registrations;

--NULL is not counted
SELECT event,COUNT(DISTINCT email)
 FROM
registrations GROUP BY event;

SELECT event,COUNT(DISTINCT email)
FROM registrations
GROUP BY event
HAVING COUNT(*)>1;


-- -- Grouping by Primary Keys:
--  If you group by emp_id, every group will only have one row because 
-- IDs are unique. This makes the grouping useless.
--  Always group by a column that has repeating values,
--  like department, city, or project.
-- ORDER BY also one func

-- Filtering Aggregate Results: Do not try to use WHERE SUM(hours) > 100.
-- The WHERE clause only works on individual rows.
-- To filter based on a calculation, you must use HAVING.
