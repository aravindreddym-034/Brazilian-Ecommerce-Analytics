-- Product Analysis --

-- Which products have been sold the most?
SELECT
    product_id,
    COUNT(*) AS units_sold
FROM order_items
GROUP BY product_id
ORDER BY units_sold DESC
LIMIT 10;

-- Which products generate the highest revenue?
SELECT
    product_id,
    ROUND(SUM(price),2) AS total_revenue
FROM order_items
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Which categories generate the highest revenue?
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;

-- Which product categories are the most popular?
SELECT
    p.product_category_name,
    COUNT(*) AS units_sold
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY units_sold DESC
LIMIT 10;

-- Which categories have the highest average selling price?
SELECT
    p.product_category_name,
    ROUND(AVG(oi.price),2) AS average_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY average_price DESC;

-- Which product categories incur the highest freight charges?
SELECT
    p.product_category_name,
    ROUND(AVG(oi.freight_value),2) AS average_freight
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY average_freight DESC;

-- Which categories contain the heaviest products?
SELECT
    product_category_name,
    ROUND(AVG(product_weight_g),2) AS average_weight_g
FROM products
GROUP BY product_category_name
ORDER BY average_weight_g DESC;

-- What percentage of total revenue does each category contribute?
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price),2) AS revenue,
    ROUND(
        SUM(oi.price) * 100 /
        (SELECT SUM(price) FROM order_items),
        2
    ) AS revenue_percentage
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;

-- Which product categories receive the highest customer ratings?
SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score),2) AS average_review_score
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY average_review_score DESC;

-- Which product categories have the lowest customer satisfaction?
SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score),2) AS average_review_score
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY average_review_score ASC
LIMIT 10;

-- Which categories contribute the most to both revenue and order volume?
SELECT
    p.product_category_name,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price),2) AS total_revenue,
    ROUND(AVG(oi.price),2) AS average_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;

-- Which product categories receive the highest customer ratings?
SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score),2) AS average_review_score
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
JOIN order_reviews r
ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY average_review_score DESC;

-- Are there products in the catalog that have never been sold?
SELECT
    p.product_id,
    p.product_category_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;