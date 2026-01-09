/*
Purpose:
--------
Understand ordering patterns by day of week.
Supports day-of-week demand analysis.
*/

SELECT
    f.order_dow,                         -- Day of week (0=Sunday, 6=Saturday)
    COUNT(DISTINCT f.order_id) AS orders
FROM fact_order_products f
GROUP BY 1
ORDER BY 1;
