USE pizza_hut;


-- Daily Revenue
SELECT
    o.date,
    ROUND(SUM(od.quantity * p.price), 2) AS revenue
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY o.date
ORDER BY o.date;


-- Monthly Revenue
SELECT
    YEAR(o.date) AS year,
    MONTH(o.date) AS month,
    ROUND(SUM(od.quantity * p.price), 2) AS revenue
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY
    YEAR(o.date),
    MONTH(o.date)
ORDER BY
    year,
    month;


-- Monthly Orders
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    YEAR(date),
    MONTH(date)
ORDER BY
    year,
    month;