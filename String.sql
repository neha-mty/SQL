-- Active: 1789500142875@@127.0.0.1@3306@lecture_practice
CREATE TABLE sales (
  item     VARCHAR(30) NOT NULL,
  quantity INT DEFAULT NULL
) ENGINE=InnoDB
DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- accent insessitive
-- ci-case insensitive
SELECT CONCAT('Hello', ' ', 'Raj');
SELECT CONCAT('Hello', NULL, 'Raj');
SELECT CONCAT_WS(' ', 'Hello', NULL, 'Raj');
SELECT CONCAT_WS(' .', 'Hi', NULL, 'Raj');--separator is applied in btw words so hi.raj
SELECT TRIM('  RAJ  ');
SELECT LTRIM(' RAJ ');
SELECT RTRIM(' RAJ ');
-- LENGTH() → number of bytes
-- CHAR_LENGTH() → number of characters
SELECT LENGTH('RAJ');
SELECT LENGTH('é');
SELECT LENGTH('😀');


SELECT CHAR_LENGTH('RAJ');
SELECT CHAR_LENGTH('é');
SELECT CHAR_LENGTH('😀');


--  LEFT() / RIGHT() / SUBSTRING()
-- Examples:

-- LEFT(str, n) = first n characters
-- RIGHT(str, n) = last n characters
-- SUBSTRING(str, start, len) = slice string

SELECT LEFT('plus_user', 3);
SELECT RIGHT('plus_user', 4);


SELECT SUBSTRING('plus_user', 3);
SELECT SUBSTRING('plus_user', 3, 2);

-- LOCATE() / INSTR()
-- LOCATE(substr, str)
-- INSTR(str, substr)


SELECT LOCATE('@', 'Raj@gmail.com');
SELECT INSTR('Raj@gmail.com', '@');
SELECT INSTR('Raj@gmail.com', '7');




SELECT REPLACE('a_b_c', '_', '-');

-- LIKE Pattern Matching
-- Wildcards

-- % = any length
-- _ = exactly one character
SELECT 'plus_user' LIKE 'plus%';
SELECT 'plus1user' LIKE 'plus_us_r';SELECT 'plus1user' LIKE 'plus\_user';
-- Flag	Meaning	What it controls	Example	Result
-- ai	Accent-Insensitive	Ignores accents (é, è, ñ)	cafe vs café	Equal
-- as	Accent-Sensitive	Respects accents	cafe vs café	Not equal
-- ci	Case-Insensitive	Ignores letter case	Apple vs apple	Equal
-- cs	Case-Sensitive	Respects letter case	Apple vs apple	Not equal