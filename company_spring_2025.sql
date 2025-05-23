/******************************************************************************************
*	CS360 Spring 2025
* 	Written by: Dr. Vanderberg	
*	Purpose: Examples for Week 3 and Week 4 worksheets to create and populates the 
*		department and employee tables.
******************************************************************************************/

-- If you want/need to start over, begin by dropping (i.e., removing) existing tables (and all data in them).
drop table emp;
drop table dept;

-- Worksheet 3
/* Create dept table with 2 digit department number, department name, and location */
CREATE TABLE dept(
	dept_num INT(2) NOT NULL,
	dept_name VARCHAR(14) NOT NULL,
	dept_location VARCHAR(13) 
);

/* Create emp table with 4 digit employee number, employee name, job title, manager, hiredate, 
salary, commission, and associated department number */
CREATE TABLE emp(
	emp_num INT(4) NOT NULL,
	emp_name VARCHAR(14) NOT NULL,
	job VARCHAR(9),
	mgr INT(4),
	hiredate DATE,
	salary DECIMAL(9,2),
	commission DECIMAL(9,2),
	dept_num INT(2) NOT NULL
);

/* Create supplier table with s_num 2 char PK, sname, status, and city */
CREATE TABLE supplier(
	s_num CHAR(2) NOT NULL,
	sname VARCHAR(20) NOT NULL,
	status BOOLEAN,
	city VARCHAR(20)
);

/* Create part table with p_num 2 char PK, pname, color, weight, and city */
CREATE TABLE part(
	p_num CHAR(2) NOT NULL,
	pname VARCHAR(20) NOT NULL,
	color VARCHAR(20),
	weight DOUBLE,
	city VARCHAR(20)
);

/* Create bridge table sp with s_num, p_num, and qty */
CREATE TABLE sp(
	s_num CHAR(2) NOT NULL,
	p_num CHAR(2) NOT NULL,
	qty INT
);

/*  Use alter table statement to primary keys for each table */

ALTER TABLE emp
   ADD CONSTRAINT emp_pk
   PRIMARY KEY (emp_num);

ALTER TABLE dept
   ADD CONSTRAINT dept_pk 
   PRIMARY KEY (dept_num);

-- Adds PK of s_num to supplier table. --
ALTER TABLE supplier
	ADD CONSTRAINT supplier_pk
	PRIMARY KEY (s_num);
	
-- Adds PK of part_num to part table. --
ALTER TABLE part
	ADD CONSTRAINT part_pk
	PRIMARY KEY (p_num);

-- Has a composite primary key of s_num, and p_num). --
ALTER TABLE sp
	ADD CONSTRAINT sp_pk
	PRIMARY KEY (s_num, p_num);

/*  Use alter table statement to declare foreign keys for each table */

-- Each employee record is linked to a single department via deptno.
ALTER TABLE emp
   ADD CONSTRAINT dept_fk
   FOREIGN KEY (dept_num)
   REFERENCES dept(dept_num);

-- Each employee record can also be linked to another employee record. This creates the manager relationship.
ALTER TABLE emp
   ADD CONSTRAINT boss
   FOREIGN KEY (mgr)
   REFERENCES emp (emp_num);
   
-- First FK in sp for the supplier PK. --
ALTER TABLE sp
	ADD CONSTRAINT supplier_fk
	FOREIGN KEY (s_num)
	REFERENCES supplier (s_num);

-- Second FK in sp for the part PK. --
ALTER TABLE sp
	ADD CONSTRAINT part_fk
	FOREIGN KEY (p_num)
	REFERENCES part (p_num);

-- Worksheet 4

/* Populate dept table with data */  
INSERT INTO dept (dept_num, dept_name, dept_location) VALUES (10,'Accounting','New York');
INSERT INTO dept (dept_num, dept_name, dept_location) VALUES (20,'Research','Dallas');
INSERT INTO dept (dept_num, dept_name, dept_location) VALUES (30,'Sales','Chicago');
INSERT INTO dept (dept_num, dept_name, dept_location) VALUES (40,'Operations','Boston');

 
-- Could turn off foreign key checks, so that employees could be enter in any order. 
-- BUT, this is dangerous because it makes it possible to break referential integrity
-- SET FOREIGN_KEY_CHECKS = 0;

/* Populate employee table with data */
INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7839,'KING','PRESIDENT',NULL,'2005-02-14-',5000,NULL,10);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7566,'JONES','MANAGER',7839,'2011-04-02',3075,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7902,'FORD','ANALYST',7566,'2011-03-12',3100,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7369,'SMITH','CLERK',7902,'2019-12-17',900,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7698,'BLAKE','MANAGER',7839,'2011-01-05',2950,NULL,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7499,'ALLEN','SALESMAN',7698,'2011-02-20',1700,300,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7521,'WARD','SALESMAN',7698,'2011-02-22',1350,500,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7654,'MARTIN','SALESMAN',7698,'2018-09-28',1350,1400,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7782,'CLARK','MANAGER',7839,'2011-09-06',2550,NULL,10);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num) 
VALUES (7788,'SCOTT','ANALYST',7566,'2017-07-13',3100,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7844,'TURNER','SALESMAN',7698,'2011-09-08',1600,0,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7876,'ADAMS','CLERK',7788,'2007-07-13',1200,NULL,20);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7900,'JAMES','CLERK',7698,'2011-12-03',1050,NULL,30);

INSERT INTO emp (emp_num, emp_name, job, mgr, hiredate, salary, commission, dept_num)  
VALUES (7934,'MILLER','CLERK',7782,'2012-01-23',1400,NULL,10);

-- Worksheet 4 work --

-- Check --
SELECT * FROM supplier;

-- Add values to supplier table --
INSERT INTO supplier (s_num, sname, status, city)
VALUES ("s1", "Smith", 1, "Portland");
INSERT INTO supplier (s_num, sname, status, city)
VALUES ("s2", "Jones", 1, "New York");
INSERT INTO supplier (s_num, sname, status, city)
VALUES ("s3", "Adams", 0, "San Francisco");
INSERT INTO supplier (s_num, sname, status, city)
VALUES ("s4", "Clark", 0, "Austin");
INSERT INTO supplier (s_num, sname, status, city)
VALUES ("s5", "Henry", 1, "Atlanta");

-- Check --
SELECT * FROM supplier;

-- Check --
SELECT * FROM part;

-- Add values to part table --
INSERT INTO part (p_num, pname, color, weight, city)
VALUES ("p1", "Hammer", "red", 2.6, "Portland");
INSERT INTO part (p_num, pname, color, weight, city)
VALUES ("p2", "Pliers", "green", 3.1, "London");
INSERT INTO part (p_num, pname, color, weight, city)
VALUES ("p3", "Router", "blue", 2.6, "Austin");
INSERT INTO part (p_num, pname, color, weight, city)
VALUES ("p4", "Stapler", "red", 3.7, "New York");
INSERT INTO part (p_num, pname, color, weight, city)
VALUES ("p5", "Wrench", "green", 2.6, "Austin");
INSERT INTO part (p_num, pname, color, weight, city)
VALUES ("p6", "Ladder", "blue", 10.5, "Richmond");

-- Check --
SELECT * FROM part;

-- Check --
SELECT * FROM sp;

-- S1 Insert into SP --
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s1", "p1", 100);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s1", "p2", 200);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s1", "p3", 150);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s1", "p4", 120);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s1", "p5", 240);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s1", "p6", 210);

-- S2 Insert into SP --
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s2", "p2", NULL);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s2", "p4", 100);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s2", "p5", 120);

-- S3 Insert into SP --
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s3", "p1", 150);

-- S4 Insert into SP --
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s4", "p2", 120);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s4", "p3", 100);
INSERT INTO sp (s_num, p_num, qty)
VALUES ("s4", "p4", 250);

-- Check --
SELECT * FROM sp;

-- Part 2 --

-- 1 List data from all columns for all suppliers --
SELECT * FROM supplier;

-- 2 List data from all columns for all parts --
SELECT * FROM part;

-- 3 Close all suppliers by updating the status to 0 --
UPDATE supplier SET status = 0;

-- 4 Write a query to confirm that your previous query worked by displaying results and checking them --
SELECT * FROM supplier;

-- 5 Open all suppliers up --
UPDATE supplier SET status = 1;

-- 6 Show each suppliers name and status (with no other information) --
SELECT sname, status
FROM supplier;

-- 7 Show the names of all suppliers that are currently open --
SELECT sname
FROM supplier
WHERE status = 1;

-- 8 Show how you can use the keyword AS and single quotes to rename the column label in the result set from ‘sname’ to ‘Open Suppliers’ --
SELECT sname AS 'Open Suppliers' 
FROM supplier
WHERE status = 1;

-- 9 Update the city for suppliers in New York to New York City --
UPDATE supplier
SET city = 'New York City'
WHERE city = 'New York';

-- 10 Write a query to test whether the previous query is case sensitive. (e.g., new york city, or NEW YORK city). Is it? --
SELECT * 
FROM supplier
WHERE city = 'new york city' OR city = 'NEW YORK CITY' OR city = 'New York City';
-- It does not look to be case sensitive --

-- 11 Show part names of parts that weigh more than 5.0 --
SELECT pname AS 'Parts weighting more than 5.0'
FROM part
WHERE weight > 5.0;

-- 12 Show part names and cities for parts that are not red --
SELECT pname AS 'Non red parts'
FROM part
WHERE color != 'red';

-- 13 Show part names of parts that are red and in New York --
SELECT pname AS 'Red parts in New York City'
FROM part
WHERE color = 'red' AND city = 'New York';

-- 14 Increase the quantity of all parts supplied by any supplier by 10% --
UPDATE sp
SET qty = qty * 1.10;

-- 15 List all supplier names that end with s --
SELECT sname AS 'Supplier names that end with S'
FROM supplier
WHERE sname LIKE '%S';

-- 16 List all part colors that contain an ‘r’ in the color name --
SELECT pname AS 'Part names that have a r'
FROM part
WHERE pname LIKE '%r%';

-- 17 List the supplier number for all suppliers that supply at least one part --
SELECT DISTINCT s_num AS 'Parts that have a not null qty'
FROM sp
WHERE qty IS NOT NULL;

-- 18 List part names and weights for parts that weigh between 3.0 and 5.0 --
SELECT pname, weight AS 'Parts between 3.0 and 5.0 weight'
FROM part
WHERE weight BETWEEN 3.0 AND 5.0;

-- 19 Delete supplier s5 from the supplier table. Select all supplier names and show supplier s5 has been removed. Put s5 back in the supplier table --
DELETE FROM supplier
WHERE s_num = 's5';
SELECT sname FROM supplier;
INSERT INTO supplier (s_num, sname, status, city)
VALUES ("s5", "Henry", 1, "Atlanta");
SELECT sname FROM supplier;

-- 20 Try deleting supplier s1 from the supplier table and describe what happens. What would you need to do if you wanted to delete supplier s1 --
DELETE FROM supplier
WHERE s_num = 's1';

-- I get a error message saying that I can't delete s1 because its a FK in the sp table --
-- I would need to remove s1 as a foreign key --
-- Or I might be able to turn off FK key checks --

-- End Worksheet 4 --


-- Start Worksheet 5 --

-- How many suppliers are there? --
SELECT COUNT(DISTINCT s_num) FROM supplier;

-- How many parts are there? --
SELECT COUNT(DISTINCT p_num) FROM part;

-- How many suppliers are currently supplying at least one part? --
SELECT COUNT(DISTINCT s_num) 
FROM sp
WHERE qty > 0;

-- How many different parts is each supplier supplying? List each supplier’s number with the number of different parts they supply. The quantity supplied is irrelevant. --
SELECT s_num, COUNT(DISTINCT p_num)
FROM sp
GROUP BY s_num;

-- List the total quantity of all parts supplied. --
SELECT SUM(qty) FROM sp;

-- List the minimum quantity of all parts supplied. --
SELECT MIN(qty) FROM sp;

-- List the maximum quantity of all parts supplied. --
SELECT MAX(qty) FROM sp;

-- List the minimum, maximum, total, and the average quantity of all parts supplied. --
SELECT MIN(qty), MAX(qty), SUM(qty), AVG(qty)
FROM sp;

-- List the average quantity of parts each supplier supplies. --
SELECT s_num, AVG(qty)
FROM sp
GROUP BY s_num;

-- List supplier numbers and part numbers with quantity supplied ordered by the quantity. --
SELECT s_num, p_num, qty
FROM sp
ORDER BY qty DESC;

-- List supplier numbers and part numbers with quantity supplied - organize the results by supplier number and for each supplier order the records so that those with highest quantity appear towards the top. --
SELECT s_num, p_num, qty
FROM sp
ORDER BY s_num, qty DESC;

-- List supplier numbers of suppliers who supply at least three different parts. --
SELECT s_num, COUNT(p_num)
FROM sp
GROUP BY s_num HAVING COUNT(DISTINCT p_num) > 2;

-- List part numbers of parts that are supplied by at least two different suppliers. --
SELECT p_num, COUNT(s_num)
FROM sp
GROUP BY p_num HAVING COUNT(DISTINCT s_num) > 1;

-- Count the number of parts with a null quantity value. --
SELECT p_num, COUNT(p_num)
FROM sp
WHERE qty IS NULL;

-- Count the total quantity of parts each supplier supplies. --
SELECT s_num, SUM(qty)
FROM sp
GROUP BY s_num;

-- End of worksheet 5 --
