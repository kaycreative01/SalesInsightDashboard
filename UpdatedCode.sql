SELECT SUM(t.amount) AS total_sales
FROM transactions t
JOIN date d ON t.date_id = d.date_id
WHERE d.date BETWEEN '2023-01-01' AND '2023-12-31';
SELECT DATE_FORMAT(d.date, '%Y-%m') AS month,
       SUM(t.amount) AS monthly_sales
FROM transactions t
JOIN date d ON t.date_id = d.date_id
WHERE d.date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY month
ORDER BY month;
SELECT SUM(t.amount) AS total_sales
FROM transactions t
JOIN date d ON t.date_id = d.date_id
WHERE d.date BETWEEN '2023-01-01' AND '2023-12-31';
SELECT
    product_category,
    SUM(sale_amount) / (SELECT SUM(sale_amount) FROM sales) * 100 AS sales_percentage
FROM sales
GROUP BY product_category;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sale_amount) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;
SELECT
    customer_id,
    SUM(sale_amount) AS total_customer_revenue
FROM sales
GROUP BY customer_id;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sale_amount) AS monthly_sales,
    LAG(SUM(sale_amount)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m')) AS prev_month_sales,
    (SUM(sale_amount) - LAG(SUM(sale_amount)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m'))) / LAG(SUM(sale_amount)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m')) * 100 AS sales_growth_rate
FROM sales
GROUP BY month
ORDER BY month;
SELECT
    CASE
        WHEN total_customer_revenue < 1000 THEN 'Low Spending'
        WHEN total_customer_revenue < 5000 THEN 'Medium Spending'
        ELSE 'High Spending'
    END AS customer_segment,
    COUNT(customer_id) AS customer_count
FROM (
    SELECT
        customer_id,
        SUM(sale_amount) AS total_customer_revenue
    FROM sales
    GROUP BY customer_id
) AS customer_revenue
GROUP BY customer_segment;
