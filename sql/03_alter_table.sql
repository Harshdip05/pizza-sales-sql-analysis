ALTER TABLE pizzas
ADD CONSTRAINT fk_pizza_type
FOREIGN KEY (pizza_type_id)
REFERENCES pizza_types(pizza_type_id);


ALTER TABLE orders_details
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


ALTER TABLE orders_details
ADD CONSTRAINT fk_pizza
FOREIGN KEY (pizza_id)
REFERENCES pizzas(pizza_id);


