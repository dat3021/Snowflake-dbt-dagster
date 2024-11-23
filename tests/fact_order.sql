SELECT
    *
FROM
    {{ ref('fact_order') }}
WHERE
    total_discounted_amount > 1