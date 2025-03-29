{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("2022-01-01", "2050-12-31") }}
)

SELECT
    date_day AS date_key,
    date_day,
    year_number,
    day_of_week_iso AS day_of_week,
    month_of_year,
    month_name,
    day_of_month
from cte_date