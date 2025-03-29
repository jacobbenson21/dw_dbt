{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

WITH distinct_event AS (
    SELECT DISTINCT event_name
    FROM {{ source('websource_landing', 'web_traffic_events') }}
)


SELECT
    {{ dbt_utils.generate_surrogate_key(['event_name']) }} AS event_key,
    event_name
FROM distinct_event