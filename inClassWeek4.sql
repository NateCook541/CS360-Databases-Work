SELECT * FROM emp;

UPDATE emp SET salary = salary * 2;
SELECT * FROM emp;

SELECT * FROM dept;
DELETE FROM dept WHERE dept_num = 50;
SELECT * FROM dept;

DELETE FROM emp WHERE emp_num = 8000;
SELECT * FROM emp;

-- It is dangerous because it makes it possible to break referential integrity

SELECT * FROM dept;
UPDATE dept SET dept_num = 44 WHERE dept_num = 40;
SELECT * FROM dept;
UPDATE dept SET dept_num = 40 WHERE dept_num = 44;
SELECT * FROM dept;

-- Doesn't work because it deptnum 20 is a FK in the emp table with many employees having it listed as a FK.
-- For it to work I would need to change it in the emp table as well. (I think?)
UPDATE dept SET dept_num = 22 WHERE dept_num = 20;
SELECT * FROM dept;

-- DAY 8 ACTIVITY ONE --

SELECT emp_name, salary, commission 
FROM emp 
WHERE salary > 1000 OR commission < 100;

SELECT emp_name, salary, commission 
FROM emp 
WHERE salary > 1000 AND commission < 100;

-- I believe that both are correct from looking at the results. --
-- I learned how to use logical operators AND + OR to operate / view only certain rows bases on their data --

-- DAY 8 ACTIVITY TWO --

-- List employee names for all employees whose name starts with S
SELECT emp_name 
FROM emp 
WHERE emp_name LIKE 'S%';

-- How can you rename the empname column for the previous query to that readability is better
SELECT emp_name AS 'Employee Names Starting with S' 
FROM emp 
WHERE emp_name LIKE 'S%';

-- List employee names for all employees whose name contains an S
SELECT emp_name AS 'Employee Names with an S in them' 
FROM emp 
WHERE emp_name LIKE '%S%';

-- List employee names for all employees who have an A as the second letter in their name
SELECT emp_name AS 'Employee Names with a A as the second letter' 
FROM emp 
WHERE emp_name LIKE BINARY '_A%'; -- Have to use binary because where is not case sensitive --

-- List all employees that work in one of the following departments: 10 and 20
SELECT emp_name, dept_num
FROM emp
WHERE dept_num IN (10, 20);

-- List all employees that work in one of the following departments: 10 and 20
SELECT emp_name, dept_num
FROM emp
WHERE dept_num = 10 OR dept_num = 20;

-- select empname from emp where deptno = 10 and deptno = 20; --
-- This won't work because one row can't have two department numbers. Instead of and it should use or.

-- Run the following query to show employees by name and their salaries. Then fix it --
SELECT emp_name, salary FROM emp;

-- List all employees by name who make 500 or less in commission --
SELECT emp_name, commission
FROM emp
WHERE commission <= 500 OR commission IS NULL;

-- List all employees with their total pay --
SELECT emp_name, commission, salary,
(salary + IFNULL(commission, 0)) AS totalPay
FROM emp;

-- List all employees who were hired prior to 2017 --
SELECT emp_name, hiredate
FROM emp
WHERE hiredate < '2017-01-01';
