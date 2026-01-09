/*
Purpose:
--------
Create a one-row executive KPI summary for the Instacart dataset.
This query powers the top KPI tiles in the Tableau dashboard.

Grain:
------
Entire dataset (line-item level aggregated to order & customer level KPIs)
*/

SELECT
    -- Total number of unique orders placed
    COUNT(DISTINCT f.order_id) AS total_orders,

    -- Total number of unique customers
    COUNT(DISTINCT f.user_id) AS total_customers,

    -- Total number of order-product line items
    COUNT(*) AS total_order_lines,

    -- Number of distinct products purchased across all orders
    COUNT(DISTINCT f.product_id) AS unique_products_purchased,

    -- Average number of items per order (basket size)
    ROUND(
        COUNT(*)::NUMERIC / NULLIF(COUNT(DISTINCT f.order_id), 0),
        2
    ) AS avg_basket_size_items,

    -- Line-level reorder rate (percentage of items that were reorders)
    ROUND(AVG(f.reordered)::NUMERIC, 4) AS reorder_rate_line_level,

    -- Percentage of orders that contain at least one reordered item
    ROUND(
        COUNT(DISTINCT CASE WHEN f.reordered = 1 THEN f.order_id END)::NUMERIC
        / NULLIF(COUNT(DISTINCT f.order_id), 0),
        4
    ) AS pct_orders_with_any_reorder,

    -- Percentage of customers whose first order appears in the dataset
    ROUND(
        COUNT(DISTINCT CASE WHEN f.order_number = 1 THEN f.user_id END)::NUMERIC
        / NULLIF(COUNT(DISTINCT f.user_id), 0),
        4
    ) AS pct_customers_first_order_present

FROM fact_order_products f;
