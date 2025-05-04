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
