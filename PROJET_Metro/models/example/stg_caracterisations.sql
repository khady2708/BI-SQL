{{ config(materialized='table', schema = 'staging') }}

select 
    "FIQ_ORDRE" as ordre,
    "FIQ_PES" as pes, 
    "FIQ_TRA_CODE" as code_circuit,
    "FIQ_DATE_DEPOT"as Date_depôt,
    "FIQ_DATE_TRI" as Date,
    "MATERIAUX"as materiaux,
    "POIDS_VRAC" as poid_vrac,
    "FAMILLE_MATERIAUX" as famille_materiaux

from {{ source('raw_metro', 'caracterisations') }} 