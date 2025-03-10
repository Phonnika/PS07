CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO products (name, price) VALUES
('Off-shoulder top', 12.00),
('Solid color jacket', 9.00),
('Women\'s fashion boots', 15.00),
('Winter boots', 21.00),
('Low-waisted denim shorts', 1.00),
('Socks', 14.00),
('Women\'s Blouse', 25.00),
('Leather Jacket', 45.00),
('Ankle Boots', 30.00),
('Denim Shorts', 18.00);