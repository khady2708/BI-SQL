{{ config(materialized='table', schema = 'staging') }}


select 
	"CODE_TRANSPORTEUR" as code_circuit,
	case
		when "MODALITE_COLLECTE" = 'PAV' then 'Point_dapport_Volontaire'
		when "MODALITE_COLLECTE" = 'PAP' then 'Porte_à_port'
	end as modalite_collecte,
	"NATURE_COLLECTE" as nature_collecte,
	"SECTEUR_COLLECTE" as secteur_collecte
from {{ source('raw_metro', 'transporteur') }} 