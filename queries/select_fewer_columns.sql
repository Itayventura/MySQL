--instead of selecting all columns in the table
select *
from users

--select only phone number - if you just want to send sms to all users.
select phone_number
from users

--select less bytes is also faster
select integer_column
from users