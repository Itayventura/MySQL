SET @table_schema = "my_db";

SELECT

    tab.TABLE_NAME,
    COUNT(*) AS PRI_number

FROM INFORMATION_SCHEMA.TABLES tab
LEFT JOIN (
    SELECT

        INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA,
        INFORMATION_SCHEMA.COLUMNS.TABLE_NAME

    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA  = @table_schema
    AND INFORMATION_SCHEMA.COLUMNS.COLUMN_KEY = 'PRI'
) col
    ON tab.TABLE_SCHEMA = col.TABLE_SCHEMA
    AND tab.TABLE_NAME = col.TABLE_NAME
WHERE tab.TABLE_SCHEMA = @table_schema
GROUP BY
    tab.TABLE_NAME;