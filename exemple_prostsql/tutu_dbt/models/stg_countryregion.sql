{{ config(materialized='table',schema = 'staging') }}


select distinct 
    countryregioncode as country_region_code,
    name 
from {{ source('dwh_raw', 'countryregion') }} 