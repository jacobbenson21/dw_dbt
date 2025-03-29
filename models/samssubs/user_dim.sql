{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

WITH distinct_users AS (
    SELECT DISTINCT user_email
    FROM {{ source('websource_landing', 'web_traffic_events') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['user_email']) }} AS user_key,
    user_email
FROM distinct_users