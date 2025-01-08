{{ config(materialized='table', schema = 'staging') }}


select 
	businessentityid as businessentity_id,
	storename,
	salespersonid as salesperson_id
from {{ source('dwh_raw', 'store') }} 
