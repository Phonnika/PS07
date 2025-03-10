-- Create Table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2)
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

-- Create Table: salesorders
CREATE TABLE salesorders (
    salesorder_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    status VARCHAR(50),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create Table: invoices
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    salesorder_id INT UNIQUE,  -- One-to-one relationship with salesorders
    invoice_number VARCHAR(255),  -- More descriptive name
    invoice_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (salesorder_id) REFERENCES salesorders(salesorder_id)
);

-- Create Table: salesorder_items
CREATE TABLE salesorder_items (
    salesorder_item_id INT PRIMARY KEY AUTO_INCREMENT,
    salesorder_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (salesorder_id) REFERENCES salesorders(salesorder_id),
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
    salesorder_id INT, -- link to salesorders
    full_name VARCHAR(255),
    email_address VARCHAR(255),
    order_confirmed DATE,
    shipped DATE,
    out_for_delivery DATE,
    delivered DATE,
    expected_delivery DATE,
     FOREIGN KEY (salesorder_id) REFERENCES salesorders(salesorder_id)
);

-- Create Table: reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    reviewer_name VARCHAR(255),
    review_date DATE,
    comment TEXT,
    rating INT
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

-- Sample Data for Users
INSERT INTO users (full_name, email_address, location, joined, membership) VALUES
('Leslie Maya', 'leslie@gmail.com', 'Bangkok, Thailand', '2010-10-02', 'Active'),
('Josie Deck', 'josie@gmail.com', 'Chiang Mai, Thailand', '2011-10-03', 'Inactive'),
('Alex Pfeiffer', 'alex@gmail.com', 'Phuket, Thailand', '2015-05-20', 'Pending'),
('Mike Dean', 'mike@gmail.com', 'Pattaya, Thailand', '2015-07-14', 'Active'),
('Mateus Cunha', 'cunha@gmail.com', 'Krabi, Thailand', '2016-10-01', 'Active'),
('Nzola Uemo', 'nzola@gmail.com', 'Hat Yai, Thailand', '2016-06-05', 'Pending'),
('Antony Mack', 'mack@gmail.com', 'Khon Kaen, Thailand', '2015-06-15', 'Pending'),
('André da Silva', 'andré@gmail.com', 'Udon Thani, Thailand', '2018-03-13', 'E_Admin'),
('Jorge Ferreira', 'jorge@gmail.com', 'Nakhon Ratchasima, Thailand', '2018-03-14', 'E_Admin');

-- Sample Data for salesorders
INSERT INTO salesorders (order_date, status, user_id) VALUES
('2023-01-15', 'Confirmed', 1),
('2023-01-14', 'Shipped', 2),
('2023-01-13', 'Delivered', 3),
('2023-01-12', 'Processing', 4),
('2023-01-11', 'Confirmed', 5),
('2023-01-10', 'Shipped', 6);

-- Sample Data for Invoices
INSERT INTO invoices (salesorder_id, invoice_number, invoice_date, total_amount) VALUES
(1, 'INV-20230115-001', '2023-01-15', 3800.00),  -- Total for salesorder 1
(2, 'INV-20230114-002', '2023-01-14', 5050.00),  -- Total for salesorder 2
(3, 'INV-20230113-003', '2023-01-13', 2100.00),  -- Total for salesorder 3
(4, 'INV-20230112-004', '2023-01-12', 6050.00),  -- Total for salesorder 4
(5, 'INV-20230111-005', '2023-01-11', 4800.00),  -- Total for salesorder 5
(6, 'INV-20230110-006', '2023-01-10', 2900.00);  -- Total for salesorder 6

-- Sample Data for salesorder Items
INSERT INTO salesorder_items (salesorder_id, product_id, quantity) VALUES
(1, 1, 1),  -- salesorder 1, Off-Shoulder Top, Quantity 1
(1, 2, 1),  -- salesorder 1, Biker Jacket, Quantity 1
(2, 3, 1),  -- salesorder 2, Platform Boots, Quantity 1
(2, 5, 1),  -- salesorder 2, Denim Shorts, Quantity 1
(3, 6, 2),  -- salesorder 3, Ankle Socks, Quantity 2
(3, 4, 1),  -- salesorder 3, Fuzzy Slippers, Quantity 1
(4, 7, 1),  -- salesorder 4, LBD, Quantity 1
(4, 8, 1),  -- salesorder 4, Cashmere Scarf, Quantity 1
(5, 9, 1),  -- salesorder 5, Linen Pants, Quantity 1
(5, 10, 1), -- salesorder 5, Crossbody Bag, Quantity 1
(6, 11, 2), -- salesorder 6, Statement Earrings, Quantity 2
(6, 12, 1); -- salesorder 6, Knit Sweater, Quantity 1

-- Sample Data for admins
INSERT INTO admins (full_name, email_address, location, joined, permission) VALUES
('Leslie Maya', 'leslie@gmail.com', 'Bangkok, Thailand', '2010-10-02', 'S_Admin'),
('Josie Deck', 'josie@gmail.com', 'Chiang Mai, Thailand', '2011-10-03', 'E_Admin'),
('Alex Pfeiffer', 'alex@gmail.com', 'Phuket, Thailand', '2015-05-20', 'E_Admin'),
('Mike Dean', 'mike@gmail.com', 'Pattaya, Thailand', '2015-07-14', 'E_Admin'),
('Mateus Cunha', 'cunha@gmail.com', 'Krabi, Thailand', '2016-10-01', 'E_Admin'),
('Nzola Uemo', 'nzola@gmail.com', 'Hat Yai, Thailand', '2016-06-05', 'Pending'),
('Antony Mack', 'mack@gmail.com', 'Khon Kaen, Thailand', '2015-06-15', 'Pending'),
('André da Silva', 'andré@gmail.com', 'Udon Thani, Thailand', '2018-03-13', 'E_Admin'),
('Jorge Ferreira', 'jorge@gmail.com', 'Nakhon Ratchasima, Thailand', '2018-03-14', 'E_Admin');

-- Sample data for shippings
INSERT INTO shippings (salesorder_id, full_name, email_address, order_confirmed, shipped, out_for_delivery, delivered, expected_delivery) VALUES
(1, 'Leslie Maya', 'leslie@gmail.com', '2024-01-11', '2024-01-12', '2024-01-13', NULL, '2024-01-16'),
(2, 'Alex Pfeiffer', 'alex@gmail.com', '2024-01-11', '2024-01-12', '2024-01-14', NULL, '2024-01-16'),
(3, 'Mateus Cunha', 'cunha@gmail.com', '2024-01-11', '2024-01-13', '2024-01-15', NULL, '2024-01-17'),
(4, 'Antony Mack', 'mack@gmail.com', '2024-01-11', '2024-01-12', '2024-01-14', NULL, '2024-01-16');

-- Sample data for reviews
INSERT INTO reviews (reviewer_name, review_date, comment, rating) VALUES
('Abby', '2025-10-03', 'ดีมาก สวย', 5),
('Lisa', '2025-05-03', 'ดีมากมากค่ะ', 4),
('Maru', '2025-02-28', 'มันพอดีกับเท้าของฉัน', 4),
('Abby', '2025-10-03', 'ดีมาก สวย', 5),
('Lisa', '2025-05-03', 'ดีมากมากค่ะ', 5);

-- Update Invoice with salesorder_id. Important that you do this after insertting salesorders
UPDATE invoices SET salesorder_id = 1 WHERE invoice_id = 1;
UPDATE invoices SET salesorder_id = 2 WHERE invoice_id = 2;
UPDATE invoices SET salesorder_id = 3 WHERE invoice_id = 3;
UPDATE invoices SET salesorder_id = 4 WHERE invoice_id = 4;
UPDATE invoices SET salesorder_id = 5 WHERE invoice_id = 5;
UPDATE invoices SET salesorder_id = 6 WHERE invoice_id = 6;