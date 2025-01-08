{{ config(materialized='table', schema = 'staging') }}


select 
    businessentityid as businessentity_id,
    firstname || ' ' || lastname AS full_name,
    case
    when persontype = 'EM' then 'Employée'
    when persontype = 'SC' then 'Store contact'
    when persontype = 'IN' then 'Individual'
    when persontype = 'SP' then 'sales person'
    when persontype = 'VC' then 'Vendor contact'
    when persontype = 'GC' then 'General conact'
    end as persontype,
    rowguid,
    emailpromotion
from {{ source('dwh_raw', 'person') }} 