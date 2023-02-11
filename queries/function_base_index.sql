CREATE INDEX users_email_lower ON users (lower(first_name));
SELECT * FROM users WHERE lower(first_name) = 'email@gmail.com';