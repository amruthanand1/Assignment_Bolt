<!-- markdownlint-disable MD041 -->
{% docs std_airplane_info_ss %}

# std_airplane_info_ss

## About Source Table `public_airplane_data_{live|staging}.airplane_ap`

Lets assume there is a pyspark etl which reads the logs in parquet from 
s3 location and creates a table in databricks called
`public_airplane_data_{live|staging}.airplane_ap`
We use this table to create a standardized_layer for analytics purpose

good to know - the schema name `public_airplane_data_{live|staging}`, in this 
`public` means that the data has nonpii info and `live` in it means, if the table is coming from live data storage or something else. 

and the `suffix` ap in the table name indicates
that the data is in append strategy. 

## About the model `std_airplane_info_ss`
The table name suffix ss indicates that the table is a slowly changing dimension table. 

The table used merge strategy. It appends the new airplane_ids or updates the 
old airplane_ids. And Airplan_ids are unique in this table.

This table contains airplane_id, and its corresponding
Airplane Model and Manufacturer

In this model we are type casting the column and cleaning the column names accordingly

{% enddocs %}
