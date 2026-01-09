CREATE TABLE orders (
  order_id INT,
  user_id INT,
  eval_set TEXT,
  order_number INT,
  order_dow INT,
  order_hour_of_day INT,
  days_since_prior_order FLOAT
);

CREATE TABLE order_products_prior (
  order_id INT,
  product_id INT,
  add_to_cart_order INT,
  reordered INT
);

CREATE TABLE order_products_train (
  order_id INT,
  product_id INT,
  add_to_cart_order INT,
  reordered INT
);

CREATE TABLE products (
  product_id INT,
  product_name TEXT,
  aisle_id INT,
  department_id INT
);

CREATE TABLE aisles (
  aisle_id INT,
  aisle TEXT
);

CREATE TABLE departments (
  department_id INT,
  department TEXT
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
  order_id               INT PRIMARY KEY,
  user_id                INT,
  eval_set               TEXT,
  order_number           INT,
  order_dow              INT,
  order_hour_of_day      INT,
  days_since_prior_order NUMERIC
);

select * from orders limit 5;

