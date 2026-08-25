USE pizza_hut;

CREATE OR REPLACE VIEW pizza_sales_summary AS
SELECT
    pt.name AS pizza_name,
    pt.category,
    p.size,
    p.price,
    SUM(od.quantity) AS total_quantity_sold,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY
    pt.name,
    pt.category,
    p.size,
    p.price;


SELECT *
FROM pizza_sales_summary;

-- top 10 pizzas
SELECT
    pizza_name,
    SUM(total_quantity_sold) AS total_sold
FROM pizza_sales_summary
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 10;