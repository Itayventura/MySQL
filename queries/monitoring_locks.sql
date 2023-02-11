SELECT * FROM performance_schema.data_locks;

SELECT
    ENGINE_TRANSACTION_ID as trx_id,
    LOCK_DATA as row,
    OBJECT_NAME as `table`,
    LOCK_MODE,
    LOCK_STATUS
  FROM performance_schema.data_locks WHERE LOCK_TYPE='RECORD';
+--------+-----+--------+-----------+-------------+
| trx_id | row |  table | LOCK_MODE | LOCK_STATUS |
+--------+-----+--------+-----------+-------------+
|   3305 |   2 | report |         S |     GRANTED |
|   3305 |   2 | report |         X |     GRANTED |
|   3306 |   2 | report |         X |     WAITING |
+--------+-----+--------+-----------+-------------+

SELECT * FROM information_schema.innodb_trx;


SELECT
  waiting_trx_id,
  waiting_pid,
  waiting_query,
  blocking_trx_id,
  blocking_pid,
  blocking_query
FROM sys.innodb_lock_waits;

SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST;

SHOW FULL PROCESSLIST;

SELECT name,comment
FROM INFORMATION_SCHEMA.INNODB_METRICS
WHERE name IN ('lock_deadlocks','lock_timeouts','lock_deadlock_false_positives','lock_deadlock_rounds');

SELECT `count` FROM INFORMATION_SCHEMA.INNODB_METRICS
WHERE NAME="lock_deadlocks";

SHOW open tables WHERE in_use > 0;