{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    p.productid AS product_key,
    p.productid,
    p.producttype,
    p.productname,
    p.productcost,
    p.productcalories,
    s.breadtype,
    s.length
FROM {{ source('samssubs_landing', 'product') }} p
JOIN {{ source('samssubs_landing', 'sandwich') }} s ON p.productid=s.productid