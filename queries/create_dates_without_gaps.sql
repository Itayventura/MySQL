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