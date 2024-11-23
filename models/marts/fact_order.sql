SELECT 
    orders.*,
    orderitem_summary.total_extended_price,
    orderitem_summary.total_discounted_amount
FROM
    {{ ref('stg_tcph_orders') }} orders
JOIN
    {{ ref('orderitem_summary') }} orderitem_summary
ON
    orders.o_orderkey = orderitem_summary.orderkey
ORDER BY
    orders.o_orderkey

