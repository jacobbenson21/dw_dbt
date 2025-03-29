{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['storeid']) }} AS store_key,
    storeid,
    address,
    city,
    state,
    zip
FROM {{ source('samssubs_landing', 'store') }}