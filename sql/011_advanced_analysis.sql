USE pizza_hut;


-- What percentage of revenue comes from each category?
WITH category_revenue AS (
    SELECT
        pt.category,
        SUM(od.quantity * p.price) AS revenue
    FROM order_details od
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category
)
SELECT
    category,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        revenue / SUM(revenue) OVER () * 100,
        2
    ) AS revenue_percentage
FROM category_revenue
ORDER BY revenue DESC;



-- What are the top 3 pizzas within each category?
WITH pizza_revenue AS (
    SELECT
        pt.category,
        pt.name AS pizza_name,
        SUM(od.quantity * p.price) AS revenue
    FROM order_details od
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY
        pt.category,
        pt.name
),

ranked_pizzas AS (
    SELECT
        category,
        pizza_name,
        revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS pizza_rank
    FROM pizza_revenue
)
SELECT
    category,
    pizza_name,
    ROUND(revenue, 2) AS revenue,
    pizza_rank
FROM ranked_pizzas
WHERE pizza_rank <= 3
ORDER BY
    category,
    pizza_rank;