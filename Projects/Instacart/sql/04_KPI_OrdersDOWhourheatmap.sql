/*
Purpose: To create base data for a heatmap showing order volume
by day of week and hour of day.
*/

SELECT
    f.order_dow,
    f.order_hour_of_day,
    COUNT(DISTINCT f.order_id) AS orders
FROM fact_order_products f
GROUP BY 1, 2
ORDER BY 1, 2;