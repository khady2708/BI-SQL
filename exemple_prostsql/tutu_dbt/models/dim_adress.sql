{{ config(materialized='table', schema = 'core') }}



with addresse as (

    SELECT 
        addressid, 
        city,
        postalcode
    FROM {{ ref('stg_address') }} 
),


state_province as (
   select 
        stateprovinceid,
        name,
        territoryid
    FROM {{ ref('stg_stateprovince') }}
)

-- selection finale 

SELECT 
    addresse.addressid, 
    addresse.city,
    addresse.postalcode,
    country_region.country_region_code,
    state_province.stateprovinceid,
    state_province.territoryid,
    country_region.name



FROM addresse
LEFT JOIN state_province ON country_region.name= state_province.name
