{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['customerid']) }} AS customer_key,
    customerid,
    customerbday,
    customerfname,
    customerlname,
    customerphone
FROM {{ source('samssubs_landing', 'customer') }}