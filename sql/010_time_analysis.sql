USE pizza_hut;

-- Which month generates the highest revenue? 
SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY total_revenue DESC
LIMIT 1;



-- Which day has the most orders?
SELECT
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY DAYNAME(order_date)
ORDER BY total_orders DESC;

SELECT
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY DAYNAME(order_date)
ORDER BY total_orders DESC
LIMIT 1;



-- What are the peak ordering hours?
SELECT
    HOUR(o.order_time) AS order_hour,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
GROUP BY HOUR(o.order_time)
ORDER BY total_orders DESC;

SELECT
    HOUR(o.order_time) AS order_hour,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
GROUP BY HOUR(o.order_time)
ORDER BY total_orders DESC
LIMIT 1;



-- How does revenue change month over month?
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(od.quantity * p.price) AS revenue
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    month,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        LAG(revenue) OVER (ORDER BY month),
        2
    ) AS previous_month_revenue,
    ROUND(
        revenue - LAG(revenue) OVER (ORDER BY month),
        2
    ) AS revenue_change
FROM monthly_revenue
ORDER BY month;



-- calculate MOM percentage growth 
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(od.quantity * p.price) AS revenue
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    month,
    ROUND(revenue, 2) AS revenue,

    ROUND(
        LAG(revenue) OVER (ORDER BY month),
        2
    ) AS previous_month_revenue,

    ROUND(
        (
            revenue -
            LAG(revenue) OVER (ORDER BY month)
        )
        /
        LAG(revenue) OVER (ORDER BY month)
        * 100,
        2
    ) AS mom_growth_percentage
FROM monthly_revenue
ORDER BY month;



-- What are the busiest periods?
SELECT
    DAYNAME(o.order_date) AS day_name,
    HOUR(o.order_time) AS order_hour,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
GROUP BY
    DAYNAME(o.order_date),
    HOUR(o.order_time)
ORDER BY total_orders DESC;



-- What are the busiest periods?
SELECT
    DAYNAME(o.order_date) AS day_name,
    HOUR(o.order_time) AS order_hour,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
GROUP BY
    DAYNAME(o.order_date),
    HOUR(o.order_time)
ORDER BY total_orders DESC;
-- Top 10 busiest periods:
SELECT
    DAYNAME(o.order_date) AS day_name,
    HOUR(o.order_time) AS order_hour,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
GROUP BY
    DAYNAME(o.order_date),
    HOUR(o.order_time)
ORDER BY total_orders DESC
LIMIT 10;