<!-- markdownlint-disable MD041 -->
{% docs customer_details_ss %}

# Model: customer_details_ss

## Overview
This model creates a consolidated view of customer details by joining customer information with their respective customer group metadata.

## Logic
1. **Source Tables**:
   - **`std_customers_info_ss`**: Provides customer information such as `customer_id`, `customer_name`, `customer_group_id`, hashed email, and phone number.
   - **`std_customer_groups_info_ss`**: Contains metadata about customer groups, including `customer_group_type`, `customer_group_name`, and `customer_group_register_number`.

2. **Join Logic**:
   - Left joins `std_customers_info_ss` with `std_customer_groups_info_ss` on `customer_group_id` to enrich customer details with group-level information.

3. **Fields Output**:
   - **Customer Details**:
     - `customer_id`, `customer_name`, `customer_group_id`
     - `customer_email_hashed`, `customer_phone_number_hashed`
   - **Customer Group Metadata**:
     - `customer_group_type`, `customer_group_name`, `customer_group_register_number`

## Output
A unified dataset that includes both customer-level details and their corresponding group-level metadata.

## Key Use Cases
- Customer segmentation and analysis based on group types.
- Supporting marketing strategies by linking customer details with group information.
- Enabling personalized communication using hashed identifiers.

{% enddocs %}
