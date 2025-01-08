
{{ config(materialized='table', schema = 'staging') }}

select 
	salesreasonid as sales_reason_id, 
	name,
	reasontype
from {{ source('dwh_raw', 'salesreason') }} 