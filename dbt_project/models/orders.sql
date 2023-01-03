SELECT
    o.id AS order_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    c.phone_number AS customer_phone_number,
    o.order_date AS order_date,
    o.status AS order_status,
    p.payment_method AS payment_method,
    p.amount AS order_amount
FROM {{ source('customers', 'orders') }} AS o
LEFT JOIN {{ source('customers', 'payments') }} AS p
    ON o.id = p.order_id
LEFT JOIN {{ ref('customers') }} AS c
    ON o.user_id = c.customer_id
