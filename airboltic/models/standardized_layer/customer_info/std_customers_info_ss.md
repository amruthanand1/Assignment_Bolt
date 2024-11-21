<!-- markdownlint-disable MD041 -->
{% docs std_customers_info_ss %}

# std_customers_info_ss

## About Source Table `private_customer_data_{live|staging}.customer_data_ap`

Lets assume there is a pyspark etl which reads the logs in parquet from 
s3 location and creates a table in databricks called
`private_customer_data_{live|staging}.customer_data_ap`
We use this table to create a standardized_layer for analytics purpose

good to know - the schema name `private_customer_data_{live|staging}`, in this 
`private` means that the data has pii info and `live` in it means, if the table is coming from live data storage or something else. 

and the `suffix` ap in the table name indicates
that the data is in append strategy. 

## About the model `std_customers_info_ss`
The table name suffix ss indicates that the table is a slowly changing dimension table. 

The table used merge strategy. It appends the new customer_ids or updates the 
old customer_ids. And customer_ids are unique in this table.

This table contains customer_ids, and its corresponding
customer_name, customer_group, and their email and phone_number.

In this model we are hashing email and phone_number downstream.

In this model we are type casting the column and cleaning the column names accordingly
{% enddocs %}
