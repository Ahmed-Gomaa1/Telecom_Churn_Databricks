{{ config(materialized='table') }}

SELECT DISTINCT
    -- 1. Create a Key based on the COMBINATION of contract details
    {{ dbt_utils.generate_surrogate_key([
        'contract_type',
        'payment_method',
        'applied_offer',
        'internet_type'
    ]) }} as contract_key,

    -- 2. The Attributes
    contract_type,
    payment_method,
    applied_offer,
    internet_type

FROM {{ ref('stg_telecom_churn') }}