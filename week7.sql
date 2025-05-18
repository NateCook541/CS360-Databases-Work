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
SELECT s_num, MAX(qty) FROM sp GROUP BY s_num;

-- List the supplier names of suppliers who supply at least one part with the maximum qty (across all parts). --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE qty = ANY(SELECT MAX(qty) FROM sp));

-- List supplier names of suppliers that supply at least one part with qty greater than the avg quantity across all parts supplied. --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE qty > (SELECT AVG(qty) FROM sp));

-- Justify the results to the previous question. Include any queries you use. --
SELECT AVG(qty) FROM sp;
-- Finds that the average across all parts for qty is 206.3333.
SELECT s_num, p_num, qty FROM sp WHERE qty > 206.3333 ORDER BY s_num;
-- This shows that supplier 1 and 4 are above the average, now I just need to find which suppliers these are to verify.
SELECT * FROM supplier;
-- This shows Smith and Clark are 1 and 4 which verify the answer.

-- List supplier names of suppliers who supply at least one part supplied by supplier Jones. Do not display the name Jones. --
SELECT sname FROM supplier WHERE s_num = ANY (SELECT s_num FROM sp WHERE p_num IN (SELECT p_num FROM sp WHERE s_num = (SELECT s_num FROM supplier WHERE sname = 'Jones'))) AND sname <> 'Jones'; 

-- Justify your results for the previous query. Include any queries you use. --
SELECT * FROM supplier;
-- This finds that Jones is s2 --
SELECT s_num, p_num FROM sp WHERE s_num = 's2';
-- This finds that Jones supplies p2, p4, and p5 --
SELECT s_num, p_num FROM sp WHERE p_num = 'p2' OR p_num = 'p4' OR p_num = 'p5' ORDER BY p_num;
-- This finds all suppliers that supply those parts and it shows s4 and s1 are the only ones
SELECT * FROM supplier;
-- Shows s1 is Smith and s4 is Clark Which verify the results of the query. --

-- List the supplier names of suppliers who supply no part supplied by supplier jones. --
SELECT sname FROM supplier WHERE s_num NOT IN (SELECT s_num FROM sp WHERE p_num IN (SELECT p_num FROM sp WHERE s_num = (SELECT s_num FROM supplier WHERE sname = 'Jones')));

-- Justify your results for the previous query. Include any queries you use. --
SELECT * FROM supplier;
-- This finds that Jones is s2. --
SELECT s_num, p_num FROM sp WHERE s_num = 's2';
-- This finds that Jones supplies p2, p4, and p5. --
SELECT s_num FROM sp WHERE p_num IN ('p2', 'p4', 'p5');
-- This finds that suppliers s1 and s4 supply some of the same parts as Jones. --
SELECT sname FROM supplier WHERE s_num NOT IN ('s1', 's2', 's4');
-- This finds Adams, Henry, and Cook which verify the results of the query. --

-- List each part number with supplier numbers who supply the part with a quantity that is larger than the average quantity for that part (across all suppliers) --
SELECT p_num, s_num FROM sp WHERE qty > (SELECT AVG(qty) FROM sp AS spTwo WHERE spTwo.p_num = sp.p_num) ORDER BY p_num;

-- Justify your results for the previous query. Include any queries you use. --
-- The query above shows that s3, s1, s1, s4, and s1 again supply above average for the respective part and p6 has no one above average (Just has one supplier supplying it).
SELECT p_num, AVG(qty) FROM sp GROUP BY p_num;
-- Finds the averages for each part p1	166.5000 p2	213.0000 p3	166.5000 p4	208.6667 p5	239.5000 p6	279.0000
SELECT p_num, s_num, qty FROM sp ORDER BY p_num;
-- Looking through here shows that the query is correct (Ex for part p1, s3 supplies 200 which correlates between the query)

-- Execute the following query and explain whether the results are meaningful. Include queries you use to check the results. --
SELECT s_num, p_num, max(qty) FROM sp GROUP BY s_num; 

SELECT MAX(qty) FROM sp WHERE p_num = 'p1';
SELECT * FROM sp ORDER BY p_num;
-- Both these commands show that the results are not meaningful because the max for p1 is 200.
-- The issue is the group by is finding the max for each supplier correctly (s_num and qty are correct) but p_num is incorrect because the group by function only groups by one input. A subquery would work here to fix it.

-- For each supplier, list the part number and quantity for the part the supply in the largest quantity. --
SELECT s_num, p_num, qty FROM sp WHERE (s_num, qty) IN (SELECT s_num, MAX(qty) FROM sp GROUP BY s_num) ORDER BY s_num;

-- End week 7 --
