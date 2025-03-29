{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    ordernumber AS order_key,
    ordernumber,
    ordermethod
FROM {{ source('samssubs_landing', '"ORDER"') }}