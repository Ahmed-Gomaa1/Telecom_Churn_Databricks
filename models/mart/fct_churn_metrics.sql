{{ config(materialized='table') }}

SELECT
    -- 1. Generate the Keys (Safe & Null-Proof)
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['zip_code']) }} as location_key,

    -- Re-generate the hashes exactly as they are in the Dimensions
    {{ dbt_utils.generate_surrogate_key([
        'contract_type', 
        'payment_method', 
        'applied_offer', 
        'internet_type'
    ]) }} as contract_key,

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

    {{ dbt_utils.generate_surrogate_key([
        'customer_status', 
        'has_churned', 
        'churn_category', 
        'churn_reason'
    ]) }} as churn_details_key,

    -- 2. The Metrics
    tenure_months,
    monthly_charge,
    total_charges,
    total_revenue,
    total_refunds,
    total_extra_data_charges,
    total_long_distance_charges,
    avg_monthly_gb_download,
    avg_monthly_long_distance_charge,
    churn_score,
    satisfaction_score,
    customer_lifetime_value

FROM {{ ref('stg_telecom_churn') }}