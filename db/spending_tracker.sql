DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;


CREATE TABLE merchants(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL4 primary key,
  type VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 primary key,
  merchant_id INT8 references merchants(id) ON DELETE CASCADE,
  tag_id INT8 references tags(id) ON DELETE CASCADE,
  amount INT8
);
