-- Views SQL --

-- Provides one row per order with key sales information. (Sales Summary)
CREATE OR REPLACE VIEW vw_sales_summary AS
SELECT
    o.order_id,
    o.customer_id,
    DATE(o.order_purchase_timestamp) AS purchase_date,
    ROUND(SUM(op.payment_value),2) AS order_value,
    COUNT(oi.order_item_id) AS total_items
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.customer_id,
    purchase_date;
    
-- Provides customer-level KPIs. (Customer Summary)
CREATE OR REPLACE VIEW vw_customer_summary AS
SELECT
    c.customer_unique_id,
    c.customer_state,
    c.customer_city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(op.payment_value),2) AS total_spent,
    ROUND(AVG(op.payment_value),2) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY
    c.customer_unique_id,
    c.customer_state,
    c.customer_city;
    
-- Provides product-level sales metrics. (Product Performance)
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    p.product_id,
    p.product_category_name,
    COUNT(*) AS units_sold,
    ROUND(SUM(oi.price),2) AS revenue,
    ROUND(AVG(oi.price),2) AS average_price
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_category_name;
    
-- Summarizes seller performance. (Seller Performance)
CREATE OR REPLACE VIEW vw_seller_performance AS
SELECT
    s.seller_id,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(*) AS products_sold,
    ROUND(SUM(oi.price),2) AS revenue,
    ROUND(AVG(oi.price),2) AS average_product_price
FROM sellers s
JOIN order_items oi
    ON s.seller_id = oi.seller_id
GROUP BY
    s.seller_id,
    s.seller_state;


-- 	Provides delivery KPIs. (Delivery Performance)
CREATE OR REPLACE VIEW vw_delivery_performance AS
SELECT
    order_id,
    customer_id,
    DATEDIFF(
        order_delivered_customer_date,
        order_purchase_timestamp
    ) AS delivery_days,
    CASE
        WHEN order_delivered_customer_date <= order_estimated_delivery_date
        THEN 'On Time'
        ELSE 'Delayed'
    END AS delivery_status
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Provides review details along with seller and product category.(Review Summary)
CREATE OR REPLACE VIEW vw_review_summary AS
SELECT
    r.review_id,
    r.order_id,
    r.review_score,
    p.product_category_name,
    oi.seller_id
FROM order_reviews r
JOIN order_items oi
    ON r.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;

-- Provides payment-related metrics.(Payment Summary)
CREATE OR REPLACE VIEW vw_payment_summary AS
SELECT
    payment_type,
    payment_installments,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value),2) AS revenue,
    ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments
GROUP BY
    payment_type,
    payment_installments;

-- Provides monthly KPIs.(Monthly Sales)
CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(op.payment_value),2) AS revenue,
    ROUND(SUM(op.payment_value) /
        COUNT(DISTINCT o.order_id),2) AS average_order_value
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;

-- Provides state-level business performance.(State Performance)
CREATE OR REPLACE VIEW vw_state_performance AS
SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(op.payment_value),2) AS revenue,
    ROUND(AVG(r.review_score),2) AS average_review_score,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS average_delivery_days
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
JOIN order_reviews r
    ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state;

-- Creating an order-level dataset with the most important dimensions for executive reporting. (Executive Dashboard)
CREATE OR REPLACE VIEW vw_executive_dashboard AS
SELECT
    o.order_id,
    DATE(o.order_purchase_timestamp) AS purchase_date,
    c.customer_state,
    c.customer_city,
    p.product_category_name,
    oi.seller_id,
    op.payment_type,
    op.payment_installments,
    oi.price,
    oi.freight_value,
    r.review_score,
    DATEDIFF(
        o.order_delivered_customer_date,
        o.order_purchase_timestamp
    ) AS delivery_days
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
JOIN order_payments op
    ON o.order_id = op.order_id
JOIN order_reviews r
    ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL;