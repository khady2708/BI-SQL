   {{ config(materialized='table', schema = 'core') }}

--on essaye de regroupé dechet et pesse

with pesee as (
    SELECT 
	    date_entree,
        poids_total_net,
        code_circuit
    FROM {{ ref('stg_pesee') }} 
),


collecte as (
    SELECT
       code_circuit,
       immat,
       date_collecte,
       mission,
       --nom_circuit,
       temps_collecte_seconde,
       distance_collecte_km

    FROM {{ ref('stg_collecte') }} 
),

levee as (
    SELECT
        immat,
        date_levee,
        code_circuit,
        nombre_total_levee

    FROM {{ ref('stg_levees') }}
)

SELECT
    pesee.date_entree,
    pesee.poids_total_net,
    pesee.code_circuit,
    collecte.immat,
    collecte.date_collecte,
    collecte.mission,
   -- collecte.nom_circuit,
    collecte.temps_collecte_seconde,
    collecte.distance_collecte_km,
    levee.date_levee,
    levee.nombre_total_levee
    
FROM pesee
LEFT JOIN collecte ON collecte.code_circuit = pesee.code_circuit AND collecte. date_collecte = pesee.date_entree
LEFT JOIN levee ON levee.code_circuit = collecte.code_circuit AND levee.immat = collecte.immat