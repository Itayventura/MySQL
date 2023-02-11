SET cte_max_recursion_depth = 10000000;
INSERT INTO users (firstname, lastname)
WITH RECURSIVE counter(n) AS(
 SELECT 1 AS n
 UNION ALL
 SELECT n + 1 FROM counter WHERE n < 100000 )

SELECT CONCAT('test_firstname_', counter.n), CONCAT('test_lastname_', counter.n)
FROM counter;