{{ config(materialized='table') }}

SELECT DISTINCT  
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    customer_id,
    gender,
    age,
    is_senior_citizen,
    is_under_30,
    is_married,
    has_dependents,
    number_of_dependents,
    number_of_referrals,
    has_referred_friend

FROM {{ ref('stg_telecom_churn') }}