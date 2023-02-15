
# let say you have a two factor authentication in your app.
# and you want to persist the codes in your database.
# when you send the sms to the user, you insert a record to that table
# and when the user confirms, you update that table.

# so your table will look something like this:

show create table users_two_factor_authentication;

CREATE TABLE `users_two_factor_authentication` (
  `id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  `code` varchar(16) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `received` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

# but wait. there is a problem. user_id + code are not unique. a code consist of only 4 digits.
# so how can we update the correct record? we can take the last one.
UPDATE users_two_factor_authentication
  inner join
  (SELECT max(created_at) as created_at
  FROM users_two_factor_authentication
  WHERE user_id = x46974DFC99D348591A03FC10D1CF356E) last_code on users_two_factor_authentication.created_at = last_code.created_at
SET received = 1
WHERE code LIKE '5632' AND (received = 0 OR received IS NULL)

# but that query will cause lots of deadlocks. self join in an update query is bad.
# can we do better?
UPDATE users_two_factor_authentication
SET received = 1
WHERE user_id = x46974DFC99D348591A03FC10D1CF356E
AND code = '5632'
AND (received = 0 OR received IS NULL)
ORDER by date DESC
LIMIT 1

#and add a proper index.

ALTER TABLE `users_two_factor_authentication` ADD INDEX `users_two_factor_authentication_index` (`user_id`,`code`, `received`);

# GREAT! problem solved