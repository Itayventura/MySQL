CREATE UNIQUE INDEX users_phone_number_unique ON users (
  phone_number, (IF(active, 1, NULL))
);