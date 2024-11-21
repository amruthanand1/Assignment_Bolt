{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=['trip_id', 'status'],
    file_format='delta'
)}}

with joining_trips_and_orders as (
    select 
        trips.*,
        orders.customer_id,
        orders.price,
        orders.status
    from {{ ref('std_trips_ow') }} trips
    left join {{ ref('std_orders_ss') }} orders
        on trips.trip_id = orders.trip_id
)

select 
    trip_id,
    origin_city,
    destination_city,
    airplane_id,
    customer_id,
    price,
    status,
    trip_start_timestamp,
    trip_end_timestamp,
    timestampdiff(minute, trip_start_timestamp, trip_end_timestamp) as flight_time_minutes,
    trip_end_date
from joining_trips_and_orders;
