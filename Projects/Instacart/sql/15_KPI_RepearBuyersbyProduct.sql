/*
Purpose:
--------
Calculate how many distinct users return to buy the same product again.
This is a stronger loyalty signal than line-level reorder rate.
*/

SELECT
    dp.product_id,
    dp.product_name,

    -- Number of users who reordered the product
    COUNT(DISTINCT CASE WHEN f.reordered = 1 THEN f.user_id END)
        AS repeat_buyers,

    -- Total number of users who ever purchased the product
    COUNT(DISTINCT f.user_id) AS total_buyers,

    -- Share of buyers who came back to reorder
    ROUND(
        COUNT(DISTINCT CASE WHEN f.reordered = 1 THEN f.user_id END)::NUMERIC
        / NULLIF(COUNT(DISTINCT f.user_id), 0),
        4
    ) AS repeat_buyer_rate
FROM fact_order_products f
JOIN dim_products dp USING (product_id)
GROUP BY 1, 2
HAVING COUNT(DISTINCT f.user_id) > 500
ORDER BY repeat_buyer_rate DESC, repeat_buyers DESC
LIMIT 50;
