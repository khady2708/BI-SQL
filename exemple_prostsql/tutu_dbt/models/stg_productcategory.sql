{{ config(materialized='table', schema = 'staging') }}


select 
    productcategoryid as productcategory_id,
    name
from {{ source('dwh_raw', 'productcategory') }} 