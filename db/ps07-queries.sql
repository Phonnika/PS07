SELECT DISTINCT p.product_name, i.invoice_number
FROM users u
JOIN salesorders o ON u.user_id = o.user_id
JOIN salesorder_items oi ON o.salesorder_id = oi.salesorder_id
JOIN products p ON oi.product_id = p.product_id
JOIN invoices i ON o.salesorder_id = i.salesorder_id
WHERE u.user_id = {user_id};

SELECT DISTINCT p.product_name, u.full_name as buyer, s.full_name as recipient
FROM users u
JOIN salesorders o ON u.user_id = o.user_id
JOIN salesorder_items oi ON o.salesorder_id = oi.salesorder_id
JOIN products p ON oi.product_id = p.product_id
JOIN shippings s ON o.salesorder_id = s.salesorder_id
WHERE oi.product_id = {product_id};

SELECT u.full_name
FROM users u
JOIN salesorders o ON u.user_id = o.user_id
JOIN salesorder_items oi ON o.salesorder_id = oi.salesorder_id
JOIN invoices i ON o.salesorder_id = i.salesorder_id
GROUP BY u.user_id
HAVING SUM(oi.quantity) >= x AND SUM(i.total_amount) >= y;