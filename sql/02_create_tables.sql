CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) NOT NULL,
    name TEXT,
    category TEXT,
    ingredients TEXT,
    PRIMARY KEY (pizza_type_id)
);


CREATE TABLE pizzas (
    pizza_id VARCHAR(50) NOT NULL,
    pizza_type_id VARCHAR(50) NOT NULL,
    size VARCHAR(10),
    price DECIMAL(10,2),
    PRIMARY KEY (pizza_id)
);


CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);


CREATE TABLE orders_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);

RENAME TABLE orders_details TO order_details;