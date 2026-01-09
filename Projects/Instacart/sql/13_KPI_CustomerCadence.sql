/*
Purpose:
Measure how frequently customers place orders.
This helps model customer cadence and inactivity risk.
*/

SELECT
    f.user_id,
    ROUND(AVG(NULLIF(f.days_since_prior_order, 0))::NUMERIC, 2)
        AS avg_days_between_orders,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM fact_order_products f
GROUP BY 1
HAVING COUNT(DISTINCT f.order_id) >= 5
ORDER BY avg_days_between_orders;
