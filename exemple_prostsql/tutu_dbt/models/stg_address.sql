
{{ config(materialized='table', schema = 'staging') }}


select distinct 
    addressid, 
    city,
    postalcode
from {{ source('dwh_raw', 'address') }}