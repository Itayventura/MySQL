-- NULL values placed first
SELECT * FROM users ORDER BY first_name ASC;
SELECT * FROM users ORDER BY first_name IS NOT NULL, first_name ASC;

-- NULL values placed last
SELECT * FROM users ORDER BY first_name IS NULL, first_name ASC;