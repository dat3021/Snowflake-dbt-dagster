SELECT
    lineitem.orderkey,
    lineitem.partkey,
    lineitem.linenumber,
    lineitem.extendedprice,
    orders.o_orderkey,
    orders.o_orderdate, 
    orders.o_custkey,
    {{discounted_amount('lineitem.extendedprice','lineitem.discount_percentage') }} as discounted_amount
FROM
    {{ ref("stg_tcph_lineitem")}} as lineitem
JOIN
    {{ ref("stg_tcph_orders")}} as orders
ON
    lineitem.orderkey = orders.o_orderkey
ORDER BY
    lineitem.orderkey