-- How many unique customers does the business have?
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers;

-- Which states have the largest customer base?
SELECT
    customer_state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- Which cities contribute the most customers?
SELECT
    customer_city,
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

-- How many new customers were acquired each month?
SELECT
    DATE_FORMAT(first_purchase, '%Y-%m') AS month,
    COUNT(*) AS new_customers
FROM (
    SELECT
        c.customer_unique_id,
        MIN(o.order_purchase_timestamp) AS first_purchase
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) AS customer_first_order
GROUP BY month
ORDER BY month;

-- How many customers purchased more than once?
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-Time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) AS customer_orders
GROUP BY customer_type;

-- What percentage of customers are repeat buyers?
SELECT
    ROUND(
        SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS repeat_purchase_rate
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) AS customer_orders;

-- Who are the highest-value customers?
SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value),2) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY c.customer_unique_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Which customers place the most orders?
SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC
LIMIT 10;

-- What percentage of customers come from each state?
SELECT
    customer_state,
    COUNT(*) AS customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customers),
        2
    ) AS customer_percentage
FROM customers
GROUP BY customer_state
ORDER BY customers DESC;