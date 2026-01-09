
SELECT
    dp.product_id,
    dp.product_name,
    dp.department,
    COUNT(*) AS order_lines,
    ROUND(AVG(f.reordered)::numeric, 4) AS reorder_rate
FROM fact_order_products f
JOIN dim_products dp USING(product_id)
GROUP BY 1,2,3
HAVING COUNT(*) > 2000;
