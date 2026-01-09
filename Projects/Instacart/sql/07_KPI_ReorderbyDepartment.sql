/*
Purpose:
Identify which departments drive repeat purchases.
This is a key retention and assortment metric.
*/

SELECT
    dp.department,
    COUNT(*) AS order_lines,                  -- Volume indicator
    ROUND(AVG(f.reordered)::NUMERIC, 4) AS reorder_rate
FROM fact_order_products f
JOIN dim_products dp USING (product_id)
GROUP BY 1
-- Filter out low-volume departments for stability
HAVING COUNT(*) > 10000
ORDER BY reorder_rate DESC;