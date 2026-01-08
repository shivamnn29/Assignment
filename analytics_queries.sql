Monthly Sales Drill-Down Analysis

SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
    CONCAT('Q', EXTRACT(QUARTER FROM o.order_date)) AS quarter,
    TO_CHAR(o.order_date, 'Month') AS month_name,
    SUM(oi.quantity * oi.price) AS total_sales,
    SUM(oi.quantity) AS total_quantity
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE EXTRACT(YEAR FROM o.order_date) = 2024
GROUP BY
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(QUARTER FROM o.order_date),
    TO_CHAR(o.order_date, 'Month'),
    EXTRACT(MONTH FROM o.order_date)
ORDER BY
    year,
    EXTRACT(QUARTER FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date);


Query 2: Product Performance Analysis

SELECT
    p.product_name,
    p.category,
    SUM(fs.quantity) AS units_sold,
    SUM(fs.quantity * fs.unit_price) AS revenue,
    ROUND(
        (SUM(fs.quantity * fs.unit_price)
         / SUM(SUM(fs.quantity * fs.unit_price)) OVER ()) * 100,
        2
    ) AS revenue_percentage
FROM fact_sales fs
JOIN dim_product p
    ON fs.product_id = p.product_id
GROUP BY
    p.product_name,
    p.category
ORDER BY
    revenue DESC;


Query 3: Customer Segmentation Analysis

SELECT
    CASE
        WHEN total_spent > 50000 THEN 'High Value'
        WHEN total_spent BETWEEN 20000 AND 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_revenue_per_customer
FROM customer_spending
GROUP BY
    customer_segment
ORDER BY
    total_revenue DESC

WITH customer_spending AS (
    SELECT
        c.customer_id,
        SUM(fs.quantity * fs.unit_price) AS total_spent
    FROM fact_sales fs
    JOIN dim_customer c
        ON fs.customer_id = c.customer_id
    GROUP BY
        c.customer_id);


