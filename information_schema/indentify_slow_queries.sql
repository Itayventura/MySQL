SELECT *
FROM information_schema.PROCESSLIST
WHERE COMMAND != 'Sleep'
AND TIME > 4