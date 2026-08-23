USE pizza_hut;



-- check null values
 
SELECT
    COUNT(*) AS total_rows,
    SUM(pizza_id IS NULL) AS null_pizza_id,
    SUM(quantity IS NULL) AS null_quantity
FROM order_details;



-- check duplicate records

SELECT order_id,COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(order_id)>1;



-- Check duplicate pizza IDs

SELECT
    pizza_id,
    COUNT(*) AS count
FROM pizzas
GROUP BY pizza_id
HAVING COUNT(*) > 1;



-- Check invalid quantities

SELECT *
FROM order_details
WHERE quantity <= 0;



-- Check invalid prices

SELECT *
FROM pizzas
WHERE price <= 0;
