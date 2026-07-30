-- Payment Analysis --

-- Which payment methods are most frequently used by customers?
SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

-- Which payment methods generate the highest revenue?
SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- Do customers using different payment methods spend differently?
SELECT
    payment_type,
    ROUND(AVG(payment_value),2) AS average_order_value
FROM order_payments
GROUP BY payment_type
ORDER BY average_order_value DESC;

-- How many customers choose installment payments?
SELECT
    payment_installments,
    COUNT(*) AS total_orders
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments;

-- Do higher installment plans correspond to higher-value purchases?
SELECT
    payment_installments,
    ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments;

-- Which installment plans contribute the most revenue?
SELECT
    payment_installments,
    ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments
GROUP BY payment_installments
ORDER BY total_revenue DESC;

-- Does customer satisfaction vary by payment method?
SELECT
    p.payment_type,
    ROUND(AVG(r.review_score),2) AS average_review_score,
    COUNT(DISTINCT p.order_id) AS total_orders
FROM order_payments p
JOIN order_reviews r
    ON p.order_id = r.order_id
GROUP BY p.payment_type
ORDER BY average_review_score DESC;

-- Does delivery performance differ across payment methods?
SELECT
    p.payment_type,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days
FROM order_payments p
JOIN orders o
    ON p.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY p.payment_type
ORDER BY avg_delivery_days;

-- How does payment method usage change over time?
SELECT
    DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
    p.payment_type,
    ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY month, p.payment_type
ORDER BY month, revenue DESC;

-- Provide an overall summary of payment performance.
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value),2) AS total_revenue,
    ROUND(AVG(payment_value),2) AS average_payment,
    MAX(payment_value) AS highest_payment,
    MIN(payment_value) AS lowest_payment
FROM order_payments;
