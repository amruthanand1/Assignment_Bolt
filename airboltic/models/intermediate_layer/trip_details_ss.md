<!-- markdownlint-disable MD041 -->
{% docs trip_details_ss %}

# trip_details_ss

## Overview
This model joins trip data with order data to produce a comprehensive dataset with trip and order-related metrics.

## Logic
1. **`joining_trips_and_orders`**
   - Joins `std_trips_ow` with `std_orders_ss` on `trip_id`.
   - Brings together trip details with customer and order information (e.g., `customer_id`, `price`, `status`).

2. **Final Selection**
   - Outputs key fields:
     - `trip_id`, `origin_city`, `destination_city`, `airplane_id`
     - `customer_id`, `price`, `status`
     - `trip_start_timestamp`, `trip_end_timestamp`, `flight_time_minutes`, `trip_end_date`

## Output
A dataset combining trip and order details, ready for analysis or downstream use cases.

## Incremental Notes
- Uses `merge` to handle new and updated rows based on the composite unique key (`trip_id`, `status`).
- Leverages Delta format for efficient incremental updates.

## Key Points
- Integrates trip data (`std_trips_ow`) with order details (`std_orders_ss`).
- Ensures a comprehensive view of trips, including customer and pricing information.
- Designed for performance and scalability with incremental updates.

{% enddocs %}