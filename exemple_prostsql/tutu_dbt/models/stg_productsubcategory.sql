{{ config(materialized='table',schema = 'staging') }}


select distinct 
   productsubcategoryid as productsubcategory_id,
   productcategoryid as productcategory_id, 
   name
from {{ source('dwh_raw', 'productsubcategory') }} 