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
