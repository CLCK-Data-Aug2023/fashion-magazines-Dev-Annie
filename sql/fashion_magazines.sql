SELECT 
    customers.customer_id AS CustomerID,
    customers.customer_name AS Customer,
    PRINTF('$%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS total_amount_due
FROM 
    orders
JOIN 
    customers ON orders.customer_id = customers.customer_id
JOIN 
    subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE 
    orders.order_status = 'unpaid'
GROUP BY 
    customers.customer_id, customers.customer_name;