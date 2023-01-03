SELECT
    c.id AS customer_id,
    c.first_name,
    c.last_name,
    pn.phone_number
FROM {{ source('customers', 'customers') }} AS c
LEFT JOIN {{ ref('phone_numbers') }} AS pn
    ON c.id = pn.user_id
