<!-- markdownlint-disable MD041 -->
{% docs std_airplane_model_ow %}

# std_airplane_model_ow

## About Source Table `public_airplane_data_{live|staging}.airplane_model_ap`

Lets assume there is a pyspark etl which reads the json from 
s3 location and creates a table in databricks called
`public_airplane_data_{live|staging}.airplane_model_ap`
We use this table to create a standardized_layer for analytics purpose

good to know - the schema name `public_airplane_data_{live|staging}`, in this 
`public` means that the data has nonpii info and `live` in it means, if the table is coming from live data storage or something else. 

and the `suffix` ap in the table name indicates
that the data is in append strategy. 

## About the model `std_airplane_model_ow`
This table contains information about the plane and its specifications.

It is an overwrite table, meaning that the table will full refresh according to 
the schedule. 

{% enddocs %}



