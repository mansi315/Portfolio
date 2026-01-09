CREATE TABLE dim_products AS
SELECT
  p.product_id,
  p.product_name,
  a.aisle,
  d.department
FROM products p
LEFT JOIN aisles a USING(aisle_id)
LEFT JOIN departments d USING(department_id);

CREATE TABLE fact_order_products AS
SELECT
  op.order_id,
  o.user_id,
  op.product_id,
  op.add_to_cart_order,
  op.reordered,
  o.order_number,
  o.order_dow,
  o.order_hour_of_day,
  COALESCE(o.days_since_prior_order,0) AS days_since_prior_order
FROM order_products_prior op
JOIN orders o USING(order_id);

select * from dim_products;
select * from fact_order_products;