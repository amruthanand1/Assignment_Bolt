<!-- markdownlint-disable MD041 -->
{% docs std_orders_ss %}

# std_orders_ss

## About Source Table `public_order_data_{live|staging}.order_data_ap`

Lets assume there is a pyspark etl which reads the logs in parquet from 
s3 location and creates a table in databricks called
`public_order_data_{live|staging}.order_data_ap`
We use this table to create a standardized_layer for analytics purpose

good to know - the schema name `public_order_data_{live|staging}`, in this 
`public` means that the data has pii info and `live` in it means, if the table is coming from live data storage or something else. 

and the `suffix` ap in the table name indicates
that the data is in append strategy. 

## About the model `std_orders_ss`
The table name suffix ss indicates that the table is a slowly changing dimension table. 

The table used merge strategy. It appends the new order_id and status or updates the 
old order_ids and status. And combination of order_id and status are unique in this table.
In this model we are type casting the column and cleaning the column names accordingly
{% enddocs %}
