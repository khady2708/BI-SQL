{{ config(materialized='table',schema = 'core') }}

select

    fact_sales.salesorder_id,
    fact_sales.orderqty,
	fact_sales.unitprice,
	fact_sales.productid,
    fact_sales.shiptoaddress_id,
	fact_sales.onlineorderflag,
	fact_sales.creditcard_id,
    fact_sales.fainalll,
	fact_sales.totaldue,
	fact_sales.customer_id,
    dim_product.product_id,
	dim_product.name,
	dim_product.safetystocklevel,
    dim_product.finishedgoodsflag,
    dim_product.goods_flag,
    dim_product.productnumber,
    dim_product.reorderpoint, 
    dim_product.weight,
    dim_product.color,
    dim_product.sell_start_date,
    dim_product.productcategory_id,
    dim_product.name_product_category,
    dim_product.productsubcategory_id,
    dim_product.name_subproduct_category,

 
from {{ ref('fact_sales') }}
inner join {{ ref('dim_product') }} on fact_sales.productid = dim_product.product_id

