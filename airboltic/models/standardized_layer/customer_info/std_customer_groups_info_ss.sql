
{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='customer_group_id',
    file_format='delta'
)}}

{% set customer_group_data = source('public_customer_data', 'customer_group_data_ap') %}

with raw_data as (
    select 
        cast(`ID` as integer) as customer_group_id,
        cast(type as string) as customer_group_type,
        cast(Name as integer) as customer_group_name,
        cast(`Registry number` as integer) as customer_group_register_number
    from {{ customer_group_data }}
)

select 
    *
from raw_data;
