WITH orders_amounts AS (
    SELECT
        order_id,
        SUM(amount) AS amount
    FROM {{ source('orders', 'payments') }}
    GROUP BY 1
)

SELECT
    o.id AS order_id,
    o.user_id AS customer_id, 
    o.order_date AS order_date,
    o.status AS order_status,
    orders_amounts.amount AS order_amount
FROM {{ source('orders', 'orders') }} AS o
LEFT JOIN orders_amounts
    ON o.id = orders_amounts.order_id
