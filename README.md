# Tips and Tricks

- [How to insert a lot of test data](queries/fill_in_test_data.sql)
- [Find unused indices in Schema](queries/find_unused_indices.sql)
- [Create dates without gaps](queries/create_dates_without_gaps.sql)
- [Compare two datasets](queries/compare_two_datasets.sql)
- [Function based index](queries/function_based_index.sql)
- [ORDER BY nullable columns](queries/order_by_nullable_column.sql)
- [UNIQUE INDEX with excluded rows](queries/unique_index_excluded_rows.sql)
- [LEFT JOIN LATERAL](queries/left_join_lateral.sql) - can be used to fetch recent records of multiple users.
- [GROUP CONCAT](queries/group_concat.sql)
- [SELECT fewer columns](queries/select_fewer_columns.sql)

# Deadlocks & Locks

- [Monitoring Deadlocks & Locks](locking/monitoring_locks.sql)
- [SELECT FOR UPDATE](locking/select_for_update.sql)
- [SELECT FOR SHARE](locking/select_for_share.sql)

# Information Schema
- [Spot missing index](information_schema/missing_index.sql)
- [Database size](information_schema/database_size.sql)
- [Tables size](information_schema/tables_size.sql)
- [Columns size](information_schema/column_size.sql)
- [Count primary Keys](information_schema/count_primary_keys.sql)
- [Isolated tables](information_schema/isolated_tables.sql) - can be used to count referenced tables
- [Identify slow queries](information_schema/indentify_slow_queries.sql)
- [Number of tables](information_schema/number_of_tables.sql)
- [Table info](information_schema/table_info.sql)
- [Columns info](information_schema/column_info.sql)

# Show
- [CREATE TABLE STATEMENT](show/show_create_table.sql)
- [Databases](show/show_databases.sql)
- [Tables](show/show_tables.sql)
- [Columns](show/show_columns.sql)
- [Collations](show/show_collation.sql) - can be used to identify tables with wrong charsets
- [Variables](show/show_variables.sql)
- [Count errors](show/show_count_errors.sql)
- [Count Warnings](show/show_count_warnings.sql)
- [Errors](show/show_errors.sql)
- [Index](show/show_index.sql)
- [Table Status](show/show_table_status.sql)
- [Warnings](show/show_warnings.sql)

# References
- https://dev.mysql.com/doc/refman/8.0/en/
- https://vertabelo.com/blog/an-overview-of-mysqls-information-schema/
- https://vertabelo.com/blog/querying-mysqls-information-schema-why-how/
- https://www.sqlshack.com/learn-sql-the-information_schema-database/
- https://sqlfordevs.com/
- https://dev.mysql.com/doc/refman/5.7/en/show-collation.html
- http://youdidwhatwithtsql.com/spotting-missing-indexes-mariadb-mysql/2036/
- https://dev.mysql.com/doc/refman/8.0/en/lateral-derived-tables.html
- https://stackoverflow.com/questions/5836623/getting-lock-wait-timeout-exceeded-try-restarting-transaction-even-though-im