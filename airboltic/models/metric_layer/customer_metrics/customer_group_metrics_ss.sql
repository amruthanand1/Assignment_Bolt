{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=['customer_group_id', 'status', 'customer_group_type', 'customer_group_name', 'trip_end_date'],
    file_format='delta'
)}}

with customer_group_trip_metrics as (
    select 
        coalesce(cd.customer_group_id, 'No Groups ID') as customer_group_id,
        cd.customer_group_type,
        cd.customer_group_name,
        td.status,
        td.trip_end_date,
        count(distinct td.trip_id) as number_of_trips,
        sum(coalesce(td.price, 0)) as total_price,
        sum(coalesce(flight_time_minutes, 0)) as total_flight_time_minutes


    from {{ ref('customer_details_ss') }} as cd
    left join {{ ref('trip_details_ss') }} as td
        on cd.customer_id = td.customer_id
),

customer_group_mapping as (
    select 
        if(opc.customer_group_id is null, 'No Groups ID', opc.customer_group_id) as customer_group_id,
        opc.customer_group_type,
        opc.customer_group_name,
        opc.status,
        sum(coalesce(opc.number_of_trips, 0)) as number_of_trips,
        sum(coalesce(opc.total_price, 0)) as total_price
    from orders_per_customer opc
    group by all 
),

final_metric as (
    select
        customer_group_id,
        customer_group_type,
        customer_group_name,
        status,
        number_of_trips,
        total_price
    from customer_group_mapping
)

select 
    *
from final_metric;
