SELECT
    -- 1. IDENTIFIERS & GEOGRAPHY
    `Customer ID` AS customer_id,
    `Country` AS country,
    `State` AS state,
    `City` AS city,
    `Zip Code` AS zip_code,
    `Latitude` AS latitude,
    `Longitude` AS longitude,

    -- 2. DEMOGRAPHICS
    `Gender` AS gender,
    CAST(`Age` AS INT) AS age,
    CAST(`Under 30` AS BOOLEAN) AS is_under_30,
    CAST(`Senior Citizen` AS BOOLEAN) AS is_senior_citizen,
    CAST(`Married` AS BOOLEAN) AS is_married,
    CAST(`Dependents` AS BOOLEAN) AS has_dependents,
    CAST(`Partner` AS BOOLEAN) AS has_partner,
    CAST(`Number of Dependents` AS INT) AS number_of_dependents,

    -- 3. CUSTOMER SENTIMENT & STATUS
    `Customer Status` AS customer_status,
    CAST(`Satisfaction Score` AS INT) AS satisfaction_score,
    CAST(`Churn Score` AS INT) AS churn_score,
    CAST(`CLTV` AS INT) AS customer_lifetime_value,
    CAST(`Referred a Friend` AS BOOLEAN) AS has_referred_friend,
    CAST(`Number of Referrals` AS INT) AS number_of_referrals,

    -- 4. CONTRACT & ACCOUNT INFO
    CAST(`Tenure in Months` AS INT) AS tenure_months,
    `Offer` AS applied_offer,
    `Contract` AS contract_type,
    CAST(`Paperless Billing` AS BOOLEAN) AS has_paperless_billing,
    `Payment Method` AS payment_method,
    `Quarter` AS fiscal_quarter,

    -- 5. SERVICES & SUBSCRIPTIONS (Casting 1/0 to Boolean)
    CAST(`Phone Service` AS BOOLEAN) AS has_phone_service,
    CAST(`Multiple Lines` AS BOOLEAN) AS has_multiple_lines,
    CAST(`Internet Service` AS BOOLEAN) AS has_internet_service,
    `Internet Type` AS internet_type,
    CAST(`Online Security` AS BOOLEAN) AS has_online_security,
    CAST(`Online Backup` AS BOOLEAN) AS has_online_backup,
    CAST(`Device Protection Plan` AS BOOLEAN) AS has_device_protection,
    CAST(`Premium Tech Support` AS BOOLEAN) AS has_tech_support,
    CAST(`Streaming TV` AS BOOLEAN) AS has_streaming_tv,
    CAST(`Streaming Movies` AS BOOLEAN) AS has_streaming_movies,
    CAST(`Streaming Music` AS BOOLEAN) AS has_streaming_music,
    CAST(`Unlimited Data` AS BOOLEAN) AS has_unlimited_data,

    -- 6. USAGE & PERFORMANCE
    CAST(`Avg Monthly GB Download` AS INT) AS avg_monthly_gb_download,
    CAST(`Population` AS INT) AS area_population,

    -- 7. FINANCIALS (Casting to Decimal for accuracy)
    CAST(`Monthly Charge` AS DECIMAL(10,2)) AS monthly_charge,
    CAST(`Avg Monthly Long Distance Charges` AS DECIMAL(10,2)) AS avg_monthly_long_distance_charge,
    CAST(`Total Charges` AS DECIMAL(10,2)) AS total_charges,
    CAST(`Total Extra Data Charges` AS DECIMAL(10,2)) AS total_extra_data_charges,
    CAST(`Total Long Distance Charges` AS DECIMAL(10,2)) AS total_long_distance_charges,
    CAST(`Total Refunds` AS DECIMAL(10,2)) AS total_refunds,
    CAST(`Total Revenue` AS DECIMAL(10,2)) AS total_revenue,

    -- 8. CHURN SPECIFICS
    CAST(`Churn` AS BOOLEAN) AS has_churned,
    COALESCE(`Churn Category`, 'Not Churned') AS churn_category,
    COALESCE(`Churn Reason`, 'Not Churned') AS churn_reason

FROM {{ source('databricks_workspace', 'raw_telecom_churn') }}