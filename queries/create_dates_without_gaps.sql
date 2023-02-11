SET cte_max_recursion_depth = 1000000;

WITH RECURSIVE dates_without_gaps(day) AS (
    SELECT DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY) as day
    UNION ALL
    SELECT DATE_ADD(day, INTERVAL 1 DAY) as day
    FROM dates_without_gaps
    WHERE day < CURRENT_DATE
)
SELECT dates_without_gaps.day, COALESCE(SUM(statistics.count), 0)
FROM dates_without_gaps
LEFT JOIN statistics ON(statistics.day = dates_without_gaps.day)
GROUP BY dates_without_gaps.day;


WITH RECURSIVE dates_without_gaps_recursive AS
(
	SELECT '2022-01-01' AS day
	UNION ALL
	SELECT DATE_ADD(day, INTERVAL 1 day ) AS day
	FROM dates_without_gaps_recursive
	WHERE day < '2023-01-01'
)
SELECT day AS date, 0.00 AS deposit_amount
FROM dates_without_gaps_recursive
WHERE day < '2023-01-01';

WITH RECURSIVE counter_without_gapes AS
(
	SELECT 0 AS counter
	UNION ALL
	SELECT counter + 1 AS counter
	FROM counter_without_gapes
	WHERE counter < 120
)

SELECT counter
FROM counter_without_gapes
WHERE counter < 120;