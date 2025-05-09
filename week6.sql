-- List each employee name with the name of the department they work in. --
SELECT emp_name, dept_num FROM emp JOIN dept USING (dept_num);

-- List the job titles of all employees who work in the Sales department. --
SELECT job FROM emp JOIN dept WHERE dept_name = 'Sales'; -- Wrong --

-- List each (and every) department with the names of employees that work in that department. (Department names may be repeated). --
SELECT dept_name, emp_name FROM emp RIGHT JOIN dept USING (dept_num);

-- Write a query to join the sp and part tables in a way that presents meaningful information. --
SELECT * FROM sp JOIN part USING (p_num);

-- Update your previous query to display part names with supplier numbers and quantity for each supplier that  supplies that part. --
SELECT pname, s_num, qty FROM sp JOIN part USING (p_num);

-- Convince yourself the results of your previous two queries are correct. Explain how you did this and include any queries you used. Can you come up with a group by query that would be helpful? --
SELECT * FROM supplier;

-- List each supplier by name with the part numbers and qty they supply. --
SELECT sname, p_num, qty FROM sp JOIN supplier USING (s_num);

--List each supplier by name with the names of the parts they supply. --
SELECT sname, pname FROM part JOIN supplier USING (s_num); -- Wrong

-- Double-check the solution to your previous query. Is it correct? Explain your answer and include any queries you used. --

-- Write a query that shows supplier names and cities with part names and cities for suppliers and part combos that exist in the sp table --

