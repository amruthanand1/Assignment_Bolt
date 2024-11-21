<!-- markdownlint-disable MD041 -->
{% docs high_level_metrics_ss %}

# high_level_metrics_ss

## Description
This model aggregates trip-level metrics, providing insights into customer activity, trip completion, revenue, and flight time. The data is grouped by `trip_end_date`, enabling visualization of these metrics at different granularities, such as monthly, weekly, and daily.

---

## Data Sources
1. **Trip Details**
   - Reference: `trip_details_ss`
   - Contains raw data about trips, including customer IDs, trip statuses, prices, and flight times.

---

## Logic Overview

### 1. **Aggregation**
   - Calculates key metrics:
     - `active_customers`: Number of distinct customers active on a given day.
     - `total_trips_completed`: Number of completed trips.
     - `total_revenue`: Sum of revenue generated on that date.
     - `total_flight_time_minutes`: Total flight time in minutes.

### 2. **Grouping**
   - Groups all metrics by `trip_end_date`.

---

## Query Output
The final dataset includes the following metrics for each `trip_end_date`:
- `active_customers`: Total distinct customers.
- `total_trips_completed`: Total number of completed trips.
- `total_revenue`: Revenue generated on the date.
- `total_flight_time_minutes`: Flight time in minutes for all trips.

These metrics can be visualized and analyzed at:
- **Daily**: To monitor day-to-day performance.
- **Weekly**: To track trends over weeks.
- **Monthly**: To evaluate broader patterns and growth.

---

## Incremental Logic
- The model is incremental with a `merge` strategy:
  - New or updated rows are merged based on `trip_end_date`.
  - This ensures efficient processing and avoids duplication.

---

## Use Cases
1. Monitoring daily customer and trip activity.
2. Analyzing revenue and engagement trends over time.
3. Supporting performance reviews at different granularities (monthly, weekly, daily).

---

## Considerations
1. **Null Handling**:
   - Metrics such as `total_revenue` and `total_flight_time_minutes` default to `0` if no data is present.
2. **Granularity**:
   - Data grouped by `trip_end_date` can be aggregated to weekly or monthly levels for reporting.

{% enddocs %}
