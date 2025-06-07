-- Part 4 Final Project Implementation --

-- UPDATE Command --
UPDATE hole SET mando = TRUE WHERE hole_id = 524145;
SELECT * FROM hole WHERE hole_id = 524145;

-- DELETE Command --
DELETE FROM player WHERE player_id = 158217;
SELECT * FROM player;

-- Join --
SELECT hole_num, hole.course_id, ob FROM hole JOIN course ON hole.course_id = course.course_id WHERE c_name = 'Southern Oregon University (SOU) DGC' AND ob = TRUE ORDER BY hole_num;

-- Left / Right Join --
SELECT p_first_name, p_last_name, player_id, COUNT(DISTINCT game_id) AS "Amount of games played" FROM player LEFT JOIN game USING (player_id) GROUP BY player_id ORDER BY p_first_name;

-- Group by --
SELECT course_id, AVG(distance) FROM hole GROUP BY course_id;

-- Subquery --
SELECT d_name, COUNT(*) AS Count FROM disc JOIN throw USING (disc_id) JOIN game USING (game_id) WHERE player_id IN (SELECT player_id FROM player WHERE p_first_name = 'Julian' AND p_last_name = 'Loutzenhiser') GROUP BY d_name ORDER BY Count DESC;

-- Correlated subquery --
SELECT c.course_id, c.c_name, h.hole_num, h.distance FROM hole h JOIN course c ON h.course_id = c.course_id WHERE c_name IN
('Southern Oregon University (SOU) DGC', 'Emigrant Lake', 'Bear Creek Golf Course') AND h.distance = (SELECT MAX(h2.distance) FROM hole h2 WHERE h2.course_id = h.course_id) ORDER BY c_name;

-- View --
CREATE VIEW courseHoles AS SELECT course_id, c_name, hole_id, hole_num, par, distance, ob, mando FROM course JOIN hole USING(course_id);
SELECT * FROM courseHoles;

-- Built-in (non-aggregate) function --
SELECT LOWER(p_first_name) AS "First name", LOWER(p_last_name) AS "Last name" FROM player ORDER BY LOWER(p_first_name);

-- Relational Set Operators --
SELECT DISTINCT disc_id, d_name, weight FROM disc JOIN throw USING(disc_id) WHERE weight > 174;

-- End Part 4 Final Project Implementation --
