{{ config(materialized='table') }}

WITH t_data AS (
  SELECT DISTINCT
    `promotion-ids` AS promotion_id
  FROM
    `dibimbing-435704.dibimbing.amazon_sale_report`
)

SELECT 
  {{ dbt_utils.generate_surrogate_key([
      'promotion_id'
    ]) }} as promotion_key, *
FROM t_data
