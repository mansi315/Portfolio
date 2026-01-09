/*
Purpose:
Compare average basket size across days of the week.
*/

WITH order_basket AS (
    SELECT
        order_id,
        order_dow,
        COUNT(*) AS basket_size
    FROM fact_order_products
    GROUP BY 1, 2
)
SELECT
    order_dow,
    ROUND(AVG(basket_size)::NUMERIC, 2) AS avg_basket_size
FROM order_basket
GROUP BY 1
ORDER BY 1;
