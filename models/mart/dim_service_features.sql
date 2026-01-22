{{ config(materialized='table') }}

SELECT DISTINCT
    -- 1. Create a Key based on the COMBINATION of features
    {{ dbt_utils.generate_surrogate_key([
        'has_streaming_tv',
        'has_streaming_movies',
        'has_streaming_music',
        'has_online_security',
        'has_online_backup',
        'has_device_protection',
        'has_tech_support',
        'has_unlimited_data'
    ]) }} as service_feature_key,

    -- 2. The Attributes
    has_streaming_tv,
    has_streaming_movies,
    has_streaming_music,
    has_online_security,
    has_online_backup,
    has_device_protection,
    has_tech_support,
    has_unlimited_data

FROM {{ ref('stg_telecom_churn') }}