-- Executive Business Insights

-- Which product categories contribute the most revenue? (Top 10 Product Categories by Revenue)
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Which categories contribute the least revenue? (Bottom 10 Product Categories by Revenue)
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue ASC
LIMIT 10; 

-- Which customer states generate the highest revenue? (Top 10 States by Revenue)
SELECT
    c.customer_state,
    ROUND(SUM(op.payment_value),2) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC
LIMIT 10;

-- Which states are financially important but have poor review scores? ( States with High Revenue but Low Customer Satisfaction)
SELECT
    c.customer_state,
    ROUND(SUM(op.payment_value),2) AS total_revenue,
    ROUND(AVG(r.review_score),2) AS average_review
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
JOIN order_reviews r
ON o.order_id = r.order_id
GROUP BY c.customer_state
HAVING AVG(r.review_score) < 4
ORDER BY total_revenue DESC;

-- Which high-revenue categories have poor customer satisfaction? ( Product Categories with High Revenue but Low Ratings)
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue,
    ROUND(AVG(r.review_score),2) AS average_rating
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY p.product_category_name
HAVING SUM(oi.price) > (
    SELECT AVG(category_revenue)
    FROM (
        SELECT SUM(price) AS category_revenue
        FROM order_items oi2
        JOIN products p2
        ON oi2.product_id = p2.product_id
        GROUP BY p2.product_category_name
    ) x
)
AND AVG(r.review_score) < 4
ORDER BY revenue DESC;

-- Which top-revenue sellers have below-average ratings? (Top Sellers with Poor Ratings)
SELECT
    oi.seller_id,
    ROUND(SUM(oi.price),2) AS revenue,
    ROUND(AVG(r.review_score),2) AS average_rating
FROM order_items oi
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY oi.seller_id
HAVING AVG(r.review_score) < 4
ORDER BY revenue DESC
LIMIT 10;

-- Who are the most valuable customers? (High-Value Customers)
SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(op.payment_value),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 20;

-- Which payment method contributes the most revenue? (Most Profitable Payment Method)
SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS revenue
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;

-- How are revenue, orders, and average order value changing each month?
SELECT
    DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(op.payment_value),2) AS revenue,
    ROUND(SUM(op.payment_value)/COUNT(DISTINCT o.order_id),2) AS average_order_value
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;