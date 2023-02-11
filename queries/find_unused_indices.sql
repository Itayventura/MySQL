SELECT object_schema AS `database`, object_name AS `table`, index_name AS `index`, count_star as `io_operations`
FROM performance_schema.table_io_waits_summary_by_index_usage
WHERE object_schema NOT IN('mysql', 'performance_schema')
AND index_name IS NOT NULL
AND index_name != 'PRIMARY'
ORDER BY object_schema, object_name, index_name;
