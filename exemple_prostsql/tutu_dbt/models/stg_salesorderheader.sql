{{ config(materialized='table', schema = 'staging') }}
select 
	salesorderid,
	shiptoaddressid as shiptoaddress_id,
	onlineorderflag,
	territoryid as territory_id,
	subtotal,
	creditcardid as creditcard_id,
	freight,
	totaldue,
	customerid as customer_id,
	salespersonid as salesperson_id
from {{ source('dwh_raw', 'salesorderheader') }} 