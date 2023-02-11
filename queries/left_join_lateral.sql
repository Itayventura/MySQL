SELECT users.id, users.first_name, users.last_name, transactions.*
FROM users
LEFT JOIN LATERAL (
    SELECT *
    FROM transactions
    WHERE transactions.user_id = users.id
    ORDER BY created_at DESC
    LIMIT 10
) AS recent_transactions ON recent_transactions.user_id = users.id;