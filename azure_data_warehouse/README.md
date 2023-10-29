# Project Title
Building an Azure Data Warehouse for Bike Share Data Analytics
## Getting Started

Instructions for how to get a copy of the project running on your local machine.

### Installation


Install psycopg2 for using with insert data to postgre database
```
pip install psycopg2
```

## Project Instructions

This section should contain all the student deliverables for this project.

Task 1: Create your Azure resources
- Create an Azure Database for PostgreSQL.
- Create an Azure Synapse workspace.
- Use the built-in serverless SQL pool and database within the Synapse workspace

![Create_azure_resource](evidence/01_create_azure_resourse.png)

Task 2: Star-schema design

![Table design](evidence/02_start_schema_design.png)

Task 3: Create the data in PostgreSQL
![Alt text](evidence/03_postgres_data.png)

Task 4: EXTRACT the data from PostgreSQL
![Alt text](evidence/image.png)
![Alt text](evidence/image-1.png)

Task 5: LOAD the data into external tables in the data warehouse

- [payment](./load/load_payment.sql)
- [rider](./load/load_rider.sql)
- [station](./load/load_station.sql)
- [trip](./load/load_trip.sql)

Task 6: TRANSFORM the data to the star schema using CETAS
- [dim_payment](./create_star/dim_payment.sql)
- [dim_rider](./create_star/dim_rider.sql)
- [dim_station](./create_star/dim_station.sql)
- [dim_time](./create_star/dim_time.sql)