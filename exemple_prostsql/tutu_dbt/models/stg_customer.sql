{{ config(materialized='table', schema = 'staging') }}


select 
    customerid as customer_id,
    storeid as store_id,
    territoryid as territory_id
from {{ source('dwh_raw', 'customer') }} 