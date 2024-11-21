{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='trip_end_date',
    file_format='delta'
)}}

with trip_details as (

    select 
        trip_end_date,
        count(distinct customer_id) as active_customers,
        count(distinct if(status = 'completed',trip_id, null)) as total_trips_completed,
        coalesce(sum(price), 0) as total_revenue,
        coalesce(sum(flight_time_minutes), 0) as total_flight_time_minutes
    from {{ ref('trip_details_ss') }}
    group by trip_end_date
)

select * from trip_details;
