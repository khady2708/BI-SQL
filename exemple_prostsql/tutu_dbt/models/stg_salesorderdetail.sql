{{ config(materialized='table', schema = 'staging') }}

select 
	salesorderid as salesorder_id,
	orderqty,
	salesorderdetailid as salesorderdetail_id,
	unitprice,
	productid 	
from {{ source('dwh_raw', 'salesorderdetail') }} 