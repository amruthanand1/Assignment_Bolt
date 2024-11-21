<!-- markdownlint-disable MD041 -->
{% docs std_customer_groups_info_ss %}

# std_customers_info_ss

## About Source Table `public_customer_data_{live|staging}.customer_group_data_ap`

Lets assume there is a pyspark etl which reads the logs in parquet from 
s3 location and creates a table in databricks called
`public_customer_data_{live|staging}.customer_group_data_ap`
We use this table to create a standardized_layer for analytics purpose

good to know - the schema name `public_customer_data_{live|staging}`, in this 
`public` means that the data has nonpii info and `live` in it means, if the table is coming from live data storage or something else. 

and the `suffix` ap in the table name indicates
that the data is in append strategy. 

## About the model `std_customer_groups_info_ss`
The table name suffix ss indicates that the table is a slowly changing dimension table. 

The table used merge strategy. It appends the new customer_group_id or updates the 
old customer_group_id. And customer_group_id are unique in this table.

This table contains customer_group_id, and its corresponding
customer_group_name, customer_group_type, and customer_group_register_number.

In this model we are type casting the column and cleaning the column names accordingly

{% enddocs %}

