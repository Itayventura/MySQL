SELECT
    `INFORMATION_SCHEMA`.`TABLES`.`TABLE_NAME`,
    `INFORMATION_SCHEMA`.`TABLES`.`TABLE_TYPE`,
    `INFORMATION_SCHEMA`.`TABLES`.`DATA_LENGTH`,
    `INFORMATION_SCHEMA`.`TABLES`.`INDEX_LENGTH`,
    `INFORMATION_SCHEMA`.`TABLES`.`CREATE_TIME`,
    `INFORMATION_SCHEMA`.`TABLES`.`UPDATE_TIME`,
    `INFORMATION_SCHEMA`.`TABLES`.`TABLE_COLLATION`,
    `INFORMATION_SCHEMA`.`TABLES`.`TABLE_COMMENT`
FROM
    `INFORMATION_SCHEMA`.`TABLES`
WHERE
    `INFORMATION_SCHEMA`.`TABLES`.`TABLE_SCHEMA` = "mmo_database";

SELECT table_name, table_rows, data_length, index_length, create_time, update_time, table_collation
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
ORDER BY table_name;