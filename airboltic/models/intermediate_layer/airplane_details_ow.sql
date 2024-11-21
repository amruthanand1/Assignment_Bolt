{{config(
    materialized='table',
    file_format='parquet'
)}}

with airplane_details as (
    select 
        ai.airplane_id,
        am.manufacturer,
        am.model,
        am.max_seats,
        am.max_weight,
        am.max_distance,
        am.engine_type
    from {{ ref('std_airplane_model_ow') }} am 
    left join {{ ref('std_airplane_info_ss') }} ai
        on am.manufacturer = ai.manufacturer
        and am.model = ai.airplane_model
)

select 
    *
from airplane_details