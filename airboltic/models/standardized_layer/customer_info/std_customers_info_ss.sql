
{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='customer_id',
    file_format='delta'
)}}

{% set customer_data = source('private_customer_data', 'customer_data_ap') %}

with raw_data as (
    select 
        cast(`Customer ID` as integer) as customer_id,
        sha1(Name) as customer_name,
        cast(`Customer Group ID` as integer) as customer_group_id,
        sha1(Email) as customer_email_hashed,
        sha1(`Phone Number`) as customer_phone_number_hashed
    from {{ customer_data }}
)

select 
    *
from raw_data;
