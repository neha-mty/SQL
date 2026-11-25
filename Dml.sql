-- ignoreee this one

-- hi this is really weird but i hve to do it

-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
DROP TABLE employees;
CREATE TABLE
employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    is_active BOOLEAN
)

INSERT INTO employees (emp_id, name, department, salary, hire_date, is_active) 
VALUES (301, 'Neha Sharma', 'Sales', 55000.00, '2024-03-11', TRUE);
 

 --INSERTION
 INSERT INTO employees (emp_id, name, department, salary, hire_date, is_active) 
VALUES
(302, 'Ishan Gupta',  'Engineering' ,110000.00, '2023-08-20', TRUE),
(303, 'Priya Singh',  'Support'     ,45000.00, '2024-07-01', TRUE),
(304, 'Karan Joshi',  'Engineering' ,95000.00, '2022-02-14', FALSE);

INSERT INTO employees (emp_id, name, salary, hire_date) 
VALUES (305, 'Omar Farooq', 62000.00, '2025-04-18');

--Twosingle quotes too stop confusion between mid sentence invered commas
INSERT INTO employees (emp_id, name, department, salary, hire_date) 
VALUES (306, 'Kevin O''Brian', 'Finance', 72000.00, '2024-10-05');

INSERT INTO employees (emp_id,name,department,salary,hire_date)
VALUES(307,'Ananya Das', 'HR',60000.00,CURRENT_DATE);

----move data from table to another
INSERT INTO employees (emp_id, name, salary, hire_date)
SELECT id, fullname, pay, '2026-01-01' FROM draft_hires;

-- mplicit Order:
--  Never write INSERT INTO table VALUES (...)
--  without listing columns. If the table structure 
-- changes in the future, your code will stop working.


--UPSERT
-- To use UPSERT, 
-- your table must have a Primary Key or a Unique Index. 



INSERT INTo employees (emp_id,name, department,salary,hire_date)
VALUES (301,'Raj Sharma','Eng', 57000.00,'2029-01-01')
ON DUPLICATE KEY UPDATE
name=VALUES(name),
department=VALUES(department),
salary=VALUES(salary);

SELECT  * FROM employees;

INSERT INTO employees (emp_id, name, department, salary, hire_date)
VALUES (302, 'Ishan Gupta', 'Engineering', 110000.00, '2023-08-20')
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  salary = VALUES(salary);
  INSERT INTO employees (emp_id, name, department, salary, hire_date)
VALUES (301, 'Raj Sharma', 'Eng', 60000.00, '2030-01-01')
ON DUPLICATE KEY UPDATE
  salary = 60000.00;


  --BULK IINSERTIONS
  INSERT INTO employees (emp_id, name, department, salary, hire_date)
VALUES 
(302, 'Ishan G.', 'Engineering', 110000.00, '2023-08-20'),
(303, 'Priya Singh', 'Support', 45000.00, '2024-07-01')
ON DUPLICATE KEY UPDATE
  name = VALUES(name);
<<<<<<< HEAD
=======

--IGNORE POLICY
--ignores if the id already exists
INSERT IGNORE  INTO employees(emp_id,name,department)
VALUES(301,'New Person','HR');


--UPDATE
UPDATE employees 
SET department ='Eng'
WHERE emp_id=305;

UPDATE employees
SET department='HR',
salary=65000.00
WHERE emp_id=305;

UPDATE employees 
SET salary =salary*1.5
WHERE salary<60000.00;

-- The Dangerous "Global" Update
-- Question: Assign every single employee in the company to the 'HR' department. This is what happens when you forget the WHERE clause.

-- UPDATE employees
-- SET department = 'HR';
UPDATE employees
SET is_active = FALSE
WHERE emp_id = 304;

--DELETE
DELETE FROM employees
WHERE emp_id=305;
DELETE FROM employees
WHERE emp_id IN (301, 302);

DELETE FROM employees
WHERE is_active = FALSE;

DELETE FROM employees
WHERE hire_date<'2024-01-01';

--DELETE withot a where clause will delete all the data


-- -ALTER
INSERT INTO employees (emp_id,name,department,salary,hire_date,is_active)
VALUES(304,'Karan Joshi','HR',95000.00,'2022-2-14',FALSE)

ALTER TABLE employees
ADD COLUMN temp_check INT;

--backfilling data after an alter
UPDATE employees 
SET temp_check=10;

SELECT * FROM employees_v2;
ALTER TABLE employees
DROP COLUMN temp_check;



--RENAMING
ALTER TABLE employees
RENAME TO employees_v2;

ALTER TABLE employees_v2
RENAME COLUMN hire_date TO joining_date;

--CHANG CLAUSE
ALTER TABLE employees_v2
CHANGE salary monthly_pay DECIMAL(12,2);

ALTER TABLE employees_v2
MODIFY department VARCHAR(100) NOT NULL;

--TRNCATE--DDL

TRUNCATE TABLE employees_v2;
