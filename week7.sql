
-- Week 7 --

-- List department names for departments that have no employees. --
SELECT dept_name FROM dept WHERE dept_num NOT IN (SELECT dept_num FROM emp);

-- Write a query that will always list supplier names of suppliers who aren't currently supplying any parts (i.e., they don’t appear in the sp table). --
SELECT sname FROM supplier WHERE s_num NOT IN (SELECT s_num FROM sp);

-- List supplier names of suppliers who supply part p1 or p6. Use a subquery. --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE p_num = 'p1' OR p_num = 'p6');

-- List supplier names of suppliers who supply ladders. --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE p_num = 'p6');

-- List part numbers (once each) of parts supplied by the supplier 'Jones'. Use a subquery --
SELECT DISTINCT p_num FROM part WHERE p_num 
IN (SELECT p_num FROM sp WHERE s_num 
IN (SELECT s_num FROM supplier WHERE sname = 'Jones'));

-- List supplier numbers of suppliers who supply at least one part with the maximum qty (across all parts). --
SELECT s_num FROM sp WHERE qty = ANY (SELECT MAX(qty) FROM sp);

-- Write a query to help you verify the results of the query above. --

-- List the supplier names of suppliers who supply at least one part with the maximum qty (across all parts). --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE qty = ANY(SELECT MAX(qty) FROM sp));

-- List supplier names of suppliers that supply at least one part with qty greater than the avg quantity across all parts supplied. --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE qty > (SELECT AVG(qty) FROM sp));

-- Justify the results to the previous question. Include any queries you use. --

-- List supplier names of suppliers who supply at least one part supplied by supplier Jones. Do not display the name Jones. --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE p_num IN (SELECT p_num FROM sp WHERE s_num = (SELECT s_num FROM supplier WHERE sname = 'Jones'))); 







-- End week 7 --
