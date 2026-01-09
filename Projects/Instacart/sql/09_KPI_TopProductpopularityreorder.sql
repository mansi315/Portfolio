/*
Purpose:
--------
Surface top-selling products along with their reorder behavior.
Useful for identifying hero SKUs.
*/

SELECT
    dp.product_id,
    dp.product_name,
    dp.department,
    dp.aisle,
    COUNT(*) AS order_lines,
    ROUND(AVG(f.reordered)::NUMERIC, 4) AS reorder_rate
FROM fact_order_products f
JOIN dim_products dp USING (product_id)
GROUP BY 1, 2, 3, 4
HAVING COUNT(*) > 3000
ORDER BY order_lines DESC
LIMIT 50;