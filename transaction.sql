-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
show DATABASES;
DROP DATABASE tuf_sql_2;
create database tuf_sql_2

show grants


select * from mysql.user



create user 'raj'@'%' identified by '123456';

create user 'raj_localhost'@'localhost' identifed by '123456';

SELECT user AS role_name, host
FROM mysql.user
WHERE account_locked = 'Y'
  AND (authentication_string IS NULL OR authentication_string = '')
ORDER BY user;

DROP TABLE students;
CREATE TABLE tuf_sql_2.students(
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(120) NOT NULL UNIQUE,
  full_name VARCHAR(80) NOT NULL,
  city VARCHAR(60) NULL,
  status ENUM('ACTIVE','BANNED') NOT NULL DEFAULT 'ACTIVE',
  created_at DATETIME NOT NULL
) ENGINE=InnoDB;

create role 'engneering';
create role 'support';

grant select ,insert,update ON tuf_sql_2.students to 'engineering';

 select * from students ;
 show grants for 'engineering'@'%';




--transacton 2

 
 SELECT  CONNECTION_ID();

 --if raj moved to delhi,status can be active again
START transaction;

 UPDATE tuf_sql_students
SET status ='ACTIVE'
WHERE student_id=1;


UPDATE tuf_sql_students
SET city='Delhi'
WHERE student_id=1;
COMMIT;


ROLLBACK;
--we are doing a bank transacton
-- start transaction
--nsert(tras,inittated
--b=b+500
--a=a-500
--insert (trans,completed)
--rollback to savepoint save_transacton_nitiated


START transaction;
SELECT CONNECTION_ID();

UPDATE students
SET full_name='rajvikram'
WHERE student_id=1;

SELECT CONNECTION_ID();
COMMIT;

SELECT full_name,CONNECTION_ID() FROM students WHERE student_id=1;

