CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL,
    city VARCHAR(80) NOT NULL,
    signup_date DATE NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(120) NOT NULL,
    category VARCHAR(80) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) DEFAULT 'Completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    line_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
