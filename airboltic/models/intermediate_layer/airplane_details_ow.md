<!-- markdownlint-disable MD041 -->
{% docs airplane_details_ow %}


# airplane_details_ow

## Model Name
`airplane_details_ow`

## Materialization
This model is materialized as a `table`.

## File Format
The table is stored in `parquet` format.

## Description
The `airplane_details` model combines airplane information from two sources:
1. `std_airplane_model_ow`: Provides manufacturer and model details, along with specifications such as maximum seats, weight, distance, and engine type.
2. `std_airplane_info_ss`: Contains airplane-specific information such as airplane ID.

The model uses a `LEFT JOIN` to merge data from both sources based on the manufacturer and model fields.

## Columns
- `airplane_id`: Unique identifier for the airplane.
- `manufacturer`: The manufacturer of the airplane.
- `model`: The model of the airplane.
- `max_seats`: The maximum number of seats available in the airplane.
- `max_weight`: The maximum weight capacity of the airplane.
- `max_distance`: The maximum distance the airplane can travel.
- `engine_type`: The type of engine used in the airplane.

{% enddocs %}
