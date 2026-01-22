{{ config(materialized='table') }}

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['zip_code']) }} as location_key,
    zip_code,
    city,
    state,
    country,
    latitude,
    longitude,
    area_population

FROM {{ ref('stg_telecom_churn') }}
WHERE zip_code IS NOT NULL