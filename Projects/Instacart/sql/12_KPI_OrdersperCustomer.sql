/*
Purpose:
Understand customer loyalty distribution by number of orders placed.
Useful for segmentation and retention analysis.
*/

SELECT
    f.user_id,
    COUNT(DISTINCT f.order_id) AS orders_per_customer
FROM fact_order_products f
GROUP BY 1
ORDER BY orders_per_customer DESC;
