<!-- markdownlint-disable MD041 -->
{% docs std_trips_ow %}

# std_trips_ow

## About Source Table `public_trip_data_{live|staging}.customer_trip_ap`

Lets assume there is a pyspark etl which reads the logs in parquet from 
s3 location and creates a table in databricks called
`public_trip_data_{live|staging}.customer_trip_ap`
We use this table to create a standardized_layer for analytics purpose

Assumption - We need to assume that new events are fired after every trip finishes.

good to know - the schema name `public_trip_data_{live|staging}`, in this 
`public` means that the data has pii info and `live` in it means, if the table is coming from live data storage or something else. 

and the `suffix` ap in the table name indicates
that the data is in append strategy. 

## About the model `std_trips_ow`
The table name suffix ap indicates that the table is a append table. 

The table used append strategy. It appends the new records into the table.

This table contains all the trips information

In this model we are type casting the column and cleaning the column names accordingly. 
We are also creating a partition column out of trip_end_timestamp to make further 
analysis simpler. 
{% enddocs %}
