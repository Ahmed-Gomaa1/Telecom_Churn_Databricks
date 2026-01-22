{% snapshot snp_customers %}

{{
    config(
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='check',
      check_cols=['contract', 'payment_method', 'customer_status'],
      invalidate_hard_deletes=True
    )
}}

SELECT
    -- 1. IDs & Status
    `Customer ID`                   AS customer_id,
    `Customer Status`               AS customer_status,
    `Zip Code`                      AS zip_code,

    -- 2. Demographics
    `Gender`                        AS gender,
    `Age`                           AS age,
    `Under 30`                      AS is_under_30,
    `Senior Citizen`                AS is_senior_citizen,
    `Married`                       AS is_married,
    `Dependents`                    AS has_dependents,
    `Number of Dependents`          AS number_of_dependents,

    -- 3. Contract & Services
    `Contract`                      AS contract,
    `Paperless Billing`             AS paperless_billing,
    `Payment Method`                AS payment_method,
    `Phone Service`                 AS has_phone_service,
    `Multiple Lines`                AS has_multiple_lines,
    `Internet Service`              AS has_internet_service,
    `Internet Type`                 AS internet_type,
    `Online Security`               AS has_online_security,
    `Online Backup`                 AS has_online_backup,
    `Device Protection Plan`        AS has_device_protection,
    `Premium Tech Support`          AS has_tech_support,
    `Streaming TV`                  AS has_streaming_tv,
    `Streaming Movies`              AS has_streaming_movies,
    `Streaming Music`               AS has_streaming_music,
    `Unlimited Data`                AS has_unlimited_data,
    `Offer`                         AS offer,

    -- 4. Metrics & Churn
    `Avg Monthly GB Download`           AS avg_monthly_gb_download,
    `Avg Monthly Long Distance Charges` AS avg_monthly_long_distance_charges,
    `Monthly Charge`                    AS monthly_charge,
    `Total Charges`                     AS total_charges,
    `Total Extra Data Charges`          AS total_extra_data_charges,
    `Total Long Distance Charges`       AS total_long_distance_charges,
    `Total Refunds`                     AS total_refunds,
    `Total Revenue`                     AS total_revenue,
    `Tenure in Months`                  AS tenure_months,
    `Satisfaction Score`                AS satisfaction_score,
    `Churn Score`                       AS churn_score,
    `Churn Category`                    AS churn_category,
    `Churn Reason`                      AS churn_reason,
    `Number of Referrals`               AS number_of_referrals,
    `Referred a Friend`                 AS has_referred_friend,

    -- 5. Extra Columns
    `City`                          AS city,
    `State`                         AS state,
    `Country`                       AS country,
    `Latitude`                      AS latitude,
    `Longitude`                     AS longitude,
    `Population`                    AS population,
    `Quarter`                       AS quarter,
    `Churn`                         AS churn_label,
    `CLTV`                          AS cltv

FROM {{ source('databricks_workspace', 'raw_telecom_churn') }}

{% endsnapshot %}