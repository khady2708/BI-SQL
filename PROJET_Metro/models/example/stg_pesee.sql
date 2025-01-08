{{ config(materialized='table', schema = 'staging') }}


select 
	TO_DATE("PES_DATE_ENTREE", 'DD/MM/YYYY') as date_entree,

	--"PES_POIDS_BRUT" as pes_poids_brut,

	SUM("PES_POIDS_NET") as poids_total_net,

	"PES_TRA_ID" as code_circuit,

	AVG(CAST("PES_HEURE_SORTIE" as time) - CAST("PES_HEURE_ENTREE" as time))  as mean_temps_pesee

from {{ source('raw_metro', 'pesee') }} 

WHERE "PES_SOURCE" = 'ATHANOR'

GROUP BY date_entree, code_circuit