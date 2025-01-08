{{ config(materialized='table', schema = 'core') }}



with customer as (
    
    SELECT 
        customer_id,
        store_id,
        territory_id
    FROM {{ ref('stg_customer') }} 
),

sales_order_header as (
    SELECT
        shiptoaddress_id,
	    onlineorderflag,
	    territory_id,
	    subtotal,
	    creditcard_id,
	    freight,
	    totaldue,
	    customer_id,
	    salesperson_id
    FROM {{ ref('stg_salesorderheader') }} 

)

 

-- selection finale 

SELECT 
    customer.customer_id,
    customer.store_id,
    customer.territory_id,
    sales_order_header.shiptoaddress_id,
	sales_order_header.onlineorderflag,
	sales_order_header.subtotal,
	sales_order_header.creditcard_id,
	sales_order_header.freight,
    sales_order_header.totaldue,
	sales_order_header.salesperson_id

FROM customer
LEFT JOIN sales_order_header ON customer.customer_id= sales_order_header.territory_id



