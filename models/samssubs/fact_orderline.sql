{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT
    p.product_key,
    s.store_key,
    c.customer_key,
    d.date_key,
    e.employee_key,
    o.order_key,
    od.orderlineqty,
    od.orderlineprice

FROM {{ source('samssubs_landing', 'orderdetails') }} od
INNER JOIN {{ ref('order_dim') }} o ON od.ordernumber=o.ordernumber
INNER JOIN {{ source('samssubs_landing', '"ORDER"') }} original_or ON o.ordernumber = original_or.ordernumber
INNER JOIN {{ ref('employee_dim') }} e ON original_or.employeeid=e.employeeid
INNER JOIN {{ ref('customer_dim') }} c ON original_or.customerid=c.customerid
INNER JOIN {{ ref('product_dim') }} p ON od.productid=p.productid
INNER JOIN {{ ref('store_dim') }} s ON e.storeid=s.storeid
INNER JOIN {{ ref('date_dim') }} d ON CAST(original_or.orderdate AS DATE) = d.date_day