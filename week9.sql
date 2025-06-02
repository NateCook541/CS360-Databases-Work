-- Week 9 --

-- List each employee by name with the number of years since they were hired. --
SELECT emp_name, TIMESTAMPDIFF(YEAR, hiredate, NOW()) AS yearsWorking FROM emp;

-- What field should you include in the above query to verify your results? Show your updated query. --
-- I think including years would help to verify the result --
SELECT emp_name, hiredate, TIMESTAMPDIFF(YEAR, hiredate, NOW()) AS yearsWorking FROM emp;

-- List each supplier and part by number along with the quantity supplied by decreasing quantity. Null values should be replaced with 0s. --
SELECT s_num, p_num, IFNULL(qty, 0) AS qty FROM sp ORDER BY qty DESC;

-- Update the previous query to include supplier name and part names --
SELECT sname, pname, IFNULL(qty, 0) AS qty FROM sp JOIN supplier ON sp.s_num = supplier.s_num JOIN part ON sp.p_num = part.p_num ORDER BY qty DESC;

-- List part numbers and names concatenated together with an underscore. --
SELECT CONCAT(p_num, "_", pname) AS p_pum FROM part;

-- For each record in the sp table classify it as high volume or low volume based on whether the qty is greater than 200. Check your results --
SELECT s_num, p_num, CASE WHEN qty >= 200 THEN 'High Volume' ELSE 'Low Volume' END AS volume FROM sp;

-- What field should you add to the select statement above to check your results? Check your results carefully. --
-- I think adding qty would help verify the results --
SELECT s_num, p_num, qty, CASE WHEN qty >= 200 THEN 'High Volume' ELSE 'Low Volume' END AS volume FROM sp;

-- Look up a SQL function of your choice, explain what it does, and provide an example. --
-- The sql function LOWER converts all text to lower case --
SELECT LOWER(emp_name) FROM emp ORDER BY emp_name;

-- Provide a listing of suppliers and parts that are located in Portland using a relational operator. --
SELECT sname, city FROM supplier WHERE city = "Portland"
UNION
SELECT pname AS name, city FROM part WHERE city = "Portland";

-- Provide a list of all suppliers who are open (at any given time) combined with a list of suppliers who are located in New York. If a supplier is open and 
-- located in New York they should appear in the list twice. --
SELECT sname, status, city FROM supplier WHERE status = '1'
UNION ALL
SELECT sname, status, city FROM supplier WHERE city = 'New York City';

-- List suppliers by name that supply at least 2 different parts. --
SELECT sname FROM supplier JOIN sp ON supplier.s_num = sp.s_num GROUP BY supplier.sname HAVING COUNT(DISTINCT p_num) >= 2;

-- List suppliers by name that supply at least 3 different parts and are also located in Portland using a relational operator. --
SELECT sname FROM supplier JOIN sp ON supplier.s_num = sp.s_num GROUP BY supplier.sname HAVING COUNT(DISTINCT p_num) >= 3
INTERSECT
SELECT sname FROM supplier WHERE city = "Portland";

-- List suppliers by name that supply at least 3 different parts and are not currently open using relational operators. --
SELECT sname FROM supplier JOIN sp ON supplier.s_num = sp.s_num GROUP BY supplier.sname HAVING COUNT(DISTINCT p_num) >= 3
INTERSECT
SELECT sname FROM supplier WHERE status != "1";

-- Create a view that shows all parts with names of suppliers and quantities for each part they supply. --
CREATE VIEW PartSupplierQty AS SELECT sname, pname, qty FROM sp JOIN supplier ON sp.s_num = supplier.s_num JOIN part ON sp.p_num = part.p_num;

-- Show all data via view created in the previous question. --
SELECT * FROM PartSupplierQty;

-- Using the view you just created, try updating the quantity of pliers supplied by Smith to 2000. Were you successful? Was the change applied to the base table? --
UPDATE PartSupplierQty SET qty = 2000 WHERE sname = "Smith" AND pname = "pliers";
SELECT * FROM PartSupplierQty;
SELECT * FROM sp;
-- Yes, it was successful and yes it was applied to the base table. --

-- Create a view that shows all supplier data with the corresponding rows in the sp table (if there are any). --
CREATE VIEW AllSupplierWithAllSp AS SELECT supplier.s_num, sname, status, city, sp.p_num, sp.qty FROM supplier LEFT JOIN sp ON supplier.s_num = sp.s_num ORDER BY s_num;
SELECT * FROM AllSupplierWithAllSp;

-- Try inserting a new supplier via the view you created in the previous question. Were you successful? Can you delete or update the record via your view? --
INSERT INTO AllSupplierWithAllSp (s_num, sname, status, city) VALUES ('s7', 'Nate', 1, 'Beaverton');
-- This was not successful, but I was confused why and its because the view was created with a join and that makes the view not updatable --

-- Show the query used to create the first view you created (using the show command) --
SHOW CREATE VIEW PartSupplierQty;

-- Explain why/when it is helpful to use views. --
-- It is useful to use a view because you only need to write a confusing query once and acts as like a save point. Also it's good because it acts
-- like a view only document, where if someone doesn't want you to change or see the real database you can still have what you need views. It's
-- also good because if you need to keep typing out the same query multiple times you can write it once and just call the view instead.

-- End week 9 --
