SELECT  
    *
FROM
    {{ ref('fact_order') }}
WHERE
    date(o_orderdate) > CURRENT_DATE()