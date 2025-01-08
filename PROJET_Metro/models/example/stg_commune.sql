{{ config(materialized='table', schema = 'staging') }}


select 
	"CODE_INSEE" as code_insee,
	"NOM_COMMUNE" as nom_commune,
	"POPULATION_TOTALE" as total_population
from {{ source('raw_metro', 'commune') }} 