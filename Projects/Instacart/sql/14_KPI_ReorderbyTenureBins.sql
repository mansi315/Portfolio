/*
Purpose:
Analyze reorder behavior by customer tenure.
Shows how repeat behavior evolves as customers mature.
*/

SELECT
    CASE
        WHEN f.order_number = 1 THEN '01 First Order'
        WHEN f.order_number BETWEEN 2 AND 5 THEN '02 Orders 2–5'
        WHEN f.order_number BETWEEN 6 AND 10 THEN '03 Orders 6–10'
        WHEN f.order_number BETWEEN 11 AND 20 THEN '04 Orders 11–20'
        ELSE '05 Orders 21+'
    END AS tenure_bin,

    COUNT(*) AS order_lines,
    ROUND(AVG(f.reordered)::NUMERIC, 4) AS reorder_rate
FROM fact_order_products f
GROUP BY 1
ORDER BY 1;
