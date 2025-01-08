{{ config(materialized='table', schema = 'core') }}



with product as (

    SELECT 
        product_id,
	    name,
	    safetystocklevel,
        finishedgoodsflag,
        goods_flag,
        productnumber,
        reorderpoint, 
	    productsubcategory_id,
        weight,
        sell_start_date,
        color
    FROM {{ ref('stg_product') }} 
),

product_category as (
    SELECT
        productcategory_id,
        name
    FROM {{ ref('stg_productcategory') }} 

),

product_sub_category as (
    SELECT
        productsubcategory_id,
        productcategory_id,
        name
    FROM {{ ref('stg_productsubcategory') }}
)



    

-- selection finale 

SELECT 
    product.product_id,
	product.name,
	product.safetystocklevel,
    product.finishedgoodsflag,
    product.goods_flag,
    product.productnumber,
    product.reorderpoint, 
    product.weight,
    product.color,
    product.sell_start_date,
    product_category.productcategory_id,
    product_category.name as name_product_category,
    product_sub_category.productsubcategory_id,
    product_sub_category.name as name_subproduct_category

FROM product 
LEFT JOIN product_sub_category ON product_sub_category.productsubcategory_id = product.productsubcategory_id
LEFT JOIN product_category ON product_category.productcategory_id = product_sub_category.productcategory_id


