-- Delivery Analysis --

-- What is the average number of days taken to deliver an order?
SELECT
    ROUND(
        AVG(DATEDIFF(order_delivered_customer_date,
                     order_purchase_timestamp)),
        2
    ) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- What is the average estimated delivery duration?
SELECT
    ROUND(
        AVG(DATEDIFF(order_estimated_delivery_date,
                     order_purchase_timestamp)),
        2
    ) AS avg_estimated_delivery_days
FROM orders;

-- How many orders were delivered on time versus delayed?
SELECT
    CASE
        WHEN order_delivered_customer_date <= order_estimated_delivery_date
        THEN 'On Time'
        ELSE 'Delayed'
    END AS delivery_status,
    COUNT(*) AS total_orders
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;

-- What percentage of orders are delivered on time?
SELECT
    ROUND(
        SUM(
            CASE
                WHEN order_delivered_customer_date <= order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS on_time_delivery_rate
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Which customer states experience the longest delivery times?
SELECT
    c.customer_state,
    ROUND(
        AVG(
            DATEDIFF(o.order_delivered_customer_date,
                     o.order_purchase_timestamp)
        ),
        2
    ) AS avg_delivery_days
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC;

-- Which states receive orders the fastest?
SELECT
    c.customer_state,
    ROUND(
        AVG(
            DATEDIFF(o.order_delivered_customer_date,
                     o.order_purchase_timestamp)
        ),
        2
    ) AS avg_delivery_days
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days ASC
LIMIT 10;

-- Which states receive orders the fastest?
SELECT
    c.customer_state,
    ROUND(
        AVG(
            DATEDIFF(o.order_delivered_customer_date,
                     o.order_purchase_timestamp)
        ),
        2
    ) AS avg_delivery_days
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days ASC
LIMIT 10;

-- Which sellers deliver products the fastest?
SELECT
    oi.seller_id,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) >= 20
ORDER BY avg_delivery_days ASC
LIMIT 10;

-- Which sellers have the slowest delivery performance?
SELECT
    oi.seller_id,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) >= 20
ORDER BY avg_delivery_days DESC
LIMIT 10;

-- Does longer delivery time lead to lower review scores?
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
    ) AS avg_delivery_days
FROM orders o
JOIN order_reviews r
ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score DESC;

-- Which product categories take the longest to deliver?
SELECT
    p.product_category_name,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY p.product_category_name
ORDER BY avg_delivery_days DESC;

-- Create a delivery KPI summary.
SELECT
    COUNT(*) AS total_delivered_orders,
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days,
    ROUND(
        SUM(
            CASE
                WHEN order_delivered_customer_date <= order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) * 100 / COUNT(*),
        2
    ) AS on_time_percentage
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Classify deliveries into delay bands.
SELECT
    CASE
        WHEN delay_days <= 0 THEN 'On Time / Early'
        WHEN delay_days BETWEEN 1 AND 3 THEN '1-3 Days Late'
        WHEN delay_days BETWEEN 4 AND 7 THEN '4-7 Days Late'
        ELSE 'More Than 7 Days Late'
    END AS delay_category,
    COUNT(*) AS total_orders
FROM (
    SELECT
        DATEDIFF(
            order_delivered_customer_date,
            order_estimated_delivery_date
        ) AS delay_days
    FROM orders
    WHERE order_delivered_customer_date IS NOT NULL
) AS delivery_summary
GROUP BY delay_category
ORDER BY total_orders DESC;

