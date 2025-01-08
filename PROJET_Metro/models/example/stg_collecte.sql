{{ config(materialized='table', schema='staging') }}



SELECT

    "CODE_CIRCUIT" as code_circuit,

    "IMMAT" as immat,

    "DATE_COLLECTE"::date as date_collecte,

    "MISSION" as mission,

    --"LIBELLE_CIRCUIT" as nom_circuit,

    SUM("TEMPS_D_ACTIVITE") as temps_d_activite,

    SUM("TEMPS_D_ARRET") as temps_d_arret,

    SUM("TEMPS_D_ACTIVITE" + "TEMPS_DE_MARCHE_ARRIERE") as temps_collecte_seconde,

    SUM("KM_D_ACTIVITE" + "KM_DE_MARCHE_ARRIERE" )as distance_collecte_km,

    "FLUX_CIRCUIT" as flux_circuit





FROM {{ source('raw_metro', 'collecte') }}
WHERE "MISSION" = 'Collecte' OR  "MISSION" = 'Collecte PAV'
GROUP BY date_collecte, code_circuit, immat, mission, flux_circuit










--CODE CIRCUIT(5041 valeurs manquantes pour 12 055 lignes) donc on prend uniquement les valeurs WHERE mission = 'Collecte' ou 'Collecte PAV' AND CODE_CIRCUIT IS NOT NULL

--IMMAT

--

--LIBELLE CIRCUIT (changer les NaN par nom inconnu)



--DATE COLLECTE(changer en format date)

--TEMPS_D_ACTIVITE (faire une division par 3600 pour avoir le temp en heures ou par 60 pour avoir le temp en minutes(minute est peut etre plus précis pour des comparaisons)) et faire SUM avec TEMPS_D_ARRET et renommer en TEMPS_DE_COLLECTE

--KM_D_ACTIVITE (il faut SUM avec KM_MARCHE_ARRIERE) et renommer en DISTANCE_DE_COLLECTE

--SECTEUR_CIRCUIT

--

--