SELECT DISTINCT p.product_name, i.invoice_number
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN invoices i ON o.order_id = i.order_id
WHERE u.user_id = {user_id};


SELECT DISTINCT u.full_name, p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE oi.product_id = {product_id};