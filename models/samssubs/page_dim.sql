{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

WITH distinct_pages AS (
    SELECT DISTINCT page_url
    FROM {{ source('websource_landing', 'web_traffic_events') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['page_url']) }} AS page_key,
    page_url
FROM distinct_pages