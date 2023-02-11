WITH dataset_1 AS
(
SELECT * FROM table1
),
dataset_2 AS
(
SELECT * FROM table2
), united AS (
(select * from dataset_1) 
UNION
(select * from dataset_2)
), number_of_rows_united AS (
SELECT count(*) as c from united
), number_of_rows_dataset_1 AS (
SELECT count(*) as c from dataset_1
), number_of_rows_dataset_2 AS (
SELECT count(*) as c from dataset_2
)

SELECT 
CASE
    WHEN (ABS(number_of_rows_united.c - number_of_rows_dataset_1.c) +   ABS(number_of_rows_united.c - number_of_rows_dataset_2.c)) = 0 THEN 'The queries are equivalent'
    ELSE 'The queries are !!!NOT!!! equivalent'
END AS QuantityText,
(ABS(number_of_rows_united.c - number_of_rows_dataset_1.c) +   ABS(number_of_rows_united.c - number_of_rows_dataset_2.c)) as number_of_different_rows
from number_of_rows_united
join number_of_rows_dataset_1
join number_of_rows_dataset_2

