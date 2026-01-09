/*
Purpose:
Identify "sticky" products that customers frequently repurchase.
These items are strong candidates for retention and subscription features.
*/

SELECT
    dp.product_id,
    dp.product_name,
    dp.department,
    COUNT(*) AS order_lines,
    ROUND(AVG(f.reordered)::NUMERIC, 4) AS reorder_rate
FROM fact_order_products f
JOIN dim_products dp USING (product_id)
GROUP BY 1, 2, 3
HAVING COUNT(*) > 3000
   AND AVG(f.reordered) >= 0.60
ORDER BY reorder_rate DESC, order_lines DESC
LIMIT 50;
