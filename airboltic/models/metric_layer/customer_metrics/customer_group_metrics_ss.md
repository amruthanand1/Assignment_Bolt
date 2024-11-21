<!-- markdownlint-disable MD041 -->
{% docs customer_group_metrics_ss %}

# customer_group_metrics_ss

## Description
This model calculates aggregated metrics (e.g., number of trips and total price) for customer groups and outputs them for reporting and analysis. It integrates data from customer details, trip details, and customer group metadata.

---

## Data Sources
1. **Customer Details**
   - Reference: `customer_details_ss`
   - Provides customer and group information.

2. **Trip Details**
   - Reference: `trip_details_ss`
   - Contains trip-specific data, including pricing and status.

3. **Customer Group Metadata**
   - Reference: `std_customer_groups_info_ss`
   - Enriches metrics with customer group details.

---

## Logic Overview

### 1. **`customer_group_trip_metrics` CTE**
   - Joins customer details with trip details:
     - Calculates metrics such as `number_of_trips`, `total_price`, and `total_flight_time_minutes`.
     - Handles null values for missing data.

### 2. **`customer_group_mapping` CTE**
   - Maps customers to their respective groups:
     - Joins order data with customer info.
     - Defaults `customer_group_id` to `'No Groups ID'` for ungrouped customers.
     - Aggregates metrics at the customer group level.

### 3. **`final_metric` CTE**
   - Joins aggregated group metrics with metadata:
     - Adds customer group type, name, and registration number.

---

## Query Output
The final dataset provides aggregated metrics at the customer group level, including:
- `customer_group_id`
- `customer_group_type`
- `customer_group_name`
- `customer_group_register_number`
- `status`
- Aggregated metrics: `number_of_trips` and `total_price`

---

## Use Cases
1. Reporting on customer group performance.
2. Evaluating revenue and engagement metrics by group.
3. Supporting group-specific business strategies.

---

## Incremental Logic
- Designed for incremental processing using the `merge` strategy:
  - Merges new or updated rows based on the unique key.
  - Ensures efficiency and avoids duplication.

---

## Considerations
1. **Null Handling**:
   - Defaults `customer_group_id` to `'No Groups ID'` when missing.
2. **Performance**:
   - Optimized with the Delta file format for efficient incremental updates.

{% enddocs %}
