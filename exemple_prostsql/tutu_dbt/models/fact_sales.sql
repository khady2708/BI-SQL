{{ config(materialized='table', schema = 'core') }}


with sales_order_detail as (
    SELECT 
        salesorder_id,
	    orderqty,
	    salesorderdetail_id,
	    unitprice,
	    productid 
    FROM {{ ref('stg_salesorderdetail') }} 
),

sales_order_header as (
    SELECT
		salesorderid,
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
    sales_order_detail.salesorder_id,
    sales_order_detail.orderqty,
	sales_order_detail.unitprice,
	sales_order_detail.productid,
    sales_order_header.shiptoaddress_id,
	sales_order_header.onlineorderflag,
	sales_order_header.creditcard_id,
	sales_order_header.freight as fainalll,
	sales_order_header.totaldue,
	sales_order_header.customer_id
   
   

FROM sales_order_detail 
INNER JOIN sales_order_header ON sales_order_header.salesorderid = sales_order_detail.salesorder_id
