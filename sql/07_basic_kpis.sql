USE pizza_hut;

-- KPI 1 — Total Revenue
SELECT
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id;
-- Business question
-- How much revenue did the pizza business generate?


-- KPI 2 — Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;


-- KPI 3 — Total Pizzas Sold
SELECT
    SUM(quantity) AS total_pizzas_sold
FROM order_details;


-- KPI 4 — Average Order Value
SELECT
    ROUND(
        SUM(od.quantity * p.price)
        / COUNT(DISTINCT od.order_id),
        2
    ) AS average_order_value
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id;


-- KPI 5 — Average Pizzas Per Order
SELECT
    ROUND(
        SUM(quantity) / COUNT(DISTINCT order_id),
        2
    ) AS avg_pizzas_per_order
FROM order_details;