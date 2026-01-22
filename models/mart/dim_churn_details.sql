{{ config(materialized='table') }}

SELECT DISTINCT
    -- Create a unique ID for every COMBINATION of status/reason
    {{ dbt_utils.generate_surrogate_key([
        'customer_status',
        'has_churned',
        'churn_category',
        'churn_reason'
    ]) }} as churn_details_key,
    
    -- The Attributes
    customer_status,
    has_churned,
    churn_category,
    churn_reason

FROM {{ ref('stg_telecom_churn') }}