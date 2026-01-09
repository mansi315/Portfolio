/*
Purpose:
--------
Measure how basket size changes throughout the day.
This helps identify high-intent shopping windows.
*/

WITH order_basket AS (
    -- Calculate basket size per individual order
    SELECT
        order_id,
        order_hour_of_day,
        COUNT(*) AS basket_size
    FROM fact_order_products
    GROUP BY 1, 2
)
SELECT
    order_hour_of_day,
    ROUND(AVG(basket_size)::NUMERIC, 2) AS avg_basket_size
FROM order_basket
GROUP BY 1
ORDER BY 1;