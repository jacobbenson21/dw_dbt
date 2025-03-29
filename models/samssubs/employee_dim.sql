{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['employeeid']) }} AS employee_key,
    employeeid,
    employeebday,
    employeefname,
    employeelname,
    storeid
FROM {{ source('samssubs_landing', 'employee') }}