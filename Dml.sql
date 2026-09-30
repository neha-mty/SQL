-- ignoreee this one
--ignore this command but why it is not getting pushed ?
    --- ignore but why it is not getting commit
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
