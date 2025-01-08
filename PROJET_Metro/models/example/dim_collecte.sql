 {{ config(materialized='table', schema = 'core') }}

 select
	code_circuit,
	immat,
	date_collecte,
	mission,
	--nom_circuit,
	temps_d_activite,
	temps_d_arret
	flux_circuit
from {{ ref('stg_collecte') }}
