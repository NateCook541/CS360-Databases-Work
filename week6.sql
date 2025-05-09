-- List each employee name with the name of the department they work in. --
SELECT emp_name, dept_num FROM emp JOIN dept USING (dept_num);

-- List the job titles of all employees who work in the Sales department. --
SELECT job FROM emp JOIN dept ON emp.dept_num = dept.dept_num WHERE dept.dept_num = 30;

-- List each (and every) department with the names of employees that work in that department. (Department names may be repeated). --
SELECT dept_name, emp_name FROM dept LEFT JOIN emp ON dept.dept_num = emp.dept_num;

-- Write a query to join the sp and part tables in a way that presents meaningful information. --
SELECT * FROM sp JOIN part USING (p_num);

-- Update your previous query to display part names with supplier
-- numbers and quantity for each supplier that  supplies that part. --
SELECT pname, s_num, qty FROM part JOIN sp ON part.p_num = sp.p_num;

-- Convince yourself the results of your previous two queries are correct. 
--Explain how you did this and include any queries you used. 
-- Can you come up with a group by query that would be helpful? --


-- List each supplier by name with the part numbers and qty they supply. --
SELECT sname, p_num, qty FROM supplier JOIN sp ON supplier.s_num = sp.s_num;

--List each supplier by name with the names of the parts they supply. --
SELECT supplier.sname, part.pname FROM supplier
JOIN sp ON supplier.s_num = sp.s_num
JOIN part ON sp.p_num = part.p_num;

-- Double-check the solution to your previous query. Is it correct? 
-- Explain your answer and include any queries you used. --


-- Write a query that shows supplier names and cities with part names and cities for 
-- suppliers and part combos that exist in the sp table --
SELECT supplier.sname, part.pname, supplier.city, part.city FROM supplier
JOIN sp ON supplier.s_num = sp.s_num
JOIN part ON sp.p_num = part.p_num;

-- Add a new supplier with your name and hometown. --
INSERT INTO supplier (s_num, sname, status, city)
VALUES ("s6", "Cook", 1, "Medford");
SELECT * FROM supplier;

-- Write a query that will always list supplier names of suppliers who aren't currently supplying any parts. --
SELECT sname FROM supplier LEFT JOIN sp ON supplier.s_num = sp.s_num WHERE sp.s_num IS NULL;

-- List supplier names of suppliers who supply part p2 or p3. Each name should only be listed once. --
SELECT DISTINCT sname FROM supplier JOIN sp ON supplier.s_num = sp.s_num WHERE sp.p_num = 'p2' OR sp.p_num = 'p3';

-- List supplier names of suppliers who supply pliers. --
SELECT sname FROM supplier JOIN sp ON supplier.s_num = sp.s_num
JOIN part ON sp.p_num = part.p_num
WHERE part.pname = 'Pliers';

-- List part numbers (once each) of parts supplied by the supplier 'Clark'. --
SELECT part.p_num FROM part JOIN sp ON part.p_num = sp.p_num
JOIN supplier ON sp.s_num = supplier.s_num
WHERE supplier.sname = 'Clark';
