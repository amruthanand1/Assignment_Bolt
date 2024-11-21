{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='customer_id',
    file_format='delta'
)}}

with customer_details as (
    select 
        cust.customer_id,
        cust.customer_name,
        cust.customer_group_id,
        cust.customer_email_hashed,
        cust.customer_phone_number_hashed,
        cust_grouped.customer_group_type,
        cust_grouped.customer_group_name,
        cust_grouped.customer_group_register_number
    from {{ ref('std_customers_info_ss') }} cust
    left join {{ ref('std_customer_groups_info_ss') }} cust_grouped
        on cust.customer_group_id = cust_grouped.customer_group_id
)

select * from customer_details;
