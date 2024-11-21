{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test(
    'trip_details_incremental',
    'should calculate metrics correctly for each trip_end_date',
    version=1
) %}

    {% call dbt_unit_testing.mock_ref('trip_details_ss') %}
        select
            '2023-12-01'::date as trip_end_date,
            'cust1' as customer_id,
            'trip1' as trip_id,
            'completed' as status,
            100.00 as price,
            60 as flight_time_minutes
        union all
        select
            '2023-12-01'::date as trip_end_date,
            'cust2' as customer_id,
            'trip2' as trip_id,
            'completed' as status,
            150.00 as price,
            120 as flight_time_minutes
        union all
        select
            '2023-12-02'::date as trip_end_date,
            'cust3' as customer_id,
            'trip3' as trip_id,
            'cancelled' as status,
            0.00 as price,
            0 as flight_time_minutes
        union all
        select
            '2023-12-02'::date as trip_end_date,
            'cust4' as customer_id,
            'trip4' as trip_id,
            'completed' as status,
            200.00 as price,
            180 as flight_time_minutes
    {% endcall %}

    {% call dbt_unit_testing.expect() %}
        select
            '2023-12-01'::date as trip_end_date,
            2 as active_customers,
            2 as total_trips_completed,
            250.00 as total_revenue,
            180 as total_flight_time_minutes
        union all
        select
            '2023-12-02'::date as trip_end_date,
            2 as active_customers,
            1 as total_trips_completed,
            200.00 as total_revenue,
            180 as total_flight_time_minutes
    {% endcall %}

{% endcall %}
