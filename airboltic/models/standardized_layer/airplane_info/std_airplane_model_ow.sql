{{config(
    materialized='table',
    partition_by=['manufacturer'],
    file_format='parquet'
)}}

{% set airplane_model = source('public_airplane_data', 'airplane_model_ap') %}

with aircraft_data as (
    select
        key as manufacturer,
        explode(value) AS model_data
    from {{ airplane_model }}
),

flattened_data as (
    select
        cast(manufacturer as string) as manufacturer,
        cast(model_data.key as string) AS model,
        cast(model_data.value.max_seats as float) as max_seats,
        cast(model_data.value.max_weight as float) as max_weight,
        cast(model_data.value.max_distance as float) as max_distance,
        cast(model_data.value.engine_type as string) as engine_type
    from aircraft_data
)

select * from flattened_data;
