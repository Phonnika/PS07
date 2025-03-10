CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    quantity INT
);

INSERT INTO products (product_name, quantity) VALUES
('Off-the-shoulder top', 12),
('Solid color jacket', 9),
('Fashion boots for women', 15),
('Winter boots', 21),
('Low-waist denim shorts', 1),
('Socks', 14);

CREATE TABLE admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email_address VARCHAR(255),
    location VARCHAR(255),
    joined DATE,
    permission VARCHAR(50)
);

INSERT INTO admins (full_name, email_address, location, joined, permission) VALUES
('Leslie Maya', 'leslie@gmail.com', 'Los Angeles, CA', '2010-10-02', 'S_Admin'),
('Josie Deck', 'josie@gmail.com', 'Cheyenne, WY', '2011-10-03', 'S_Admin'),
('Alex Pfeiffer', 'alex@gmail.com', 'Cheyenne, WY', '2015-05-20', 'E_Admin'),
('Mike Dean', 'mike@gmail.com', 'Syracuse, NY', '2015-07-14', 'E_Admin'),
('Mateus Cunha', 'cunha@gmail.com', 'Luanda, AN', '2016-10-01', 'E_Admin'),
('Nzola Uemo', 'nzola@gmail.com', 'Lagos, NG', '2016-06-05', 'E_Admin'),
('Antony Mack', 'mack@gmail.com', 'London, ENG', '2015-06-15', 'E_Admin'),
('André da Silva', 'andré@gmail.com', 'São Paulo, BR', '2018-03-13', 'E_Admin'),
('Jorge Ferreira', 'jorge@gmail.com', 'Huambo, Angola', '2018-03-14', 'E_Admin');

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

INSERT INTO shippings (invoice_no, full_name, email_address, order_confirmed, shipped, out_for_delivery, delivered, expected_delivery) VALUES
(6969, 'Leslie Maya', 'leslie@gmail.com', '2023-01-11', '2023-01-11', '2023-01-11', NULL, '2023-01-16'),
(6968, 'Alex Pfeiffer', 'alex@gmail.com', '2023-01-11', '2023-01-11', '2023-01-11', NULL, '2023-01-16'),
(6967, 'Mateus Cunha', 'cunha@gmail.com', '2023-01-11', '2023-01-11', '2023-01-11', NULL, '2023-01-16'),
(6966, 'Antony Mack', 'mack@gmail.com', '2023-01-11', '2023-01-11', '2023-01-11', NULL, '2023-01-16');

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    reviewer_name VARCHAR(255),
    review_date DATE,
    comment TEXT,
    rating INT
);

INSERT INTO reviews (reviewer_name, review_date, comment, rating) VALUES
('Abby', '2025-10-03', 'Very good, Beautiful', 5),
('Lisa', '2025-05-03', 'Dee mak mak ka', 4),
('Maru', '2025-02-28', 'It''s perfect fit for my feet.', 4),
('Abby', '2025-10-03', 'Very good, Beautiful', 5),
('Lisa', '2025-05-03', 'Dee mak mak ka', 5);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email_address VARCHAR(255),
    location VARCHAR(255),
    joined DATE,
    membership VARCHAR(50)
);

INSERT INTO users (full_name, email_address, location, joined, membership) VALUES
('Leslie Maya', 'leslie@gmail.com', 'Los Angeles, CA', '2010-10-02', 'Active'),
('Josie Deck', 'josie@gmail.com', 'Cheyenne, WY', '2011-10-03', 'Inactive'),
('Alex Pfeiffer', 'alex@gmail.com', 'Cheyenne, WY', '2015-05-20', 'Pending'),
('Mike Dean', 'mike@gmail.com', 'Syracuse, NY', '2015-07-14', 'Active'),
('Mateus Cunha', 'cunha@gmail.com', 'Luanda, AN', '2016-10-01', 'Active'),
('Nzola Uemo', 'nzola@gmail.com', 'Lagos, NG', '2016-06-05', 'Pending'),
('Antony Mack', 'mack@gmail.com', 'London, ENG', '2015-06-15', 'Pending'),
('André da Silva', 'andré@gmail.com', 'São Paulo, BR', '2018-03-13', 'Pending'),
('Jorge Ferreira', 'jorge@gmail.com', 'Huambo, Angola', '2018-03-14', 'Active');