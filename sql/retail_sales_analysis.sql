-- ============================================================
-- Retail Sales Analytics: SQL queries
-- Dataset: Sample Superstore (9,994 rows)
-- Table assumed: superstore
-- If your table has a different name, replace `superstore` below.
-- Column names with spaces or hyphens are wrapped in backticks.
-- ============================================================


-- Q1. Overall performance
SELECT
    ROUND(SUM(Sales), 2)                      AS total_sales,
    ROUND(SUM(Profit), 2)                     AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 1)  AS profit_margin_pct,
    COUNT(DISTINCT `Order ID`)                AS orders,
    COUNT(DISTINCT `Customer ID`)             AS customers
FROM superstore;


-- Q2. Which regions generate the most sales and profit?
SELECT
    Region,
    ROUND(SUM(Sales), 2)                      AS sales,
    ROUND(SUM(Profit), 2)                     AS profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 1)  AS margin_pct,
    ROUND(AVG(Discount) * 100, 1)             AS avg_discount_pct
FROM superstore
GROUP BY Region
ORDER BY profit DESC;


-- Q3. Which categories are most profitable?
SELECT
    Category,
    ROUND(SUM(Sales), 2)                      AS sales,
    ROUND(SUM(Profit), 2)                     AS profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 1)  AS margin_pct
FROM superstore
GROUP BY Category
ORDER BY profit DESC;


-- Q4. Which sub-categories lose money?
SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2)                      AS sales,
    ROUND(SUM(Profit), 2)                     AS profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 1)  AS margin_pct,
    ROUND(AVG(Discount) * 100, 1)             AS avg_discount_pct
FROM superstore
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY profit;


-- Q5. How do discounts affect profitability?
SELECT
    CASE
        WHEN Discount = 0   THEN '1. None'
        WHEN Discount <= 0.1 THEN '2. Up to 10%'
        WHEN Discount <= 0.2 THEN '3. 10% to 20%'
        WHEN Discount <= 0.3 THEN '4. 20% to 30%'
        WHEN Discount <= 0.5 THEN '5. 30% to 50%'
        ELSE                      '6. Over 50%'
    END                                       AS discount_band,
    COUNT(*)                                  AS orders,
    ROUND(SUM(Sales), 2)                      AS sales,
    ROUND(SUM(Profit), 2)                     AS profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 1)  AS margin_pct
FROM superstore
GROUP BY discount_band
ORDER BY discount_band;


-- Q6. How much profit do heavily discounted orders (over 20%) cost the business?
SELECT
    CASE WHEN Discount > 0.2 THEN 'Over 20% discount' ELSE '20% or less' END AS group_name,
    COUNT(*)              AS orders,
    ROUND(SUM(Sales), 2)  AS sales,
    ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY group_name;


-- Q7. Which ten states are the least profitable, and how heavily do they discount?
SELECT
    State,
    ROUND(SUM(Sales), 2)          AS sales,
    ROUND(SUM(Profit), 2)         AS profit,
    ROUND(AVG(Discount) * 100, 1) AS avg_discount_pct
FROM superstore
GROUP BY State
ORDER BY profit
LIMIT 10;


-- Q8. Rank sub-categories by profit within each category (window function)
SELECT
    Category,
    `Sub-Category`,
    ROUND(SUM(Profit), 2) AS profit,
    RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS rank_in_category
FROM superstore
GROUP BY Category, `Sub-Category`
ORDER BY Category, rank_in_category;


-- Q9. Who are the top 10 customers by sales, and are they profitable?
SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2)  AS sales,
    ROUND(SUM(Profit), 2) AS profit
FROM superstore
GROUP BY `Customer Name`
ORDER BY sales DESC
LIMIT 10;


-- Q10. Share of total profit by category (subquery)
SELECT
    Category,
    ROUND(SUM(Profit), 2) AS profit,
    ROUND(SUM(Profit) * 100.0 / (SELECT SUM(Profit) FROM superstore), 1) AS pct_of_total_profit
FROM superstore
GROUP BY Category
ORDER BY profit DESC;
