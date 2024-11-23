SELECT
    orderkey,
    sum(extendedprice) as total_extended_price,
    sum(discounted_amount) as total_discounted_amount
FROM
    {{ ref("order_lineitem")}}
GROUP BY
    orderkey