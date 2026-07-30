-- Seller Analysis -- 


-- How many sellers are registered on the platform?
SELECT
    COUNT(*) AS total_sellers
FROM sellers;

-- Which states have the highest number of sellers?
SELECT
    seller_state,
    COUNT(*) AS total_sellers
FROM sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- Which sellers receive the most orders?
SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_items
GROUP BY seller_id
ORDER BY total_orders DESC
LIMIT 10;

-- Which sellers have sold the highest number of products?
SELECT
    seller_id,
    COUNT(*) AS products_sold
FROM order_items
GROUP BY seller_id
ORDER BY products_sold DESC
LIMIT 10;

-- Which sellers have the highest average order value?
SELECT
    seller_id,
    ROUND(AVG(price),2) AS average_order_value
FROM order_items
GROUP BY seller_id
ORDER BY average_order_value DESC
LIMIT 10;

-- Which sellers charge the highest average freight?
SELECT
    seller_id,
    ROUND(AVG(freight_value),2) AS average_freight
FROM order_items
GROUP BY seller_id
ORDER BY average_freight DESC
LIMIT 10;

-- Which sellers receive the highest average review score?
SELECT
    oi.seller_id,
    ROUND(AVG(r.review_score),2) AS average_rating
FROM order_items oi
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) >= 20
ORDER BY average_rating DESC
LIMIT 10;

-- Who is the highest revenue-generating seller in each state?
WITH seller_revenue AS (
    SELECT
        s.seller_state,
        oi.seller_id,
        SUM(oi.price) AS revenue,
        RANK() OVER (
            PARTITION BY s.seller_state
            ORDER BY SUM(oi.price) DESC
        ) AS seller_rank
    FROM sellers s
    JOIN order_items oi
        ON s.seller_id = oi.seller_id
    GROUP BY s.seller_state, oi.seller_id
)

SELECT
    seller_state,
    seller_id,
    ROUND(revenue,2) AS revenue
FROM seller_revenue
WHERE seller_rank = 1
ORDER BY revenue DESC;

-- How are sellers distributed across revenue bands?
SELECT
    CASE
        WHEN revenue < 1000 THEN 'Low Revenue'
        WHEN revenue BETWEEN 1000 AND 5000 THEN 'Medium Revenue'
        WHEN revenue BETWEEN 5001 AND 10000 THEN 'High Revenue'
        ELSE 'Very High Revenue'
    END AS revenue_band,
    COUNT(*) AS total_sellers
FROM (
    SELECT
        seller_id,
        SUM(price) AS revenue
    FROM order_items
    GROUP BY seller_id
) AS seller_summary
GROUP BY revenue_band
ORDER BY total_sellers DESC;