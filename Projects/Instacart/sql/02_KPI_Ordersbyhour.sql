/*
Purpose:
--------
Analyze when customers place orders throughout the day.
Used for "Orders by Hour" bar chart in Tableau.
*/

SELECT
    f.order_hour_of_day,                 -- Hour of day (0–23)
    COUNT(DISTINCT f.order_id) AS orders -- Unique orders per hour
FROM fact_order_products f
GROUP BY 1
ORDER BY 1;
