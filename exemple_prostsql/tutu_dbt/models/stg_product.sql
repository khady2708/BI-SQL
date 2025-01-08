{{ config(materialized='table', schema = 'staging') }}

SELECT 
	productid as product_id,
	name,
	safetystocklevel,
    finishedgoodsflag,
    case
    when finishedgoodsflag = 'f' then 'finished'
    when finishedgoodsflag = 't' then 'transformation'
    end as goods_flag,
    productnumber,
    reorderpoint, 
	NULLIF(productsubcategoryid, '')::integer as productsubcategory_id,
    weight,
    COALESCE(NULLIF(color, ''), 'pas de couleur') AS color,
    sellstartdate as sell_start_date
from {{ source('dwh_raw', 'product') }} 