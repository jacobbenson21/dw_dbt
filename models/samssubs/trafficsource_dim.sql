{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

WITH distinct_sources AS (
    SELECT DISTINCT traffic_source
    FROM {{ source('websource_landing', 'web_traffic_events') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['traffic_source']) }} AS traffic_source_key,
    traffic_source
FROM distinct_sources
