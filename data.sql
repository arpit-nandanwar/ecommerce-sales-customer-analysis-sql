INSERT INTO customers (customer_id, full_name, email, city, signup_date) VALUES
(1, 'Aarav Deshmukh', 'aarav.d@example.com', 'Nagpur', '2025-01-12'),
(2, 'Sneha Kulkarni', 'sneha.k@example.com', 'Akola', '2025-02-18'),
(3, 'Rohan Joshi', 'rohan.j@example.com', 'Mumbai', '2025-03-05'),
(4, 'Pooja Verma', 'pooja.v@example.com', 'Nagpur', '2025-04-22'),
(5, 'Vikram Patil', 'vikram.p@example.com', 'Pune', '2025-05-10'),
(6, 'Neha Gupta', 'neha.g@example.com', 'Akola', '2025-06-15');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(101, 'Wireless Mouse', 'Electronics', 799.00),
(102, 'Mechanical Keyboard', 'Electronics', 2499.00),
(103, 'Running Shoes', 'Footwear', 1899.00),
(104, 'Cotton T-Shirt', 'Apparel', 599.00),
(105, 'Laptop Backpack', 'Accessories', 1299.00),
(106, 'Smart Watch', 'Electronics', 3499.00);

INSERT INTO orders (order_id, customer_id, order_date, order_status) VALUES
(1001, 1, '2026-09-04', 'Completed'),
(1002, 2, '2026-09-11', 'Completed'),
(1003, 3, '2026-09-19', 'Completed'),
(1004, 1, '2026-10-02', 'Completed'),
(1005, 4, '2026-10-08', 'Cancelled'),
(1006, 5, '2026-10-14', 'Completed'),
(1007, 2, '2026-10-21', 'Completed'),
(1008, 6, '2026-10-28', 'Completed');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, line_total) VALUES
(1, 1001, 101, 2, 1598.00),
(2, 1001, 105, 1, 1299.00),
(3, 1002, 106, 1, 3499.00),
(4, 1003, 102, 1, 2499.00),
(5, 1003, 104, 2, 1198.00),
(6, 1004, 103, 1, 1899.00),
(7, 1005, 101, 1, 799.00),
(8, 1006, 105, 2, 2598.00),
(9, 1007, 104, 3, 1797.00),
(10, 1008, 106, 1, 3499.00);
