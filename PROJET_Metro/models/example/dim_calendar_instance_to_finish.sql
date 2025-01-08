   {{ config(materialized='table', schema = 'core') }}
   
    SELECT TO_CHAR(datum, 'yyyymmdd')::BIGINT AS sid,
       datum AS date_actual,
       TO_CHAR(datum, 'Day') AS day_name,
       EXTRACT(ISODOW FROM datum) AS day_of_week,
       EXTRACT(DAY FROM datum) AS day_of_month,
       EXTRACT(ISOYEAR FROM datum) || TO_CHAR(datum, '"-W"IW-') || EXTRACT(ISODOW FROM datum) AS week_of_year_iso,
       CASE
           WHEN EXTRACT(QUARTER FROM datum) = 1 THEN 'First'
           WHEN EXTRACT(QUARTER FROM datum) = 2 THEN 'Second'
           WHEN EXTRACT(QUARTER FROM datum) = 3 THEN 'Third'
           WHEN EXTRACT(QUARTER FROM datum) = 4 THEN 'Fourth'
           END AS quarter_name,
       TO_CHAR(datum, 'mmyyyy') AS mmyyyy,
       TO_CHAR(datum, 'mmddyyyy') AS mmddyyyy

        
        

    FROM (
SELECT dat::DATE as datum
FROM GENERATE_SERIES('2010-01-01'::DATE, now()::DATE, '1 day') dat
    ) DQ
    ORDER BY 1