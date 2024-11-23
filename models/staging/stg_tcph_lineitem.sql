select 
    {{
        dbt_utils.generate_surrogate_key([
        'l_orderkey',
        'l_linenumber'])
    }} lineitem_id,
    l_orderkey orderkey,
    l_partkey partkey,
    l_suppkey suppkey,
    l_linenumber linenumber,
    l_quantity quantity,
    l_extendedprice extendedprice,
    l_discount discount_percentage,
    l_tax tax_rate,
    l_shipdate shipdate,
    l_shipmode shipmode
from 
    {{ source('tcph', 'lineitem') }}