-- Review Analysis 

-- What is the overall customer satisfaction score?
SELECT
    ROUND(AVG(review_score),2) AS average_review_score
FROM order_reviews;

-- How are customer ratings distributed?
SELECT
    review_score,
    COUNT(*) AS total_reviews,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) AS percentage
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- Which product categories receive the highest customer ratings?
SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(DISTINCT r.review_id) AS total_reviews
FROM order_reviews r
JOIN order_items oi
ON r.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
HAVING COUNT(DISTINCT r.review_id) >= 20
ORDER BY average_rating DESC;

-- Which product categories require quality improvement?
SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(DISTINCT r.review_id) AS total_reviews
FROM order_reviews r
JOIN order_items oi
ON r.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
HAVING COUNT(DISTINCT r.review_id) >= 20
ORDER BY average_rating ASC;

-- Do delayed deliveries reduce customer satisfaction?
SELECT
    CASE
        WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date
        THEN 'On Time'
        ELSE 'Delayed'
    END AS delivery_status,
    ROUND(AVG(r.review_score),2) AS average_review_score,
    COUNT(*) AS total_orders
FROM orders o
JOIN order_reviews r
ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;

-- Which sellers consistently receive high customer ratings?
SELECT
    oi.seller_id,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items oi
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) >= 20
ORDER BY average_rating DESC
LIMIT 20;

-- Which sellers require performance improvement?
SELECT
    oi.seller_id,
    ROUND(AVG(r.review_score),2) AS average_rating,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items oi
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) >= 20
ORDER BY average_rating ASC
LIMIT 20;

-- How does delivery time influence customer ratings?
SELECT
    r.review_score,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS average_delivery_days
FROM orders o
JOIN order_reviews r
ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score DESC;

-- Provide an executive summary of customer reviews.
SELECT
    COUNT(*) AS total_reviews,
    ROUND(AVG(review_score),2) AS average_rating,
    MIN(review_score) AS lowest_rating,
    MAX(review_score) AS highest_rating,
    SUM(CASE WHEN review_score >= 4 THEN 1 ELSE 0 END) AS positive_reviews,
    SUM(CASE WHEN review_score <= 2 THEN 1 ELSE 0 END) AS negative_reviews
FROM order_reviews;