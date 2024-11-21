{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='airplane_id',
    file_format='delta'
)}}

{% set airplane_info = source('public_airplane_data', 'airplane_ap') %}


with raw_data as (
    select
        cast(`Airplane ID` as integer) as airplane_id,
        cast(`Airplane Model` as string) as airplane_model,
        cast(`Manufacturer` as string) as manufacturer
    from {{ airplane_info }}
)

select 
    *
from raw_data;
