 {{ config(materialized='table', schema = 'core') }}

 select
	code_circuit,
	immat,
    date_levee
from {{ ref('stg_levees') }}