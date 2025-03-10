-- Join products, order_items, and orders tables to get product details for each order
SELECT
    p.product_name,
    p.price,
    oi.quantity,
    o.order_date,
    o.status
FROM
    products p
JOIN
    order_items oi ON p.product_id = oi.product_id
JOIN
    orders o ON oi.order_id = o.order_id;