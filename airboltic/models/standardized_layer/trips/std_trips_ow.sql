{{config(
    materialized='incremental',
    partition_by=['trip_end_date'],
    file_format='parquet'
)}}
    
{% set trip_data = source('public_trip_data', 'customer_trip_ap') %}

with raw_data as (
    select 
        cast(`Trip ID` as int) as trip_id, 
        cast(`Origin City` as string) as origin_city,
        cast(`Destination City` as string) as destination_city,
        cast(`Airplane ID` as int) as airplane_id,
        cast(`Start Timestamp` as timestamp) as trip_start_timestamp,
        cast(`End Timestamp` as timestamp) as trip_end_timestamp,
        cast(
            date_format(
                to_timestamp(`End Timestamp`, 'dd/MM/yyyy HH:mm:ss'), 'yyyyMMdd'
            ) as int
        ) as trip_end_date
    from {{ trip_data }}

    {% if is_incremental() %}
    where cast(
            date_format(
                to_timestamp(`End Timestamp`, 'dd/MM/yyyy HH:mm:ss'), 'yyyyMMdd'
            ) as int
        ) >= cast(date_format(date_add(current_date, -2), 'yyyyMMdd') as int)
    {% endif %}

)

select 
    *
from raw_data;
