-- 1. Filter and sort completed orders using SELECT, WHERE, and ORDER BY
SELECT
    order_id,
    customer_id,
    order_date,
    order_status
FROM orders
WHERE order_status = 'Completed'
ORDER BY order_date DESC, order_id ASC;

-- 2. Retrieve customer order and item details using JOINs
SELECT
    o.order_id,
    o.order_date,
    c.full_name AS customer_name,
    c.city,
    p.product_name,
    p.category,
    oi.quantity,
    oi.line_total
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
ORDER BY o.order_date DESC;

-- 3. Category-wise sales report using GROUP BY and aggregate functions
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(AVG(oi.line_total), 2) AS avg_item_revenue,
    SUM(oi.line_total) AS total_sales_revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_sales_revenue DESC;

-- 4. Customer-wise spending summary using GROUP BY and aggregate functions
SELECT
    c.customer_id,
    c.full_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS completed_orders,
    SUM(oi.line_total) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.full_name, c.city
ORDER BY total_spent DESC;

-- 5. High-revenue product categories using GROUP BY and HAVING
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.line_total) AS total_sales_revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
HAVING SUM(oi.line_total) > 3000.00
ORDER BY total_sales_revenue DESC;

-- 6. Customers spending above average completed order value using a subquery
SELECT
    c.customer_id,
    c.full_name,
    c.city,
    SUM(oi.line_total) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.full_name, c.city
HAVING SUM(oi.line_total) > (
    SELECT AVG(order_total)
    FROM (
        SELECT
            o2.order_id,
            SUM(oi2.line_total) AS order_total
        FROM orders o2
        INNER JOIN order_items oi2
            ON o2.order_id = oi2.order_id
        WHERE o2.order_status = 'Completed'
        GROUP BY o2.order_id
    ) completed_orders
)
ORDER BY total_spent DESC;

