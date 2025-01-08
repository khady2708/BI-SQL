{{ config(materialized='table', schema = 'staging') }}

select 

	"IMMAT" as immat,

	CAST("DATE_LEVEE" as DATE) as date_levee,

	"CODE_CIRCUIT" as code_circuit,

	SUM("NB_LEVEES") as nombre_total_levee

from {{ source('raw_metro', 'levees') }} 

GROUP BY date_levee, code_circuit, immat