-- Create Table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2)
);

-- Create Table: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_no INT,
    order_date DATE,
    status VARCHAR(50)
);

-- Create Table: order_items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create Table: admins
CREATE TABLE admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email_address VARCHAR(255),
    location VARCHAR(255),
    joined DATE,
    permission VARCHAR(50)
);

-- Create Table: shippings
CREATE TABLE shippings (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_no INT,
    full_name VARCHAR(255),
    email_address VARCHAR(255),
    order_confirmed DATE,
    shipped DATE,
    out_for_delivery DATE,
    delivered DATE,
    expected_delivery DATE
);

-- Create Table: reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    reviewer_name VARCHAR(255),
    review_date DATE,
    comment TEXT,
    rating INT
);

-- Create Table: users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email_address VARCHAR(255),
    location VARCHAR(255),
    joined DATE,
    membership VARCHAR(50)
);

-- Sample Data for Products
INSERT INTO products (product_name, description, price) VALUES
('Off-Shoulder Top', 'Stylish striped top.', 1000.00),
('Biker Jacket', 'Classic faux leather jacket.', 2800.00),
('Platform Boots', 'Trendy platform ankle boots.', 3150.00),
('Fuzzy Slippers', 'Cozy slippers for indoor wear.', 1400.00),
('Denim Shorts', 'Essential high-waisted denim shorts.', 1750.00),
('Ankle Socks', 'Cute floral ankle socks.', 350.00),
('LBD', 'Timeless little black dress.', 2450.00),
('Cashmere Scarf', 'Luxurious cashmere scarf.', 3500.00),
('Linen Pants', 'Lightweight wide leg linen pants.', 2100.00),
('Crossbody Bag', 'Stylish leather crossbody bag.', 4550.00),
('Statement Earrings', 'Eye-catching earrings.', 875.00),
('Knit Sweater', 'Comfy oversized knit sweater.', 2275.00);

-- Sample Data for Orders
INSERT INTO orders (invoice_no, order_date, status) VALUES
(6969, '2023-01-15', 'Confirmed'),
(6968, '2023-01-14', 'Shipped'),
(6967, '2023-01-13', 'Delivered'),
(6966, '2023-01-12', 'Processing'),
(6965, '2023-01-11', 'Confirmed'),
(6964, '2023-01-10', 'Shipped');

-- Sample Data for Order Items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  -- Order 1, Off-Shoulder Top, Quantity 1
(1, 2, 1),  -- Order 1, Biker Jacket, Quantity 1
(2, 3, 1),  -- Order 2, Platform Boots, Quantity 1
(2, 5, 1),  -- Order 2, Denim Shorts, Quantity 1
(3, 6, 2),  -- Order 3, Ankle Socks, Quantity 2
(3, 4, 1),  -- Order 3, Fuzzy Slippers, Quantity 1
(4, 7, 1),  -- Order 4, LBD, Quantity 1
(4, 8, 1),  -- Order 4, Cashmere Scarf, Quantity 1
(5, 9, 1),  -- Order 5, Linen Pants, Quantity 1
(5, 10, 1), -- Order 5, Crossbody Bag, Quantity 1
(6, 11, 2), -- Order 6, Statement Earrings, Quantity 2
(6, 12, 1); -- Order 6, Knit Sweater, Quantity 1

-- Sample Data for admins
INSERT INTO admins (full_name, email_address, location, joined, permission) VALUES
('Leslie Maya', 'leslie@gmail.com', 'Bangkok, Thailand', '2010-10-02', 'S_Admin'),
('Josie Deck', 'josie@gmail.com', 'Chiang Mai, Thailand', '2011-10-03', 'E_Admin'),
('Alex Pfeiffer', 'alex@gmail.com', 'Phuket, Thailand', '2015-05-20', 'E_Admin'),
('Mike Dean', 'mike@gmail.com', 'Pattaya, Thailand', '2015-07-14', 'E_Admin'),
('Mateus Cunha', 'cunha@gmail.com', 'Krabi, Thailand', '2016-10-01', 'E_Admin'),
('Nzola Uemo', 'nzola@gmail.com', 'Hat Yai, Thailand', '2016-06-05', 'E_Admin'),
('Antony Mack', 'mack@gmail.com', 'Khon Kaen, Thailand', '2015-06-15', 'E_Admin'),
('André da Silva', 'andré@gmail.com', 'Udon Thani, Thailand', '2018-03-13', 'E_Admin'),
('Jorge Ferreira', 'jorge@gmail.com', 'Nakhon Ratchasima, Thailand', '2018-03-14', 'E_Admin');

-- Sample data for shippings
INSERT INTO shippings (invoice_no, full_name, email_address, order_confirmed, shipped, out_for_delivery, delivered, expected_delivery) VALUES
(6969, 'Leslie Maya', 'leslie@gmail.com', '2024-01-11', '2024-01-12', '2024-01-13', NULL, '2024-01-16'),
(6968, 'Alex Pfeiffer', 'alex@gmail.com', '2024-01-11', '2024-01-12', '2024-01-14', NULL, '2024-01-16'),
(6967, 'Mateus Cunha', 'cunha@gmail.com', '2024-01-11', '2024-01-13', '2024-01-15', NULL, '2024-01-17'),
(6966, 'Antony Mack', 'mack@gmail.com', '2024-01-11', '2024-01-12', '2024-01-14', NULL, '2024-01-16');

-- Sample data for reviews
INSERT INTO reviews (reviewer_name, review_date, comment, rating) VALUES
('Abby', '2025-10-03', 'ดีมาก สวย', 5),
('Lisa', '2025-05-03', 'ดีมากมากค่ะ', 4),
('Maru', '2025-02-28', 'มันพอดีกับเท้าของฉัน', 4),
('Abby', '2025-10-03', 'ดีมาก สวย', 5),
('Lisa', '2025-05-03', 'ดีมากมากค่ะ', 5);

-- Sample Data for Users
INSERT INTO users (full_name, email_address, location, joined, membership) VALUES
('Leslie Maya', 'leslie@gmail.com', 'Bangkok, Thailand', '2010-10-02', 'Active'),
('Josie Deck', 'josie@gmail.com', 'Chiang Mai, Thailand', '2011-10-03', 'Inactive'),
('Alex Pfeiffer', 'alex@gmail.com', 'Phuket, Thailand', '2015-05-20', 'Pending'),
('Mike Dean', 'mike@gmail.com', 'Pattaya, Thailand', '2015-07-14', 'Active'),
('Mateus Cunha', 'cunha@gmail.com', 'Krabi, Thailand', '2016-10-01', 'Active'),
('Nzola Uemo', 'nzola@gmail.com', 'Hat Yai, Thailand', '2016-06-05', 'Pending'),
('Antony Mack', 'mack@gmail.com', 'Khon Kaen, Thailand', '2015-06-15', 'Pending'),
('André da Silva', 'andré@gmail.com', 'Udon Thani, Thailand', '2018-03-13', 'Pending'),
('Jorge Ferreira', 'jorge@gmail.com', 'Nakhon Ratchasima, Thailand', '2018-03-14', 'Active');