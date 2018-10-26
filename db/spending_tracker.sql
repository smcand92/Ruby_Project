DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 primary key,
  type VARCHAR(255)
);

CREATE TABLE transactions(
  id primary key,
  merchant_id INT8 references merchants(id),
  tag_id INT8 references tags(id),
  amount INT8
);
