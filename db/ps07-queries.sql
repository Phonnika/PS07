SELECT DISTINCT p.product_name, i.invoice_number
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN invoices i ON o.order_id = i.order_id
WHERE u.user_id = {user_id};

SELECT DISTINCT p.product_name, u.full_name as buyer, s.full_name as recipient
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN shippings s ON o.order_id = s.order_id
WHERE oi.product_id = {product_id};

SELECT u.full_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN invoices i ON o.order_id = i.order_id
GROUP BY u.user_id
HAVING SUM(oi.quantity) >= x AND SUM(i.total_amount) >= y;