/*
Purpose:
Granular view of reorder behavior at aisle level.
Used for category management insights.
*/

SELECT
    dp.aisle,
    COUNT(*) AS order_lines,
    ROUND(AVG(f.reordered)::NUMERIC, 4) AS reorder_rate
FROM fact_order_products f
JOIN dim_products dp USING (product_id)
GROUP BY 1
HAVING COUNT(*) > 5000
ORDER BY reorder_rate DESC;
