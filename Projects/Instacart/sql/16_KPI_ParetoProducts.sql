/*
Purpose:
Perform a Pareto (80/20) analysis to identify products
that drive the majority of order volume.
*/

WITH product_volume AS (
    SELECT
        product_id,
        COUNT(*) AS order_lines
    FROM fact_order_products
    GROUP BY 1
),
ranked_products AS (
    SELECT
        product_id,
        order_lines,
        SUM(order_lines) OVER (ORDER BY order_lines DESC) AS cumulative_lines,
        SUM(order_lines) OVER () AS total_lines
    FROM product_volume
)
SELECT
    r.product_id,
    dp.product_name,
    r.order_lines,
    ROUND(
        r.cumulative_lines::NUMERIC / r.total_lines,
        4
    ) AS cumulative_share
FROM ranked_products r
JOIN dim_products dp USING (product_id)
ORDER BY r.order_lines DESC;