 {{ config(materialized='table', schema = 'core') }}

 select
	code_circuit,
	modalite_collecte,
    nature_collecte,
    secteur_collecte
from {{ ref('stg_transporteur') }}