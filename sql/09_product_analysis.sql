USE pizza_hut;

-- What are the top 10 best-selling pizzas?
SELECT
    pt.name AS pizza_name,
    SUM(od.quantity) AS total_pizzas_sold
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_pizzas_sold DESC
LIMIT 10;

-- Which pizzas generate the highest revenue?
SELECT
    pt.name AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC;


-- To show only the top 10:

SELECT
    pt.name AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 10;
8. Which pizzas have the lowest sales?
SELECT
    pt.name AS pizza_name,
    SUM(od.quantity) AS total_pizzas_sold
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_pizzas_sold ASC
LIMIT 10;



-- Which pizza category performs best?
-- We can define "best" based on revenue.

SELECT
    pt.category,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_revenue DESC;

-- To get only the best category:

SELECT
    pt.category,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_revenue DESC
LIMIT 1;

-- Which pizza size is most popular?

-- Based on quantity sold:

SELECT
    p.size,
    SUM(od.quantity) AS total_pizzas_sold
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_pizzas_sold DESC;

-- To find the most popular size:

SELECT
    p.size,
    SUM(od.quantity) AS total_pizzas_sold
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_pizzas_sold DESC
LIMIT 1;