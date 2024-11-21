{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=['trip_end_date'],
    file_format=['order_id', 'status']
)}}

{% set order_data = source('public_order_data', 'order_data_ap') %}

with raw_data as (
    select 
        cast(`Order ID` as integer) as order_id,
        cast(`Customer ID` as integer) as customer_id,
        cast(`Trip ID` as integer) as trip_id,
        cast(`Price (EUR)` as float) as price,
        cast(`Seat No` as string) as seat_nr,
        cast(`Status` as string) as status
    from {{ order_data }}
)

select 
    *
from raw_data;
 