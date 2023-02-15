# let say you have an order table, and you have a running_number column which counts the order number for each user.
# in that case, you need to execute an insert select query instead of a flatten insert query. if you run several of those queries
# concurrently, you will probably receive a deadlock, because this query locks the orders table for a lot of time.
# especially if the order table contains a lot of data.
# your query will probably look like this:

INSERT INTO orders (order_id, created_at, user_id, amount, currency, running_number)
VALUES (
	0x46974DFC99D34859B603FC10D1CF356E,
	now(),
	0x46974DFC99D348591A03FC10D1CF356E,
	150.0,
	4,
	(
		SELECT count(*) + 1
		FROM (
		    SELECT user_id
		    FROM orders) x
		WHERE x.user_id = x46974DFC99D348591A03FC10D1CF356E
	)

);

# instead, you can drop the running_number column, and calculate the running_number whenever you need it
# with a use of window functions. in that case you can have a flatten INSERT query that locks the table for a minimal amount of time
SELECT ROW_NUMBER() OVER (ORDER BY date) row_num
FROM orders
WHERE user_id = x46974DFC99D348591A03FC10D1CF356E
ORDER BY row_num DESC
LIMIT 1
