

{{ config(materialized='table', schema = 'staging') }}


select 

	"PRD_CODE" as code_du_flux,

    "PRD_LIBELLE" as libellE_du_flux,

    "PRD_SOURCE" as prd_site


from {{ source('raw_metro', 'dechet') }} 

