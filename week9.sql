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

-- What field should you add to the select statement above to check your results? Check your results carefully. --

-- Look up a SQL function of your choice, explain what it does, and provide an example. --

-- Provide a listing of suppliers and parts that are located in Portland using a relational operator. --

-- Provide a list of all suppliers who are open (at any given time) combined with a list of suppliers who are located in New York. If a supplier is open and located in New York they should appear in the list twice. --

-- List suppliers by name that supply at least 2 different parts. List suppliers by name that supply at least 2 different parts. --

-- List suppliers by name that supply at least 3 different parts and are also located in Portland using a relational operator. --

-- List suppliers by name that supply at least 3 different parts and are not currently open using relational operators. --

-- Create a view that shows all parts with names of suppliers and quantities for each part they supply. --
CREATE VIEW PartSupplierQty AS SELECT sname, pname, qty FROM sp JOIN supplier ON sp.s_num = supplier.s_num JOIN part ON sp.p_num = part.p_num;

-- Show all data via view created in the previous question. --
SELECT * FROM PartSupplierQty;

-- Using the view you just created, try updating the quantity of pliers supplied by Smith to 2000. Were you successful? Was the change applied to the base table? --

-- Create a view that shows all supplier data with the corresponding rows in the sp table (if there are any). --

-- Try inserting a new supplier via the view you created in the previous question. Were you successful? Can you delete or update the record via your view? --

-- Show the query used to create the first view you created (using the show command) --

-- Explain why/when it is helpful to use views. --

-- End week 9 --
