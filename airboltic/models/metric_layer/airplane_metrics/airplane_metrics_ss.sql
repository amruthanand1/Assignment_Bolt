{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=[
        'airplane_id', 
        'manufacturer', 
        'model', 
        'max_seats',
        'max_distance',
        'engine_type',
        'trip_end_date'
    ],
    file_format='delta'
)}}


with airplane_metrics as (
    select 
        ad.airplane_id,
        ad.manufacturer,
        ad.model,
        ad.max_seats,
        ad.max_weight,
        ad.max_distance,
        ad.engine_type,
        td.trip_end_date,
        count(distinct td.trip_id) as total_trips,
        count(distinct td.customer_id) as total_customers,
        sum(td.price) as total_revenue,
        sum(td.flight_time_minutes) as total_flight_time_minutes
    from {{ ref('airplane_details_ow') }} as ad
    left join {{ ref('trip_details_ss') }} as td
        on ad.airplane_id = td.airplane_id
    group by all
)

select * from airplane_metrics;
