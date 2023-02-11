SELECT 'created_at', sum(char_length(date))/1024/1024 as date_size_MB
FROM users