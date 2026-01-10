Tableau Dashboards — Instacart Market Basket Analysis

This folder contains Tableau dashboards created as part of the Instacart Market Basket Analysis project. The dashboards are designed to provide both executive-level summaries and product-focused insights into customer ordering behavior and reorder patterns.

Interactive dashboards are hosted on Tableau Public, while this repository includes screenshots and documentation for quick review.
https://public.tableau.com/app/profile/mansi.patel8560/vizzes

---------

1. Executive Overview Dashboard

Purpose
Provides a high-level view of overall customer demand and shopping behavior on the Instacart platform.

Key Metrics
- Total Orders
- Total Customers
- Average Basket Size
- Reorder Rate

Key Insights
- Identifies peak ordering times by day of week and hour of day
- Highlights overall demand intensity and shopping cadence
- Enables stakeholders to quickly understand *when* customers are most active

Business Value
Supports decisions related to:

- Marketing and promotion timing
- Workforce planning
- Platform performance monitoring

Live Dashboard:
[https://public.tableau.com/app/profile/mansi.patel8560/viz/InstacartMarketBasketAnalysis_17674799393820/ExecutiveOverview](https://public.tableau.com/app/profile/mansi.patel8560/viz/InstacartMarketBasketAnalysis_17674799393820/ExecutiveOverview)

---------

2. Reorder Insights Dashboard

Purpose
Analyzes product and department-level reorder behavior to distinguish between high-loyalty and low-repeat items.

Key Metrics
- Product-level Reorder Rate
- Order Line Volume (Popularity)
- Department-level Reorder Performance

Key Insights

- Identifies “sticky” products with strong repeat purchase behavior
- Highlights trial-heavy items with low reorder rates
- Compares product popularity against reorder likelihood to uncover assortment opportunities

Business Value
Supports decisions related to:

- Product assortment optimization
- Promotion targeting
- Customer retention strategies

Live Dashboard:
[https://public.tableau.com/app/profile/mansi.patel8560/viz/InstacartMarketBasketAnalysis_17674799393820/ReorderInsights](https://public.tableau.com/app/profile/mansi.patel8560/viz/InstacartMarketBasketAnalysis_17674799393820/ReorderInsights)

------------

Design & Technical Notes
- Dashboards are built on SQL-aggregated datasets to ensure performance and metric consistency.
- Raw Instacart datasets are intentionally excluded from this repository due to size and best practices.
- Visual design emphasizes clarity, minimal clutter, and executive readability.

------------

Tools Used
- Tableau Public
- PostgreSQL (SQL aggregations)
- pgAdmin 4

-----------

How to Use This Folder

- Review screenshots for a quick overview of insights
- Use Tableau Public links to explore dashboards interactively
- Refer to SQL queries in the `sql/` folder for metric definitions
