{{ config(materialized='table', schema = 'staging') }}


select 
    stateprovinceid,
    countryregioncode,
    rowguid,
    name,
    territoryid,
    stateprovincecode,
    isonlystateprovinceflag

from {{ source('dwh_raw', 'stateprovince') }} 